<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@include file="allCss.jsp" %>
<style>
    body {
        background-color: #f0f1f2;
        font-family: 'Arial', sans-serif;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    .container {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 50px;
    }
    .row {
        width: 100%;
        max-width: 1000px;
    }
    .card {
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s, box-shadow 0.3s;
        margin: 15px;
    }
    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
    }
    .card-body {
        padding: 2rem;
    }
    .card h4 {
        margin-top: 1rem;
        font-size: 1.5rem;
        font-weight: bold;
        color: #333;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }
    .card i {
        transition: color 0.3s;
    }
    .card a {
        text-decoration: none;
        color: inherit;
    }
    .card a:hover {
        text-decoration: none;
        color: inherit;
    }
    a {
        text-decoration: none;
    }
    a:hover {
        text-decoration: none;
    }
    .text-primary {
        color: #007bff !important;
    }
    .text-danger {
        color: #dc3545 !important;
    }
    .text-warning {
        color: #ffc107 !important;
    }
    footer {
        margin-top: auto;
    }
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container">
    <div class="row justify-content-center">

        <div class="col-md-3 mb-4">
            <a href="add_books.jsp">
                <div class="card text-center" style="width: 200px;">
                    <div class="card-body">
                        <i class="fa-solid fa-square-plus fa-3x text-primary"></i>
                        <h4>Add Books</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3 mb-4">
            <a href="all_books.jsp">
                <div class="card text-center" style="width: 200px;">
                    <div class="card-body">
                        <i class="fa-solid fa-book fa-3x text-danger"></i>
                        <h4>All Books</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3 mb-4">
            <a href="orders.jsp">
                <div class="card text-center" style="width: 200px;">
                    <div class="card-body">
                        <i class="fa-solid fa-truck-fast fa-3x text-warning"></i>
                        <h4>Orders</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3 mb-4">
            <a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal">
                <div class="card text-center" style="width: 200px;">
                    <div class="card-body">
                        <i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
                        <h4>Logout</h4>
                    </div>
                </div>
            </a>
        </div>

    </div>
</div>

<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <a href="../logout" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- Logout Modal End -->


</body>
</html>