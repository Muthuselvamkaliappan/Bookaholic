<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<%@include file="all_Component/allCss.jsp"%>
<style>
    /* Book Name - font shadow and bold */
    .book-name {
        font-weight: bold;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
        color: #4b0082; /* Purple color for book name */
    }

    /* Author Name and Category */
    .author-category {
        color: #2c3e50; /* Dark gray for better readability */
    }

    /* Icon Colors */
    .fa-hand-holding-hand {
        color: #f39c12; /* Yellow for Cash on Delivery */
    }

    .fa-right-left {
        color: #e74c3c; /* Red for Return Available */
    }

    .fa-truck-fast {
        color: #3498db; /* Blue for Free Shipping */
    }
</style>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="all_Component/navbar.jsp"%>

<%
    int bid = Integer.parseInt(request.getParameter("bid"));
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
    BookDtls b = dao.getBookById(bid);
%>

<div class="container p-3 mt-4">
    <div class="row">
        <% if (b != null) { %> 
        <div class="col-md-6 text-center p-5 border bg-white shadow-sm">
            <img src="img/<%=b.getPhotoName() %>" style="height: 300px; width: 200px"><br>
            <h4 class="mt-3 book-name">Book Name: <%=b.getBookName() %></h4>
            <h4 class="author-category">Author: <%=b.getAuthor() %></h4>
            <h4 class="author-category">Category: <%=b.getBookCategory() %></h4>
        </div>

        <div class="col-md-6 p-5 border bg-white shadow-sm">
            <h1 class="mt-3 fw-bold shadow-sm book-name"><%=b.getBookName() %></h1>

            <!-- If the book is inactive, allow request to admin -->
            <% if ("Inactive".equals(b.getStatus())) { %>
                <h5 class="mt-4">Request to Admin</h5>
                <h5>
                    <i class="fa-solid fa-envelope"></i> 
                    <!-- Update the link to open the default email client with pre-filled info -->
                    <a href="mailto:admin@example.com?subject=Request%20for%20Inactive%20Book%20<%=b.getBookName()%>&body=Dear%20Admin,%0A%0AI%20am%20requesting%20more%20information%20about%20the%20inactive%20book%20<%=b.getBookName()%>.%0A%0A%20Thank%20you.%0A%0A%20Best%20Regards,%0A%20<%=b.getBookName()%>" style="text-decoration: none; color: #303f9f;">
                        Email Admin
                    </a>
                </h5>
            <% } %>

            <div class="d-flex justify-content-start gap-3 mt-4"> 
                <div class="col-md-4 text-center p-2">
                    <i class="fa-solid fa-hand-holding-hand fa-2x"></i>
                    <p>Cash on Delivery</p>
                </div>
                <div class="col-md-4 text-center p-2">
                    <i class="fa-solid fa-right-left fa-2x"></i>
                    <p>Return available</p>
                </div>
                <div class="col-md-4 text-center p-2">
                    <i class="fa-solid fa-truck-fast fa-2x"></i>
                    <p>Free shipping</p>
                </div>  
            </div>

            <!-- Buttons Section -->
            <div class="d-flex justify-content-center gap-3 mt-3">
                <% if ("Inactive".equals(b.getStatus())) { %>
                    <a href="index.jsp" class="btn btn-primary btn-sm"><i class="fa-solid fa-cart-plus"></i> Continue Shopping</a>
                <% } else { %>
                    <a href="AddToCartServlet?bid=<%=b.getBookId()%>" class="btn btn-primary btn-sm"><i class="fa-solid fa-cart-plus"></i> Add to Cart</a>
                <% } %>
                <a href="#" class="btn btn-danger btn-sm">₹ <%=b.getPrice() %></a>
            </div>
        </div>
        <% } else { %>
            <div class="col-md-12 text-center bg-white p-5 shadow-sm">
                <h3 class="text-danger">Book Not Found</h3>
                <a href="index.jsp" class="btn btn-primary">Go Back</a>
            </div>
        <% } %>
    </div>
</div>

<%@include file="all_Component/footer.jsp"%>
</body>
</html>
