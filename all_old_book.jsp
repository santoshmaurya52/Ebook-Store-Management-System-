<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Books</title>
<%@include file="All_Component/AllCss.jsp"%>
</head>
<body>
	<%@include file="All_Component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">

				<%
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list3 = dao3.getAllOldBook();
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
								class="btn btn-success btn-sm ml-5">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%>
									<i class="fa-solid fa-indian-rupee-sign"></i></a>
							</div>


						</div>
					</div>
				</div>

				<%
				}
				%>

			</div>
		</div>
</body>
</html>