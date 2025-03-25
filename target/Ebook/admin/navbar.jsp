<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!-- Top Bar -->
<div class="container-fluid" style="background-color: #000; height: 5px;"></div>

<!-- Main Navbar -->
<div class="container-fluid p-3 bg-light">
    <div class="row align-items-center">
        <div class="col-md-3">
            <h3 class="text-dark"><i class="fa-solid fa-book"></i> EBOOKS</h3>
        </div>

        <div class="col-md-6"></div> <!-- Empty space to push buttons right -->

        <div class="col-md-3 d-flex justify-content-end align-items-center"> <!-- Aligns buttons to the right -->
           <%--  <c:if test="${not empty userobj}">
                <a class="btn btn-dark me-2"><i class="fas fa-user-tie"></i> ${userobj.name}</a>
                
                <!-- Logout Modal Trigger Button -->
                <a href="#" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#logoutModal">
                    <i class="fas fa-sign-out-alt"></i> Kms
                </a>
            </c:if> --%>

            <c:if test="${empty userobj}">
                <a href="login.jsp" class="btn btn-dark me-2"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                <a href="register.jsp" class="btn btn-dark"><i class="fa-solid fa-user-plus"></i> Register</a>
            </c:if>
        </div>
    </div>
</div>

<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <a href="../logout" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- Logout Modal End -->

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="home.jsp">Home</a></li>
                <!-- Add more nav items here -->
            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <c:if test="${not empty userobj}">
                    <li class="nav-item">
                        <a class="nav-link"><i class="fas fa-user-tie"></i> ${userobj.name}</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#logoutModal">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </li>
                </c:if>
                <c:if test="${empty userobj}">
                    <li class="nav-item">
                        <a href="login.jsp" class="nav-link"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                    </li>
                    <li class="nav-item">
                        <a href="register.jsp" class="nav-link"><i class="fa-solid fa-user-plus"></i> Register</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>