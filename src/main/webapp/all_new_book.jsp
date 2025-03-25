<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Books</title>
    <%@include file="all_Component/allCss.jsp"%>
    
    <style>
        body {
            background-color: #1F7D53;
        }

        .crd-ho {
            position: relative;
            background-color: #255F38;
            border-radius: 8px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }

        .crd-ho:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .card-body img {
            width: 100%;
            height: auto;
            border-radius: 5px;
            transition: filter 0.3s ease;
        }

        .crd-ho:hover .card-body img {
            filter: blur(2px);
        }

        .card-body p {
            color: #FFD2A0;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }

        .card-buttons {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            gap: 5px;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

        .crd-ho:hover .card-buttons {
            opacity: 1;
        }

        .btn-custom, .btn-price {
            background-color: #27391C;
            border: none;
            color: #FFD2A0;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            text-align: center;
            width: 80px; /* Ensure uniform size */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-custom:hover, .btn-price:hover {
            background-color: #18230F;
            color: #FFD2A0;
        }

        .btn-view-all {
            background-color: #27391C;
            border-color: #27391C;
            color: #FFD2A0;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
        }

        .btn-view-all:hover {
            background-color: #18230F;
            color: #FFD2A0;
        }

        #toast {
            min-width: 300px;
            position: fixed;
            bottom: 30px;
            left: 50%;
            margin-left: -125px;
            background: #333;
            padding: 10px;
            color: white;
            text-align: center;
            z-index: 1;
            font-size: 18px;
            visibility: hidden;
            box-shadow: 0px 0px 100px #000;
        }

        #toast.display {
            visibility: visible;
            animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
        }

        @keyframes fadeIn {
            from { bottom:0; opacity: 0; }
            to { bottom: 30px; opacity: 1; }
        }

        @keyframes fadeOut {
            from { bottom:30px; opacity: 1; }
            to { bottom: 0; opacity: 0; }
        }
    </style>
</head>
<body style="background-color: #f0f0f0;"> <!-- Light gray background -->

<%
User u = (User)session.getAttribute("userobj");
%>

<c:if test="${not empty addCart}">
    <div id="toast">${addCart}</div>

    <script type="text/javascript">
        function showToast(content) {
            $('#toast').addClass("display");
            $('#toast').html(content);
            setTimeout(() => {
                $("#toast").removeClass("display");
            }, 2000);
        }

        // Call showToast with the message on page load
        $(document).ready(function() {
            showToast("${addCart}");
        });
    </script>
</c:if>

<%@include file="all_Component/navbar.jsp"%>

<%
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
    List<BookDtls> newBooks = dao.getNewBooks(); // Fetching only active new books
%>

<div class="container-fluid">
    <div class="row">
        <%
            for (BookDtls b : newBooks) {
        %>
            <div class="col-md-3 mb-4 mt-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img src="images/<%=b.getPhotoName()%>" 
                             alt="Book Image" 
                             style="height: 200px; width: 150px;" 
                             class="img-thumbnail">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Category: <%=b.getBookCategory()%></p>
                        <div class="card-buttons">
                            <%
                            if(u==null) {
                            %>
                                <a href="login.jsp" class="btn btn-custom btn-sm">
                                    <i class="fa-solid fa-cart-plus"></i> Add
                                </a>
                            <%
                            } else {
                            %>
                                <a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
                                   class="btn btn-custom btn-sm">
                                    <i class="fa-solid fa-cart-plus"></i> Add
                                </a>
                            <%
                            }
                            %>
                            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-custom btn-sm">
                                <i class="fa-solid fa-eye"></i> View
                            </a>
                            <a href="#" class="btn btn-price btn-sm">₹<%=b.getPrice()%></a>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>