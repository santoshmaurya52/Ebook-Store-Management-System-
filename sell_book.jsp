<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sell::Book.....</title>
<%@include file="All_Component/AllCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"/>
</c:if>

	<%@include file="All_Component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="text-center text-primary p-1">Sell Old Book</h5>
						
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						
						<form action="add_old_book" method="post" enctype="multipart/form-data">
						<input type="hidden" value="${userobj.email}" name="user">
				

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									required="required" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									required="required" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" type="number" class="form-control"
									required="required" id="exampleInputPassword1"
									aria-describedby="emailHelp">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									required="required" id="exampleFormControlFile1">
							</div>

							<button type="Submit" class="btn btn-primary">Sell</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>