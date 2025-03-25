<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
<%@include file="allCss.jsp" %>
<style>
 body {
        background-color: #1F7D53; /* Teal */
        font-family: 'Arial', sans-serif;
    }

    .card {
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        background-color: #27391C; /* Dark Olive */
        color: #ffffff;
    }

    h4.text-center {
        font-size: 1.8rem;
        font-weight: bold;
        color: #FFD2A0; /* Warm Accent */
    }

    .form-label {
        font-weight: bold;
        color: #FFD2A0; /* Warm Accent */
    }

    .form-control {
        background-color: #18230F; /* Dark Green */
        border: 1px solid #255F38; /* Green */
        color: #ffffff;
    }

    .form-control:focus {
        border-color: #FFD2A0; /* Warm Accent */
        box-shadow: 0 0 5px #FFD2A0;
    }

    .btn-primary {
        background-color: #255F38; /* Green */
        border: none;
        transition: all 0.3s ease-in-out;
    }

    .btn-primary:hover {
        background-color: #1F7D53; /* Teal */
        transform: translateY(-2px);
    }

    .text-success {
        color: #20C997; /* Success message */
        font-weight: bold;
    }

    .text-danger {
        color: #f44336; /* Error message */
        font-weight: bold;
    }

</style>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="navbar.jsp" %>

<div class="container">
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">

                    <h4 class="text-center">Edit Books</h4>

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

                    <%
                    String idStr = request.getParameter("id");
                    int id = 0; 
                    BookDtls b = null;

                    if (idStr != null && !idStr.trim().isEmpty()) {
                        try {
                            id = Integer.parseInt(idStr);
                            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                            b = dao.getBookById(id);

                        } catch (NumberFormatException e) {
                            System.out.println("Error: Invalid book ID format.");
                        }
                    }
                    %>

                    <% if (b != null) { %>
                    <form action="${pageContext.request.contextPath}/admin/updatebook" method="post">

                        <input type="hidden" name="id" value="<%=b.getBookId()%>">

                        <div class="mb-3">
                            <label for="bookName" class="form-label">Book Name</label>
                            <input type="text" class="form-control" id="bookName" required name="bname" value="<%=b.getBookName()%>">
                        </div>

                        <div class="mb-3">
                            <label for="authorName" class="form-label">Author Name</label>
                            <input type="text" class="form-control" id="authorName" required name="author" value="<%=b.getAuthor()%>">
                        </div>

                        <div class="mb-3">
                            <label for="price" class="form-label">Price</label>
                            <input type="number" class="form-control" id="price" required name="price" value="<%=b.getPrice()%>">
                        </div>

                        <div class="mb-3">
                            <label for="bookStatus" class="form-label">Book Status</label>
                            <select class="form-control" id="bookStatus" name="status" required>
                                <% if ("Active".equals(b.getStatus())) { %>
                                    <option value="Active" selected>Active</option>
                                    <option value="Inactive">Inactive</option>
                                <% } else { %>
                                    <option value="Inactive" selected>Inactive</option>
                                    <option value="Active">Active</option>
                                <% } %>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>

                    <% } else { %>
                        <p class="text-center text-danger">Error: Book details not found.</p>
                    <% } %>

                </div>
            </div>
        </div>
    </div>
</div>

<div style="margin-top:110px;">
    <%@include file="footer.jsp" %>
</div>

</body>
</html>
