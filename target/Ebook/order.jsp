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
        background-color: #f0f1f2;
        font-family: 'Arial', sans-serif;
    }
    .container {
        margin-top: 50px;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .table {
        margin-top: 30px;
    }
    .table th, .table td {
        vertical-align: middle;
    }
    .table thead {
        background-color: #00796b;
        color: #ffffff;
    }
    .no-orders {
        color: #d32f2f;
        font-weight: bold;
    }
    .orders-header {
        font-weight: bold;
        color: #00796b;
        display: flex;
        align-items: center;
    }
    .orders-header i {
        margin-right: 10px;
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