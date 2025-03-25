package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("userobj");

            if (user == null) {
                session.setAttribute("failedMsg", "Please login first.");
                resp.sendRedirect(req.getContextPath() + "/login.jsp");
                return;
            }

            int uid = user.getId();
            String bidParam = req.getParameter("bid");
            String cidParam = req.getParameter("cid"); // Optional, depending on your logic

            if (bidParam == null || bidParam.trim().isEmpty()) {
                session.setAttribute("failedMsg", "Invalid book ID.");
                resp.sendRedirect(req.getContextPath() + "/checkout.jsp");
                return;
            }

            try {
                int bid = Integer.parseInt(bidParam.trim());
                int cid = (cidParam != null && !cidParam.isEmpty()) ? Integer.parseInt(cidParam.trim()) : -1;

                CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                boolean success = dao.deleteBook(bid, uid, cid);

                if (success) {
                    session.setAttribute("successMsg", "Book removed from cart.");
                } else {
                    session.setAttribute("failedMsg", "Failed to remove book.");
                }

            } catch (NumberFormatException e) {
                session.setAttribute("failedMsg", "Invalid book ID format.");
                e.printStackTrace();
            }

            resp.sendRedirect(req.getContextPath() + "/checkout.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Something went wrong.");
            resp.sendRedirect(req.getContextPath() + "/checkout.jsp");
        }
    }
}
