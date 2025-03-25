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
        background-color: #1F7D53; /* Teal background */
        font-family: 'Arial', sans-serif;
    }

    .container {
        background-color: #255F38; /* Dark green card */
        padding: 50px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        margin-top: 50px;
        color: #FFD2A0; /* Light accent color */
    }

    .fa-circle-check {
        margin-bottom: 20px;
        color: #FFD2A0; /* Gold check icon */
    }

    h1 {
        color: #FFD2A0; /* Light accent color */
        margin-bottom: 20px;
        font-size: 2.5rem;
        font-weight: bold;
    }

    h2 {
        color: #F8F9FA; /* Light gray */
        margin-bottom: 20px;
        font-size: 2rem;
    }

    h5 {
        color: #D1E7DD; /* Softer green */
        margin-bottom: 30px;
        font-size: 1.2rem;
    }

    .btn-custom {
        padding: 12px 20px;
        font-size: 1rem;
        border-radius: 5px;
        transition: all 0.3s ease-in-out;
        font-weight: bold;
    }

    .btn-primary {
        background-color: #27391C; /* Olive Green */
        border: none;
        color: #FFD2A0;
    }

    .btn-primary:hover {
        background-color: #18230F; /* Darker shade */
        transform: translateY(-2px);
    }

    .btn-danger {
        background-color: #FFD2A0; /* Warm Accent */
        border: none;
        color: #18230F; /* Dark contrast */
    }

    .btn-danger:hover {
        background-color: #FFC078;
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