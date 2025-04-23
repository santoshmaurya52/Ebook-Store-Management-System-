<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- Top Strip -->
<div class="container-fluid"
	style="height: 6px; background-color: #303f9f;"></div>

<!-- ✅ Header Section - Slightly Enlarged -->
<div class="container-fluid bg-light py-3">
	<div class="row align-items-center">
		<!-- Logo -->
		<div class="col-md-3 text-success">
			<h3 class="mb-0" style="font-weight: 600;">
				<i class="fa-solid fa-book"></i> Ebooks
			</h3>
		</div>

		<!-- Search Bar -->
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="Search.jsp" method="post">
				<input class="form-control mr-2" style="height: 42px;" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary" style="height: 42px;" type="submit">Search</button>
			</form>
		</div>

		<!-- User / Cart Section -->
		<div class="col-md-3 d-flex justify-content-end align-items-center">
			<c:if test="${not empty userobj}">
				<div class="d-flex align-items-center">
					<a href="checkout.jsp" class="mr-3"> <i
						class="fa-solid fa-cart-plus fa-2x text-primary"></i>
					</a> <a href="login.jsp" class="btn btn-success mr-2"
						style="padding: 6px 12px;"> <i class="fa-solid fa-user-plus"></i>
						${userobj.name}
					</a> <a href="logout" class="btn btn-primary text-white"
						style="padding: 6px 12px;"> <i
						class="fa-solid fa-right-to-bracket"></i> Logout
					</a>
				</div>
			</c:if>

			<c:if test="${empty userobj}">
				<div class="d-flex align-items-center">
					<a href="login.jsp" class="btn btn-success mr-2"
						style="padding: 6px 12px;"> <i
						class="fa-solid fa-right-to-bracket"></i> Login
					</a> <a href="register.jsp" class="btn btn-primary"
						style="padding: 6px 12px;"> <i class="fa-solid fa-user-plus"></i>
						Register
					</a>
				</div>
			</c:if>
		</div>
	</div>
</div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom py-3">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house-user"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<!-- Navbar Links -->
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>
					Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>
					New Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i>
					Old Book</a></li>
		</ul>

		<!-- Navbar Right Buttons -->
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="button">
				<i class="fa-solid fa-gear"></i> Setting
			</a>
			<button class="btn btn-light my-2 my-sm-0" type="button">
				<i class="fa-solid fa-phone"></i> Contact Us
			</button>
		</form>
	</div>
</nav>
