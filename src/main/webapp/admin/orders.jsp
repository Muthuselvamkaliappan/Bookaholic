<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Book_Order" %>
<%@ page import="com.DAO.BookOrderImpl" %>
<%@ page import="com.DB.DBConnect" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Order History</title>
<%@include file="allCss.jsp" %>
<style>
    body {
        background-color: #1F7D53;
        font-family: 'Arial', sans-serif;
    }
    h3.text-center {
        margin-top: 20px;
        font-size: 2.5rem;
        font-weight: bold;
        color: #F8F9FA;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }
    .table {
        margin-top: 20px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .table thead {
        background-color: #27391C;
        color: #ffffff;
    }
    .table tbody tr:hover {
        background-color: rgba(39, 57, 28, 0.1);
        transition: background-color 0.3s ease-in-out;
    }
    .btn-primary {
        background-color: #255F38;
        border-color: #255F38;
        transition: background-color 0.3s, transform 0.3s;
    }
    .btn-primary:hover {
        background-color: #1F7D53;
        transform: translateY(-2px);
    }
    .btn-danger {
        background-color: #f44336;
        border-color: #f44336;
        transition: background-color 0.3s, transform 0.3s;
    }
    .btn-danger:hover {
        background-color: #d32f2f;
        transform: translateY(-2px);
    }
    .text-danger {
        color: #f44336;
        font-size: 1.2rem;
    }
    .text-center {
        color: #27391C;
    }
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

<div class="container mt-4">
    <h3 class="text-center"><i class="fa-solid fa-file-invoice-dollar"></i> Order History</h3>
    <table class="table table-striped mt-4">
        <thead>
            <tr>
                <th scope="col">Order ID</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Phone no</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
            </tr>
        </thead>
        <tbody>
        <%
            BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
            List<Book_Order> blist = dao.getAllOrder();

            if (blist != null && !blist.isEmpty()) {
                for (Book_Order b : blist) {
        %>
                    <tr>
                        <th scope="row"><%= b.getOrderId() %></th>
                        <td><%= b.getUserName() %></td>
                        <td><%= b.getEmail() %></td>
                        <td><%= b.getFulladd() %></td>
                        <td><%= b.getPhno() %></td>
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
                    <td colspan="9" class="text-center text-danger">No orders found</td>
                </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<div class="mt-5">
    <%@include file="footer.jsp" %>
</div>

</body>
</html>