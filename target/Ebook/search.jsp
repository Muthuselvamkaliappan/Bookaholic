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
<title>Recent books</title>
<%@include file="all_Component/allCss.jsp"%>
</head>
<body>

<%
User u = (User)session.getAttribute("userobj");
%>

 <%@include file="all_Component/navbar.jsp"%>
 
 <div class="container-fluid">
    <div class="row">
        <%
        	
        	String ch = request.getParameter("ch");
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDtls> recentBooks = dao.getBookBySearch(ch); 
            for (BookDtls b : recentBooks) {
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
                    
                    <%
                            if(u==null) {
                            %>
                                <a href="login.jsp" class="btn btn-danger btn-sm btn-custom">
                                    <i class="fa-solid fa-cart-plus"></i> Add
                                </a>
                            <%
                            } else {
                            %>
                                <a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
                                   class="btn btn-danger btn-sm btn-custom">
                                    <i class="fa-solid fa-cart-plus"></i> Add
                                </a>
                            <%
                            }
                            %>
                    
                    <div class="d-flex justify-content-center">
                       
                        <a href="view_books.jsp?bid=<%= b.getBookId()%>" class="btn btn-danger btn-sm btn-custom mx-1"><i class="fa-solid fa-eye"></i> View</a>
                        <a href="" class="btn btn-danger btn-sm btn-custom mx-1">₹<%=b.getPrice()%></a>
                    </div>
                </div>
            </div>
        </div>

        <% } %>
    </div>
</div>

</body>
</html>