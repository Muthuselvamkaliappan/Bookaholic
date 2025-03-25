<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Settings</title>
    <%@include file="all_Component/allCss.jsp"%>

    <style>
       /* Full Page Layout */
body {
    background-color: #FFFFFF; /* White Background */
    min-height: 100vh;
    margin: 0;
    display: flex;
    flex-direction: column;
    font-family: 'Arial', sans-serif;
    color: #27391C; /* Dark Olive for text */
}

/* Links */
a {
    text-decoration: none;
    color: #255F38; /* Green */
}

a:hover {
    text-decoration: none;
    color: #1F7D53; /* Teal */
}

/* Glass Effect Container */
.glass-effect {
    background: rgba(255, 255, 255, 0.9); /* Soft White */
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

/* User Greeting */
.hello-user {
    font-size: 3rem;
    color: #1F7D53; /* Teal */
    text-align: center;
    margin-bottom: 20px;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
}

/* Card Design */
.card {
    background-color: #255F38; /* Green */
    color: #FFD2A0; /* Warm Accent */
    border: none;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.15);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    border-radius: 10px;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 4px 4px 15px rgba(0, 0, 0, 0.2);
}

/* Icons */
.icon {
    color: #FFD2A0; /* Warm Accent */
    margin-bottom: 10px;
}

    </style>
</head>
<body>

    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"/>
    </c:if>

    <%@include file="all_Component/navbar.jsp"%>

    <div class="container">
        <div class="glass-effect">
            <h1 class="hello-user">Hello, ${userobj.name}!</h1>

            <!-- Single Column Layout for Vertical Order -->
            <div class="row p-5 d-flex flex-column align-items-center">
                <!-- Account Section -->
                <div class="col-md-6 mb-3">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="icon">
                                    <i class="fas fa-user-circle fa-2x"></i>
                                </div>
                                <h3>Account</h3>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- My Orders Section -->
                <div class="col-md-6 mb-3">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="icon">
                                    <i class="fa-solid fa-box-open fa-2x"></i>
                                </div>
                                <h3>My Orders</h3>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Support Section -->
                <div class="col-md-6">
                    <a href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="icon">
                                    <i class="fa-solid fa-headset fa-2x"></i>
                                </div>
                                <h3>Support</h3>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <%@include file="all_Component/footer.jsp" %>
</body>
</html>