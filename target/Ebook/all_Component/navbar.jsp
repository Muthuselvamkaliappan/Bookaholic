<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<style>
    body {
        background-color: #f5f5f5; /* Light grey background for a clean look */
    }
    .navbar-dark .navbar-nav .nav-link.active, 
    .navbar-dark .navbar-nav .nav-link:hover {
        color: #ffffff;
        background-color: #505f9f; /* Change background color on hover to make text visible */
    }
    .btn-custom-primary {
        background-color: #303f9f;
        border-color: #303f9f;
        color: #ffffff;
    }
    .btn-custom-secondary {
        background-color: #5c6bc0;
        border-color: #5c6bc0;
        color: #ffffff;
    }
    .btn-custom-danger {
        background-color: #d32f2f;
        border-color: #d32f2f;
        color: #ffffff;
    }
    .btn-smaller {
        padding: 0.25rem 0.5rem;
        font-size: 0.875rem;
    }
</style>

<div class="container-fluid" style="background-color:#303f9f;height:10px;"></div>

<div class="container-fluid p-3 bg-light">
    <div class="row align-items-center">
        <div class="col-md-3">
            <h3 class="text-success"><i class="fa-solid fa-book"></i> EBOOKS</h3>
        </div>
        <div class="col-md-5">
            <form class="d-flex" action="search.jsp" method="post">
                <input class="form-control me-2" type="search" placeholder="Search" name="ch"
                    aria-label="Search" style="width: 350px;">
                <button class="btn btn-custom-primary" type="submit">Search</button>
            </form>
        </div>

        <c:if test="${not empty userobj}">
        <div class="col-md-4 text-end">
            <a href="checkout.jsp" class="btn btn-custom-primary"><i class="fa-solid fa-cart-shopping"></i></a>
            <a href="login.jsp" class="btn btn-custom-secondary"><i class="fa-solid fa-user"></i> ${userobj.name}</a>
            <a href="logout" class="btn btn-custom-danger"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>
        </c:if>

        <c:if test="${empty userobj}">
        <div class="col-md-4 text-end">
            <a href="login.jsp" class="btn btn-custom-primary"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
            <a href="register.jsp" class="btn btn-custom-secondary"><i class="fa-solid fa-user-plus"></i> Register</a>
        </div>
        </c:if>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i> Recent Books</a></li>
                <li class="nav-item"><a class="nav-link active" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Books</a></li>
                <li class="nav-item"><a class="nav-link active" href="all_old_book.jsp" tabindex="-1" aria-disabled="true"><i class="fa-solid fa-book-open"></i> Old Books</a></li>
            </ul>
            <form class="d-flex">
                <a href="setting.jsp" class="btn btn-light btn-smaller me-2"><i class="fa-solid fa-sliders"></i> Settings</a>
                <a href="helpline.jsp" class="btn btn-light btn-smaller"><i class="fa-solid fa-headset"></i> Contact Us</a>
            </form>
        </div>
    </div>
</nav>