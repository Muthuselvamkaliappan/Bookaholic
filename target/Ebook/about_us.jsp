<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Ebook Management System</title>
    <%@include file="all_Component/allCss.jsp"%>
    
    <style>
    .container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
h2, h3 { color: #333; }
ul { list-style: none; padding: 0; }
ul li { padding: 5px 0; }
    </style>
</head>
<body>

  

    <div class="container">
        <h2>About Us</h2>
        <p>Welcome to the Ebook Management System! Our platform is designed to provide a seamless experience for book lovers, allowing them to explore, purchase, and manage their favorite books online.</p>

        <h3>Our Mission</h3>
        <p>We aim to offer a user-friendly and efficient ebook management solution where users can browse, buy, and read books effortlessly.</p>

        <h3>Why Choose Us?</h3>
        <ul>
            <li>📚 Wide Collection of Ebooks</li>
            <li>💳 Secure Payment Integration</li>
            <li>🔍 Easy Search & Navigation</li>
            <li>🛒 Smooth Order & Cart System</li>
            <li>🌙 Light & Dark Mode for Comfort</li>
        </ul>

        <h3>Contact Us</h3>
        <p>📧 Email: support@ebookmanagement.com</p>
        <p>📍 Location: Coimbatore, India</p>
    </div>

    <%-- Include Footer --%>
    <%@ include file="all_Component/footer.jsp" %>

</body>
</html>
