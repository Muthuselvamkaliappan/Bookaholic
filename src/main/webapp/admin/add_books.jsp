<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp" %>
<style>
    body {
    background-color: #1F7D53; /* Teal */
    font-family: 'Arial', sans-serif;
}

.container {
    margin-top: 50px;
}

/* Card Design */
.card {
    border-radius: 15px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    background-color: #255F38; /* Green */
    color: #FFD2A0; /* Warm Accent */
}

/* Card Title */
.card h4 {
    font-size: 2rem;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
    color: #FFD2A0; /* Warm Accent */
}

/* Form Labels */
.form-label {
    font-weight: bold;
    color: #FFD2A0; /* Warm Accent */
    font-size: 1.2rem;
}

/* Form Inputs */
.form-control {
    border-radius: 10px;
    height: 50px;
    font-size: 1.1rem;
    border: 2px solid #FFD2A0; /* Accent Border */
    background-color: #27391C; /* Dark Olive */
    color: #FFD2A0; /* Text Color */
    transition: all 0.3s ease-in-out;
}

.form-control:focus {
    border-color: #FFC078; /* Soft Gold */
    background-color: #255F38; /* Green */
    color: #FFD2A0;
    box-shadow: 0 0 10px rgba(255, 210, 160, 0.5);
}

/* Submit Button */
.btn-primary {
    background-color: #FFD2A0; /* Warm Accent */
    border-color: #FFD2A0;
    font-size: 1.2rem;
    height: 50px;
    font-weight: bold;
    color: #18230F; /* Dark Green */
    transition: all 0.3s ease-in-out;
}

.btn-primary:hover {
    background-color: #FFC078; /* Soft Gold */
    transform: translateY(-2px);
    color: #18230F;
}

/* Success & Error Messages */
.text-success {
    color: #4caf50;
    font-size: 1.2rem;
}

.text-danger {
    color: #f44336;
    font-size: 1.2rem;
}

</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container">
    <div class="row mt-5">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center"><i class="fa-solid fa-plus-circle"></i> Add Books</h4>

                    <!-- Success Message -->
                    <c:if test="${not empty succMsg}">
                        <p class="text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <!-- Failure Message -->
                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                    <form action="../add_books" method="post" enctype="multipart/form-data">
                        <!-- Book Name -->
                        <div class="mb-3">
                            <label for="bookName" class="form-label">Book Name</label>
                            <input type="text" class="form-control" id="bookName" placeholder="Enter book name" required name="bname">
                        </div>

                        <!-- Author Name -->
                        <div class="mb-3">
                            <label for="authorName" class="form-label">Author Name</label>
                            <input type="text" class="form-control" id="authorName" placeholder="Enter author name" required name="author">
                        </div>

                        <!-- Price -->
                        <div class="mb-3">
                            <label for="price" class="form-label">Price</label>
                            <input type="number" class="form-control" id="price" placeholder="Enter price" required name="price">
                        </div>

                        <!-- Book Category -->
                        <div class="mb-3">
                            <label for="bookCategory" class="form-label">Book Categories</label>
                            <select class="form-control" id="bookCategory" name="categories" required>
                                <option value="">Select a category</option>
                                <option value="New">New Book</option>
                                <option value="Fiction">Romance</option>
                                <option value="Science">Philosophy</option>
                                <option value="Technology">Technology</option>
                                <option value="Biography">Horror</option>
                                <option value="History">History</option>
                            </select>
                        </div>

                        <!-- Book Status -->
                        <div class="mb-3">
                            <label for="bookStatus" class="form-label">Book Status</label>
                            <select class="form-control" id="bookStatus" name="status" required>
                                <option value="">Select book status</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>

                        <!-- Upload Photo -->
                        <div class="mb-3">
                            <label for="bookPhoto" class="form-label">Upload Photo</label>
                            <input type="file" class="form-control" id="bookPhoto" name="bimg" accept="image/*" required>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary w-100">Add Book</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<div style="margin-top:110px;">
    <%@include file="footer.jsp" %>
</div>

</body>
</html>