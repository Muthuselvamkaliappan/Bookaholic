package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/admin/deletebook")  
public class DeleteBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           
            String idStr = request.getParameter("id");
            int id = Integer.parseInt(idStr);

        
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

            
            boolean success = dao.deleteBook(id);

            HttpSession session = request.getSession();
            if (success) {
                session.setAttribute("succMsg", "Book deleted successfully.");
            } else {
                session.setAttribute("failedMsg", "Failed to delete book.");
            }

           
            response.sendRedirect(request.getContextPath() + "/admin/all_books.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/all_books.jsp");
        }
    }
}
