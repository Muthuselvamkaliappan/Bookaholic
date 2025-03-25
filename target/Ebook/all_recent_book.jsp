<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Books</title>
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

<%
User u = (User)session.getAttribute("userobj");
%>

<%@include file="all_Component/navbar.jsp"%>

<div class="container-fluid">
    <div class="row">
        <%
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> recentBooks = dao.getRecentBooks();
            for (BookDtls b : recentBooks) {
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
                    
                    <div class="d-flex justify-content-between mt-2">
                        <% if (u == null) { %>
                            <a href="login.jsp" class="btn btn-custom btn-sm flex-fill mx-1">
                                <i class="fa-solid fa-cart-plus"></i> Add
                            </a>
                        <% } else { %>
                            <a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
                               class="btn btn-custom btn-sm flex-fill mx-1">
                                <i class="fa-solid fa-cart-plus"></i> Add
                            </a>
                        <% } %>
                        <a href="view_books.jsp?bid=<%= b.getBookId()%>" class="btn btn-custom btn-sm flex-fill mx-1">
                            <i class="fa-solid fa-eye"></i> View
                        </a>
                        <a href="#" class="btn btn-price btn-sm flex-fill mx-1">
                            ₹<%=b.getPrice()%>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <% } %>
    </div>
</div>

</body>
</html>