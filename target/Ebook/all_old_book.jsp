<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Old / Inactive Books</title>
    <%@include file="all_Component/allCss.jsp"%>

<style>
    .btn-custom {
        width: 80px;
        height: 40px;
        margin: 0 5px;
        text-align: center;
        background-color: #757575; /* Gray color */
        border: none;
        color: #ffffff;
    }

    .btn-price {
        background-color: #757575; /* Gray color */
        border: none;
        color: #ffffff;
    }

    .crd-ho {
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .crd-ho:hover {
        background-color: #f5f5f5;
        transform: scale(1.05);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
</style>
</head>
<body style="background-color: #f0f0f0;"> <!-- Light gray background -->

<%@include file="all_Component/navbar.jsp"%>

<%
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
    List<BookDtls> oldBooks = dao.getOldBooks(); // Fetching only inactive old books
%>

<div class="container-fluid">
    <div class="row">
        <%
            for (BookDtls b : oldBooks) {
        %>
            <div class="col-md-3 mb-4 mt-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img src="images/<%=b.getPhotoName()%>" 
                             alt="Book Image" 
                             style="height: 200px; width: 150px;" 
                             class="img-thumbnail">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Category: <%=b.getBookCategory()%></p>
                        <div class="d-flex justify-content-center">
                            <a href="view_books.jsp?bid=<%= b.getBookId()%>" class="btn btn-custom btn-sm mx-2"><i class="fa-solid fa-eye"></i> View</a>
                            <a href="#" class="btn btn-price btn-sm mx-2">₹<%=b.getPrice()%></a>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>