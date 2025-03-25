<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ebook: Index</title>
    <%@include file="all_Component/allCss.jsp"%>

    <style>
         body {
            background-color: #1F7D53;
            font-family: 'Arial', sans-serif;
            color: #FFD2A0;
        }

        .back-img {
            position: relative;
            background: url("images/Banner.jpg") no-repeat center center/cover;
            height: 50vh;
            width: 100%;
        }

        .banner-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 4.5rem;
            font-weight: bold;
            color: #FFD2A0;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.7);
        }

        .section-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #FFD2A0;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.7);
            text-align: center;
            margin-bottom: 20px;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .crd-ho {
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
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.3s ease;
        }

        .btn-custom:hover, .btn-price:hover {
            background-color: #18230F;
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
        }


        .footer {
        margin-top: 15px;
            background-color: #18230F;
            color: #FFD2A0;
            text-align: center;
            padding: 20px;
            position: relative;
            bottom: 0;
            width: 100%;
        }

    </style>
</head>
<body>

<%
User u = (User)session.getAttribute("userobj");
%>

<%@include file="all_Component/navbar.jsp"%>

<div class="container-fluid back-img">
    <div class="banner-text">BOOKAHOLIC</div>
</div>

<!-- Fetch books from DB -->
<%
BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
List<BookDtls> recentBooks = dao.getRecentBooks().stream().limit(4).collect(Collectors.toList()); // Recent books (only Active)
List<BookDtls> newBooks = dao.getNewBooks().stream().limit(4).collect(Collectors.toList()); // New books (only Active)
List<BookDtls> oldBooks = dao.getOldBooks().stream().limit(4).collect(Collectors.toList());
%>

<!-- Recent Books Section -->
<div class="container mt-3">
    <h3 class="text-center section-title">Recent Books</h3>
    <div class="row">
        <%
            for (BookDtls b : recentBooks) {
        %>
            <div class="col-md-3 mb-4">
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
    
    <div class="text-center mt-3">
        <a href="all_recent_book.jsp?category=recent" class="btn btn-view-all">View All</a>
    </div>
</div>
<hr>

<!-- New Books Section -->
<div class="container">
    <h3 class="text-center section-title">New Books</h3>
    <div class="row">
        <%
            for (BookDtls b : newBooks) {
        %>
            <div class="col-md-3 mb-4">
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
    
    <div class="text-center mt-3">
        <a href="all_new_book.jsp?category=recent" class="btn btn-view-all">View All</a>
    </div>
</div>
<hr>

<!-- Old Books Section -->
<div class="container">
    <h3 class="text-center section-title">Old Books</h3>
    <div class="row">
        <%
            for (BookDtls b : oldBooks) {
        %>
            <div class="col-md-3 mb-4">
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
    
    <div class="text-center mt-3">
        <a href="all_old_book.jsp?category=recent" class="btn btn-view-all">View All</a>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <%@include file="all_Component/footer.jsp"%>
</div>

</body>
</html>