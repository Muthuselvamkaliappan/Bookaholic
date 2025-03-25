<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Registration</title>
<%@include file="all_Component/allCss.jsp" %>
<style>
    /* Global styles */
    body {
        background-color: #e0f7fa; /* Light cyan background */
        font-family: 'Arial', sans-serif;
        color: #18230F; /* Dark Green for text */
    }

    /* Card Styles */
    .card {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s, box-shadow 0.3s;
        border-radius: 10px;
        border: none;
        background-color: #ffffff;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    /* Button Styles */
    .btn-primary {
        background-color: #255F38; /* Green */
        border-color: #255F38;
        transition: background-color 0.3s, transform 0.3s;
        font-weight: bold;
    }

    .btn-primary:hover {
        background-color: #1F7D53; /* Teal */
        transform: translateY(-2px);
    }

    /* Focus Effects */
    .form-control:focus {
        border-color: #255F38;
        box-shadow: 0 0 5px rgba(37, 95, 56, 0.5);
    }

    /* Card Body Styles */
    .card-body {
        padding: 2rem;
        background-color: #ffffff;
        border-radius: 10px;
    }

    /* Text and Heading Styles */
    .header-title {
        color: #255F38; /* Green */
        margin-bottom: 2rem;
        font-size: 1.5rem;
        font-weight: bold;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* Added shadow */
    }

    .text-center {
        margin-bottom: 1rem;
    }

    /* Custom Link styles */
    .register-link {
        text-decoration: none;
        color: #255F38; /* Green */
        transition: color 0.3s;
        font-weight: bold;
    }

    .register-link:hover {
        color: #1F7D53; /* Teal */
    }

    /* Spacing */
    .mt-5 {
        margin-top: 5rem !important;
    }

    .w-100 {
        width: 100%;
    }

    /* Form input styles */
    .form-label {
        font-size: 1rem;
        color: #27391C; /* Dark Olive */
    }

    .form-control {
        border-radius: 5px;
        border: 1px solid #27391C; /* Dark Olive */
    }

    .form-control:focus {
        border-color: #1F7D53; /* Teal */
    }

    /* Custom Checkbox styles */
    .form-check-input:checked {
        background-color: #255F38; /* Green */
        border-color: #255F38;
    }

    .form-check-label {
        color: #27391C; /* Dark Olive */
        font-size: 0.9rem;
    }

    /* Registration Text styles */
    .account-text {
        text-align: center;
        font-size: 1rem;
        margin-top: 20px;
    }

    .account-text a {
        text-decoration: none;
        color: #255F38;
        font-weight: bold;
        transition: color 0.3s ease-in-out;
    }

    .account-text a:hover {
        color: #1F7D53; /* Teal */
    }

</style>
</head>
<body>
<%@include file="all_Component/navbar.jsp" %>

<div class="container p-2 mt-4">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center header-title">Register</h3>

                    <c:if test="${not empty succMsg }">
                        <p class="text-center text-success">${succMsg }</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty failedMsg }">
                        <p class="text-center text-danger">${failedMsg }</p>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                    <form action="register" method="post">
                        <div class="mb-3">
                            <label for="exampleInputName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="exampleInputName" placeholder="username" required="required" name="fname">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="email id" required="required" name="email">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPhone" class="form-label">Mobile</label>
                            <input type="number" class="form-control" id="exampleInputPhone" placeholder="phone no" required="required" name="phno">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword" placeholder="password" required="required" name="password">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                            <label class="form-check-label" for="exampleCheck1">Agree Terms & Conditions</label>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>
