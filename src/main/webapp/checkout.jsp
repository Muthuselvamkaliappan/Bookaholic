<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.DAO.CartDAOImpl, com.DB.DBConnect,com.entity.Cart,java.util.List,com.entity.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <%@include file="all_Component/allCss.jsp" %>
    <style>
       body {
    background-color: #1F7D53; /* Teal background */
    font-family: 'Arial', sans-serif;
}

.container {
    margin-top: 20px;
}

.card {
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    border: none;
    background-color: #ffffff;
}

.card-body {
    padding: 2rem;
}

h3 {
    color: #255F38; /* Dark Green */
    font-weight: bold;
    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.1);
}

.table thead {
    background-color: #255F38; /* Dark Green */
    color: #ffffff;
}

.table tbody tr:hover {
    background-color: rgba(31, 125, 83, 0.1); /* Soft hover effect */
}

.form-control {
    height: 45px;
    font-size: 16px;
    border-radius: 8px;
    border: 1px solid #ccc;
    transition: all 0.3s;
}

.form-control:focus {
    border-color: #1F7D53;
    box-shadow: 0 0 5px rgba(31, 125, 83, 0.5);
}

.btn-warning {
    background-color: #FFD2A0; /* Warm Accent */
    border-color: #FFD2A0;
    color: #18230F; /* Dark Green */
    font-weight: bold;
    transition: all 0.3s;
}

.btn-warning:hover {
    background-color: #FFC082;
    transform: translateY(-2px);
}

.btn-success {
    background-color: #255F38; /* Dark Green */
    border-color: #255F38;
    color: #ffffff;
    font-weight: bold;
    transition: all 0.3s;
}

.btn-success:hover {
    background-color: #1F7D53;
    transform: translateY(-2px);
}

.btn-danger {
    background-color: #F44336; /* Standard Red */
    border-color: #F44336;
    color: #ffffff;
    transition: all 0.3s;
}

.btn-danger:hover {
    background-color: #D32F2F;
    transform: translateY(-2px);
}

    </style>
</head>

<body>

<c:if test="${empty userobj}">
    <c:redirect url="login.jsp"/>
</c:if>

<%@include file="all_Component/navbar.jsp" %>

<c:if test="${not empty successMsg}">
    <div class="alert alert-success text-center">${successMsg}</div>
    <c:remove var="successMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg}">
    <div class="alert alert-danger text-center">${failedMsg}</div>
    <c:remove var="failedMsg" scope="session"/>
</c:if>

<div class="container">
    <div class="row p-2">
        <div class="col-md-6">
            <div class="card bg-white">
                <div class="card-body">
                    <h3 class="text-center">Selected Items</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Book Name</th>
                                <th>Author</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                        <%
                        User u = (User) session.getAttribute("userobj");
                        if (u != null) {
                            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                            List<Cart> cart = dao.getBookByUser(u.getId());
                            double total_price = 0.00;

                            if (cart.isEmpty()) { 
                        %>
                                <tr>
                                    <td colspan="4" class="text-center"><b>Your cart is empty</b></td>
                                </tr>
                        <% 
                            } else {
                                for (Cart c : cart) { 
                                    total_price += c.getTotal_price();
                        %>
                                <tr>
                                    <td><%= c.getBookName() %></td>
                                    <td><%= c.getAuthor() %></td>
                                    <td>₹<%= c.getPrice() %></td>
                                    <td>
                                        <a href="remove_book?bid=<%= c.getBid() %>&cid=<%= c.getCid() %>" class="btn btn-danger">Remove</a>
                                    </td>
                                </tr>
                        <%
                                }
                        %>
                                <tr>
                                    <td><b>Total Price</b></td>
                                    <td></td>
                                    <td><b>₹<%= total_price %></b></td>
                                </tr>
                        <%
                            }
                        }
                        %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center">Delivery Details</h3>

                    <% if (u != null) { %>
                    <form action="order" method="post">
                    
                    <input type="hidden" value="${userobj.id}" name="id">
                    
                        <div class="row">
                            <div class="col-md-6">
                                <label for="fullName">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" required value="${userobj.name}">
                            </div>
                            <div class="col-md-6">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required value="${userobj.email}">
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label for="mobile">Mobile No</label>
                                <input type="number" class="form-control" id="mobile" name="mobile" required value="${userobj.phno}">
                            </div>
                            <div class="col-md-6">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address" required>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label for="landmark">Landmark</label>
                                <input type="text" class="form-control" id="landmark" name="landmark">
                            </div>
                            <div class="col-md-6">
                                <label for="city">City</label>
                                <input type="text" class="form-control" id="city" name="city" required>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label for="state">State</label>
                                <input type="text" class="form-control" id="state" name="state" required>
                            </div>
                            <div class="col-md-6">
                                <label for="pincode">Pincode</label>
                                <input type="text" class="form-control" id="pincode" name="pincode" required>
                            </div>
                        </div>

                        <div class="form-group mt-2">
                            <label>Payment Mode</label>
                            <select class="form-control" name="paymentMode" required>
                                <option value="noselect">Select Payment Mode</option>
                                <option value="COD">Cash on Delivery</option>
                                <option value="Online">Online Payment</option>
                            </select>
                        </div>

                        <div class="text-center p-2">
                            <button type="submit" class="btn btn-warning">Order Now</button>
                            <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                        </div>
                    </form>
                    <% } else { %>
                        <p class="text-center text-danger">Please <a href="login.jsp">login</a> to proceed with checkout.</p>
                    <% } %>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>