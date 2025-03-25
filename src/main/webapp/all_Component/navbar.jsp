<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<style>
/* Body and background */
body {
	background-color: #f5f5f5; /* Light gray background for a clean look */
	font-family: 'Arial', sans-serif;
}

/* Top bar */
.top-bar {
	background-color: #27391C;
	height: 10px;
}

/* Navbar */
.navbar {
	background-color: #27391C;
	padding: 0.8rem 1.5rem;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.navbar .navbar-brand {
	font-size: 28px;
	color: white;
	font-weight: bold;
	text-transform: uppercase;
}

.navbar-toggler {
	border: none;
}

.navbar-toggler-icon {
	background-color: white;
	width: 24px;
	height: 3px;
}

.navbar-nav .nav-link {
	color: white;
	font-size: 16px;
	padding: 0.5rem 1rem;
	text-transform: capitalize;
}

.navbar-nav .nav-link:hover {
	background-color: #1F7D53; /* Teal hover effect */
	border-radius: 4px;
	transition: all 0.3s ease;
}

.navbar-nav .nav-item.active .nav-link {
	color: #ffffff;
	background-color: #505f9f; /* Highlight active links */
}

.navbar-collapse {
	justify-content: flex-end;
}

/* Button Styles */
.btn-custom-primary {
	background-color: #27391C;
	border: none;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 16px;
	text-transform: uppercase;
	transition: all 0.3s ease;
}

.btn-custom-primary:hover {
	background-color: #1F7D53;
	cursor: pointer;
	color: #18230F;
}

.btn-custom-secondary {
	background-color: #27391C; /* Same as Primary button background */
	border: none;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 16px;
	text-transform: uppercase;
	transition: all 0.3s ease;
}

.btn-custom-secondary:hover {
	background-color: #1F7D53;
	cursor: pointer;
	color: #18230F;
}

.btn-custom-danger {
	background-color: #27391C; /* Same as primary button */
	color: white;
	padding: 10px 15px;
	border-radius: 30px;
	font-size: 16px;
	text-transform: uppercase;
	transition: all 0.3s ease;
	width: 140px; /* Ensure it matches the size of login and register buttons */
	display: inline-block;
	text-align: center;
	margin: 0 5px; /* Even spacing between buttons */
	text-decoration: none;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}

.btn-custom-danger:hover {
	background-color: #1F7D53;
	color: #18230F;
	font-weight: bold;
}

/* Smaller Button */
.btn-smaller {
	padding: 0.25rem 0.5rem;
	font-size: 0.875rem;
}

/* Search bar */
.search-bar {
	display: flex;
	align-items: center;
	justify-content: center;
}

.search-input {
	width: 350px;
	padding: 10px;
	border: 2px solid #ddd;
	border-radius: 35px;
	font-size: 16px;
	margin-right: 10px;
}

.search-button {
	background-color: #27391C;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 50px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s ease;
}

.search-button:hover {
	background-color: #1F7D53;
	color: #18230F;
}

/* Uniform button styles for Login and Register */
.auth-btn {
	background-color: #27391C; /* Same as the primary button */
	color: white;
	padding: 10px 15px;
	border-radius: 30px;
	font-size: 16px;
	text-transform: uppercase;
	transition: all 0.3s ease;
	width: 140px; /* Ensure both buttons are same size */
	display: inline-block;
	text-align: center;
	margin: 0 10px; /* Even spacing between buttons */
	text-decoration: none;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}

.auth-btn:hover {
	background-color: #1F7D53;
	color: #18230F;
	font-weight: bold;
}

/* Uniform button styles for User Name */
.user-btn {
	background-color: #27391C; /* Same as primary button */
	color: white;
	padding: 10px 15px;
	border-radius: 30px;
	font-size: 16px;
	text-transform: uppercase;
	transition: all 0.3s ease;
	width: 140px; /* Ensure it matches the size of login and register buttons */
	display: inline-block;
	text-align: center;
	margin: 0 5px; /* Even spacing between buttons */
	text-decoration: none;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
}

.user-btn:hover {
	background-color: #1F7D53;
	color: #18230F;
	font-weight: bold;
}

/* Responsive design */
@media ( max-width : 768px) {
	.navbar {
		padding: 0.8rem 1rem;
	}
	.navbar .navbar-brand {
		font-size: 24px;
	}
	.search-bar {
		flex-direction: column;
	}
	.search-input {
		width: 100%;
		margin-bottom: 10px;
	}
	.search-button {
		width: 100%;
	}
}
</style>

<div class="container-fluid top-bar"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row align-items-center">
		<div class="col-md-3">
			<h3 style="color: #18230F; font-weight: bold;">
				<i class="fa-solid fa-book" style="color: #18230F;"></i> EBOOKS
			</h3>
		</div>

		<div class="col-md-5">
			<form class="search-bar" action="search.jsp" method="post">
				<input class="search-input" type="search" placeholder="Search"
					name="ch" aria-label="Search">
				<button class="search-button" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</div>

		<c:if test="${not empty userobj}">
			<div class="col-md-4 text-end">
				<a href="checkout.jsp" class="btn btn-custom-primary"><i
					class="fa-solid fa-cart-shopping"></i></a>
				<a href="login.jsp" class="user-btn"><i class="fa-solid fa-user"></i> ${userobj.name}</a>
				<a href="logout" class="btn btn-custom-danger"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</div>
		</c:if>

		<c:if test="${empty userobj}">
			<div class="col-md-4 text-end">
				<a href="login.jsp" class="auth-btn"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>
				<a href="register.jsp" class="auth-btn"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</div>
		</c:if>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>
						Recent Books</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>
						New Books</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i>
						Old Books</a></li>
			</ul>
			<form class="d-flex">
				<a href="setting.jsp" class="btn btn-light btn-smaller me-2"><i
					class="fa-solid fa-sliders"></i> Settings</a> <a href="helpline.jsp"
					class="btn btn-light btn-smaller"><i
					class="fa-solid fa-headset"></i> Contact Us</a>
			</form>
		</div>
	</div>
</nav>
