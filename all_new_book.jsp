<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
<%@include file="All_Component/AllCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcfcf0;
}
</style>
</head>
<body>

<%
User u = (User)session.getAttribute("userobj");
%>

<c:if test="${not empty addCart }">

<div id="toast"> ${addCart} </div>

<script type="text/javascript">
	showToast();
	function showToast(content)

		{

		$('#toast').addClass("display");
		$('#toast').html(content);
		setTimeout(()=>{
			$("#toast").removeClass("display");

	}, 2000)

}
</script>

<c:remove var="addCart" scope="session"/>

</c:if>

	<%@include file="All_Component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
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
							Categories:<%=b.getBookCategory()%></p>

						<div class="row">
						
							<%
							if(u == null){
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm mr-1"> <i class="fa-solid fa-cart-plus"></i> Add Cart</a> 
							<%
							}else{
							%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm mr-1"> <i class="fa-solid fa-cart-plus"></i> Add Cart</a>
								
							<%
							}
							%>
						
							 
								<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%>
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