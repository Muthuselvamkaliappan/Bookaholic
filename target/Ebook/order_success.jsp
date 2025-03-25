<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Placed</title>
<%@include file="all_Component/allCss.jsp"%>
<style>
    body {
        background-color: #f0f1f2;
        font-family: 'Arial', sans-serif;
    }
    .container {
        background-color: #ffffff;
        padding: 50px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-top: 50px;
    }
    .fa-circle-check {
        margin-bottom: 20px;
    }
    h1 {
        color: #00796b;
        margin-bottom: 20px;
    }
    h2 {
        color: #4caf50;
        margin-bottom: 20px;
    }
    h5 {
        color: #757575;
        margin-bottom: 30px;
    }
    .btn-primary {
        background-color: #00796b;
        border-color: #00796b;
        transition: background-color 0.3s, transform 0.3s;
    }
    .btn-primary:hover {
        background-color: #004d40;
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
</style>
</head>
<body>
<%@include file="all_Component/navbar.jsp"%>
<div class="container text-center mt-3">
    <i class="fa-solid fa-circle-check fa-5x text-success"></i>
    <h1>Thank you!</h1>
    <h2>Your Order placed successfully</h2>
    <h5>Within 7 days your product will be delivered to your address</h5>
    <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
    <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
</div>
</body>
</html>