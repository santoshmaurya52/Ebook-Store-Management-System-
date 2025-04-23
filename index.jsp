<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook</title>

<!-- Bootstrap 4 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Font Awesome for Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


<%@include file="All_Component/AllCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/BOOK4.jpg") no-repeat center center;
	background-size: cover;
	height: 55vh;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	text-shadow: 2px 2px 4px #d69f5c;
}

.card:hover {
	transform: scale(1.01);
	transition: transform 0.2s;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	background-color: #f9faf5;
}

.book-img {
	height: 200px;
	object-fit: cover;
	border-radius: 5px;
}

.btn:hover {
	transform: scale(1.01);
	transition: transform 0.2s;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.custom-hover:hover {
	transform: scale(2.0);
	background-color: #0d6efd; /* Bootstrap's primary color */
	color: #fff; /* White text */
	border-color: #0d6efd;
	transition: background-color 0.3s ease, color 0.3s ease;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<!-- Code For logout page and redirect login Page -->

	<%
	HttpSession session1 = request.getSession(false);
	String userName = (session != null) ? (String) session.getAttribute("userName") : null;
	%>

	<%
	if (userName != null) {
	%>
	<i class="fas fa-user"></i>
	<%=userName%>
	<%
	} else {
	%>
	<a href="login.jsp"></a>
	<%
	}
	%>
	<!-- End---------- -->

	<!-- Start Welcome Page -->
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:if test="${not empty sessionScope.userobj}">
		<!-- User is logged in -->
		<p class="text-center" >Welcome,
			${sessionScope.userobj.name}!</p>
		<a href="logout"></a>
	</c:if>

	<c:if test="${empty sessionScope.userobj}">
		<!-- User is not logged in -->
		<a href="login.jsp"></a>
	</c:if>

<!-- End Welcome Page -->

	<%@include file="All_Component/navbar.jsp"%>
	<div class="back-img">
		<h1 class="display-4">Welcome to the EBook Store</h1>
	</div>

	<%-- <%
	Connection conn = DBConnect.getConn();
	out.println(conn);
	%> --%>

	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getAllRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 145px; height: 190px; border-style: inset;"
							class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center">
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mr-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
							<%
							} else {
							%>

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm mr-1"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm mr-1"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>

							<%
							}
							%>


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mr-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
		<div class="text-center mt-3">
			<a href="all_recent_book.jsp" class="btn btn-outline-primary">View
				All Recent Books</a>
		</div>

	</div>
	<!-- End Recent Book -->

	<hr>

	<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 145px; height: 190px; border-style: inset;"
							class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm mr-1"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm mr-1"> <i
								class="fa-solid fa-cart-plus"></i> Add Cart
							</a>

							<%
							}
							%>



							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm mr-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm"> <%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>




		</div>
		<div class="text-center mt-3">
			<a href="all_new_book.jsp" class="btn btn-outline-primary">View
				All New Books</a>
		</div>

	</div>
	<!-- End New Book -->

	<hr>


	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao2.getOldBooks();
			for (BookDtls b : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 145px; height: 190px; border-style: inset;"
							class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>

						<div class="row">

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>


					</div>
				</div>
			</div>

			<%
			}
			%>





		</div>
		<div class="text-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-outline-primary">View
				All Old Books</a>
		</div>

	</div>
	<!-- End Old Book -->

	<%@include file="All_Component/footer.jsp"%>

</body>
</html>
