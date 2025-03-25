<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.DAO.BookOrderImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.Book_Order" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<%@include file="all_Component/allCss.jsp"%>
<style>
   body {
    font-family: 'Arial', sans-serif;
}

.container {
    margin-top: 50px;
    background-color: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

.orders-header {
    font-weight: bold;
    font-size: 1.8rem;
    color: #1F7D53; /* Your Theme Color */
    text-align: center;
    text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.3);
}

.orders-header i {
    margin-right: 10px;
}

.table {
    margin-top: 30px;
    border-radius: 10px;
    overflow: hidden;
}

.table thead {
    background-color: #255F38; /* Dark Green Theme Color */
    color: #ffffff;
}

.table th, .table td {
    vertical-align: middle;
    padding: 12px;
}

.table tbody tr:hover {
    background-color: #f1f1f1;
    transition: 0.3s ease-in-out;
}

.no-orders {
    color: #D9534F; /* Softer Red for Error Messages */
    font-weight: bold;
    font-size: 1.2rem;
}

</style>
</head>
<body>
<%@include file="all_Component/navbar.jsp"%>

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>

<div class="container">
    <h3 class="text-center orders-header">
        <i class="fa fa-shopping-cart"></i> Your Orders
    </h3>
    <table class="table table-striped mt-5">
        <thead>
            <tr>
                <th scope="col">Order ID</th>
                <th scope="col">Name</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
            </tr>
        </thead>
        
        <tbody>
        <%
            User u = (User) session.getAttribute("userobj");

            if (u == null) {
                response.sendRedirect("login.jsp");
            } else {
                BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
                List<Book_Order> blist = dao.getBook(u.getEmail());

                if (blist != null && !blist.isEmpty()) {
                    for (Book_Order b : blist) { 
        %>
                        <tr>
                            <th scope="row"><%= b.getOrderId() %></th>
                            <td><%= u.getName() %></td>
                            <td><%= b.getBookName() %></td>
                            <td><%= b.getAuthor() %></td>
                            <td>₹<%= b.getPrice() %></td>
                            <td><%= b.getPaymentType() %></td>
                        </tr>
        <%
                    }
                } else {
        %>
                    <tr>
                        <td colspan="6" class="text-center no-orders">No orders found</td>
                    </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>