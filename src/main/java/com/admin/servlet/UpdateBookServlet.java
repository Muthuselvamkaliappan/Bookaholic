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
import com.entity.BookDtls;

@WebServlet("/admin/updatebook")
public class UpdateBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String bookName = request.getParameter("bname");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String status = request.getParameter("status");

        BookDtls b = new BookDtls();
        b.setBookId(id);
        b.setBookName(bookName);
        b.setAuthor(author);
        b.setPrice(price);
        b.setStatus(status);

        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        boolean success = dao.updateBook(b);

        HttpSession session = request.getSession();
        if (success) {
            session.setAttribute("succMsg", "Book Updated Successfully.");
            response.sendRedirect("all_books.jsp");
        } else {
            session.setAttribute("failedMsg", "Something went wrong.");
            response.sendRedirect("edit_books.jsp?id=" + id);
        }
    }
}
