<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Saved Address</title>
<%@include file="all_Component/allCss.jsp"%>

<style>
    .form-control {
        height: 45px; 
        font-size: 16px; 
    }
</style>

</head>
<body>
<%@include file="all_Component/navbar.jsp"%>

<div class="container p-5">
    <div class="row p-3">
        <div class="col-md-6 offset-md-3"> 
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center text-success">Add Address</h4>

                    <div class="form-row">

                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address" required>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label for="landmark">Landmark</label>
                                <input type="text" class="form-control" id="landmark" name="landmark" required>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label for="city">City</label>
                                <input type="text" class="form-control" id="city" name="city" required>
                            </div>
                            <div class="col-md-6">
                                <label for="state">State</label>
                                <input type="text" class="form-control" id="state" name="state" required>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label for="pincode">Pincode</label>
                                <input type="text" class="form-control" id="pincode" name="pincode" required>
                            </div>
                        </div>

                        <div class="p-4 text-center">
                            <button class="btn btn-success btn-lg">Add Address</button> 
                        </div>

                    </div> 
                </div> 
            </div> 
        </div> 
    </div> 
</div> 

<%@include file="all_Component/footer.jsp" %>

</body>
</html>
