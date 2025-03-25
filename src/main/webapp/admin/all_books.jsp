<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Book Gallery</title>
<%@include file="allCss.jsp"%>
<style>
body {
	background-color: #1F7D53;
	font-family: 'Arial', sans-serif;
}

h3.text-center {
	margin-top: 20px;
	font-size: 2.5rem;
	font-weight: bold;
	color: #FFD2A0;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
}

.table-container {
	margin-top: 30px;
	padding: 20px;
	background-color: #27391C;
	border-radius: 15px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.table {
	background-color: #255F38;
	border-radius: 10px;
	color: #F8F9FA;
}

.table thead {
	background-color: #6c757d; /* Keep the gray header */
	color: #000000 !important; /* Change text to black */
}

.table tbody tr td {
	color: #fff; /* Ensure uniform black text for all rows */
}

.table tbody tr:hover {
	background-color: #1F7D53;
}

.btn-primary {
	background-color: #FFD2A0;
	border-color: #FFD2A0;
	color: #18230F;
	transition: background-color 0.3s, transform 0.3s;
}

.btn-primary:hover {
	background-color: #FFC078;
	transform: translateY(-2px);
}

.btn-danger {
	background-color: #F44336;
	border-color: #F44336;
	transition: background-color 0.3s, transform 0.3s;
}

.btn-danger:hover {
	background-color: #D32F2F;
	transform: translateY(-2px);
}

.text-success {
	color: #4CAF50;
	font-size: 1.2rem;
}

.text-danger {
	color: #F44336;
	font-size: 1.2rem;
}

img {
	border-radius: 8px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<h3 class="text-center">
		<i class="fa-solid fa-book-open"></i> Book Gallery
	</h3>

	<c:if test="${not empty succMsg}">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container table-container">
		<table class="table table-striped text-center">
			<thead>
				<tr>
					<th>ID</th>
					<th>Image</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Price</th>
					<th>Category</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> list = dao.getAllBooks();

            if (list == null || list.isEmpty()) {
                out.println("<tr><td colspan='8' class='text-center'>No books available.</td></tr>");
            } else {
                for (BookDtls b : list) {
            %>
				<tr>
					<td><%= b.getBookId() %></td>
					<td><img src="../Book/<%= b.getPhotoName() %>" width="50"></td>
					<td><%= b.getBookName() %></td>
					<td><%= b.getAuthor() %></td>
					<td>₹<%= b.getPrice() %></td>
					<td><%= b.getBookCategory() %></td>
					<td><%= b.getStatus() %></td>
					<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-primary"><i
							class="fa-solid fa-pen-to-square"></i> Edit</a> <a
						href="${pageContext.request.contextPath}/admin/deletebook?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger"
						onclick="return confirm('Are you sure you want to delete this book?');"><i
							class="fas fa-trash-alt"></i> Delete </a></td>
				</tr>
				<%
                }
            }
            %>
			</tbody>
		</table>
	</div>

	<div style="margin-top: 110px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
