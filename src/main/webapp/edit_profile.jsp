<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_Component/allCss.jsp"%>
<style>
    /* Full Page Layout */
body {
    background-color: #FFFFFF; /* White Background */
    font-family: 'Arial', sans-serif;
    color: #27391C; /* Dark Olive */
}

/* Title Styling */
.header-title {
    color: #FFD2A0; /* Warm Accent */
    font-size: 1.8rem;
    font-weight: bold;
    text-align: center;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); /* Adds a strong shadow */
    margin-bottom: 2rem;
    letter-spacing: 1px;
}

/* Card Design */
.card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
    border-radius: 10px;
    border: none;
    background-color: #255F38; /* Green */
    color: #FFD2A0; /* Warm Accent */
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

/* Card Body */
.card-body {
    padding: 2rem;
    border-radius: 10px;
    background-color: #27391C; /* Dark Olive */
    color: #FFD2A0; /* Warm Accent */
}

/* Titles */
.header-title {
    color: #1F7D53; /* Teal */
    margin-bottom: 2rem;
    font-size: 1.5rem;
    text-align: center;
}

/* Buttons */
.btn-primary {
    background-color: #1F7D53; /* Teal */
    border-color: #1F7D53;
    transition: background-color 0.3s, transform 0.3s;
    color: #FFD2A0; /* Warm Accent */
}

.btn-primary:hover {
    background-color: #255F38; /* Green */
    transform: translateY(-2px);
}

/* Form Inputs */
.form-control {
    border: 1px solid #1F7D53; /* Teal */
    background-color: #18230F; /* Dark Green */
    color: #FFD2A0; /* Warm Accent */
}

.form-control:focus {
    border-color: #1F7D53;
    box-shadow: 0 0 5px rgba(31, 125, 83, 0.5);
    background-color: #18230F;
    color: #FFD2A0;
}

/* Placeholder Text */
::placeholder {
    color: #FFD2A0;
    opacity: 0.7;
}

/* Success & Error Messages */
.text-danger, .text-success {
    text-align: center;
    font-size: 1.1rem;
    font-weight: bold;
}

</style>
</head>
<body>
<%@include file="all_Component/navbar.jsp"%>

<div class="container p-4">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center header-title">Edit Profile</h4>

                    <c:if test="${not empty failedMsg }">
                        <h5 class="text-center text-danger">${failedMsg }</h5>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty succMsg }">
                        <h5 class="text-center text-success">${succMsg }</h5>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>

                    <form action="update_profile" method="post">

                        <input type="hidden" value="${userobj.id}" name="id">

                        <div class="mb-3">
                            <label for="exampleInputName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="exampleInputName" placeholder="username" required="required" name="fname" value="${userobj.name}">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="email id" required="required" name="email" value="${userobj.email}">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPhone" class="form-label">Mobile</label>
                            <input type="number" class="form-control" id="exampleInputPhone" placeholder="phone no" required="required" name="phno" value="${userobj.phno}">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword" placeholder="password" required="required" name="password" value="">
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary w-100">Update</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>