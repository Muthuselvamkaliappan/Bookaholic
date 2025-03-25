<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help & Support</title>
    <%@include file="all_Component/allCss.jsp"%>

    <style>
        .form-control {
            height: 45px;
            font-size: 16px;
        }
        .card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
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
