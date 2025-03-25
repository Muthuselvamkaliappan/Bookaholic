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
        .back-img {
            position: relative;
            background: url("img/Banner.jpg");
            height: 50vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .banner-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 4.5rem;
            font-weight: bold;
            color: #ffffff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }

        .btn-custom {
            width: 80px;
            height: 40px;
            margin: 0 5px;
            text-align: center;
            background-color: #757575; /* Gray color */
            border: none;
            color: #ffffff;
        }

        .btn-view-all {
            background-color: #757575; /* Gray color */
            border-color: #757575;
            color: #ffffff;
        }

        .crd-ho {
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .crd-ho:hover {
            background-color: #f5f5f5;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .section-title {
            font-size: 2rem;
            font-weight: bold;
            color: #303f9f;
            text-transform: uppercase;
        }

        .btn-price {
            background-color: #757575; /* Gray color */
            border: none;
            color: #ffffff;
        }
    </style>
</head>
<body style="background-color: #f0f0f0;"> <!-- Light gray background -->

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
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img src="images/<%=b.getPhotoName()%>" 
                             alt="Book Image" 
                             style="height: 200px; width: 150px;" 
                             class="img-thumbnail">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Category: <%=b.getBookCategory()%></p>
                        <div class="d-flex justify-content-center">

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
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img src="images/<%=b.getPhotoName()%>" 
                             alt="Book Image" 
                             style="height: 200px; width: 150px;" 
                             class="img-thumbnail">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Category: <%=b.getBookCategory()%></p>
                        <div class="d-flex justify-content-center">

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
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img src="images/<%=b.getPhotoName()%>" 
                             alt="Book Image" 
                             style="height: 200px; width: 150px;" 
                             class="img-thumbnail">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Category: <%=b.getBookCategory()%></p>
                        <div class="d-flex justify-content-center">
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
<hr>

<%@include file="all_Component/footer.jsp"%>

</body>
</html>