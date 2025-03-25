<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Login</title>
<%@include file="all_Component/allCss.jsp" %>
<style>
    body {
        background-color: #e0f7fa; /* Light cyan background */
        font-family: 'Arial', sans-serif;
    }
    .card {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s, box-shadow 0.3s;
        border-radius: 10px;
        border: none;
    }
    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }
    .btn-primary {
        background-color: #00796b; /* Teal color */
        border-color: #00796b;
        transition: background-color 0.3s, transform 0.3s;
    }
    .btn-primary:hover {
        background-color: #004d40;
        transform: translateY(-2px);
    }
    .form-control:focus {
        border-color: #00796b;
        box-shadow: 0 0 5px rgba(0, 121, 107, 0.5);
    }
    .card-body {
        padding: 2rem;
        background-color: #ffffff;
        border-radius: 10px;
    }
    .text-center {
        margin-bottom: 1rem;
    }
    .header-title {
        color: #00796b;
        margin-bottom: 2rem;
        font-size: 1.5rem;
    }
    .register-link {
        text-decoration: none;
        color: #00796b;
        transition: color 0.3s;
    }
    .register-link:hover {
        color: #004d40;
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
                    <h3 class="text-center header-title">Login here!</h3>

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
                            <a href="register.jsp" class="register-link d-block mt-3">Create an Account</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="all_Component/footer.jsp" %>

</body>
</html>