package com.admin.servlet;

import java.io.IOException;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Get form data
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String bookCategory = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName(); // Get filename

			// Define the folder where images will be stored
			String uploadPath = getServletContext().getRealPath("") + "images";
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir(); // Create 'images' folder if it does not exist
			}

			// Save image file to 'images' directory
			File filePath = new File(uploadDir, fileName);
			try (InputStream input = part.getInputStream()) {
				Files.copy(input, filePath.toPath(), StandardCopyOption.REPLACE_EXISTING);
			}

			// Create book object
			BookDtls book = new BookDtls(bookName, author, price, bookCategory, status, fileName, "admin");
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

			HttpSession session = req.getSession();
			boolean f = dao.addBooks(book);

			if (f) {
				session.setAttribute("succMsg", "Book Added Successfully! ");
				resp.sendRedirect("admin/add_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Error: Unable to add the book at this time");
				resp.sendRedirect("admin/add_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
