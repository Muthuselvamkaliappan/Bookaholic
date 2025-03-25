<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help & Support</title>
    <%@include file="all_Component/allCss.jsp"%>

    <style>
       body {
    font-family: 'Arial', sans-serif;
}

.container {
    margin-top: 50px;
}

.card {
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
    border-radius: 10px;
    padding: 30px;
    background-color: #ffffff;
}

h3.text-center {
    font-weight: bold;
    color: #1F7D53; /* Theme Color */
    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
}

.text-center h5 {
    font-size: 1.2rem;
}

.text-primary {
    color: #255F38 !important; /* Dark Green Theme */
}

.text-danger {
    color: #D9534F !important; /* Softer Red */
}

.form-control {
    height: 45px;
    font-size: 16px;
    border-radius: 8px;
    border: 1px solid #ccc;
    transition: border 0.3s, box-shadow 0.3s;
}

.form-control:focus {
    border-color: #1F7D53;
    box-shadow: 0 0 5px rgba(31, 125, 83, 0.5);
}

textarea.form-control {
    resize: none;
}

.btn-success {
    background-color: #1F7D53; /* Teal */
    border: none;
    font-size: 18px;
    padding: 10px 20px;
    border-radius: 8px;
    transition: all 0.3s;
}

.btn-success:hover {
    background-color: #255F38; /* Darker Green */
    transform: translateY(-2px);
}

    </style>
</head>
<body>
    <%@include file="all_Component/navbar.jsp"%>

    <div class="container p-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4">
                    <h3 class="text-center text-success">Need Help? Contact Us!</h3>

                    <div class="text-center mt-3">
                        <h5><i class="fas fa-phone-alt text-primary"></i> Helpline: <strong>+91 9342306748</strong></h5>
                        <h5><i class="fas fa-envelope text-danger"></i> Email: <strong>selvamm243@gmail.com</strong></h5>
                    </div>

                    <hr>

                    <h5 class="text-center text-secondary">Send Us a Message</h5>

                    <form action="submitQuery.jsp" method="post">
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label for="name">Your Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="col-md-6">
                                <label for="email">Your Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label for="message">Your Message</label>
                                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                            </div>
                        </div>

                        <div class="text-center mt-4">
                            <button class="btn btn-success btn-lg">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
