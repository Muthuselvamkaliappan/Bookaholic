<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Login</title>
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

    /* Register Link */
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

    /* Custom Link styles */
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

<div class="container mt-5 p-2">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center header-title">Login</h3>

                    <c:if test="${not empty failedMsg }">
                        <h5 class="text-center text-danger">${failedMsg }</h5>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty succMsg }">
                        <h5 class="text-center text-success">${succMsg }</h5>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <form action="login" method="post">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary w-100">Login</button><br>
                        </div>
                    </form>

                    <div class="account-text">
                        <p>Don't you have an account? <a href="register.jsp">Create one</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
