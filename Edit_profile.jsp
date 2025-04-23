<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit::profile.....</title>
<%@include file="All_Component/AllCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="All_Component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<h4 class="text-center text-primary">Edit Profile</h4>
					
					<c:if test="${not empty failedMsg }">
						<h5 class="text-center text-danger">${failedMsg}</h5>
						<c:remove var="failedMsg" scope="session" />
						
						</c:if>
						
						<c:if test="${not empty succMsg }">
						<h5 class="text-center text-success">${succMsg}</h5>
						<c:remove var="succMsg" scope="session" />
						
						</c:if>
					
					<form action="update_profile" method="post">
					<input type="hidden" value="${userobj.id }" name="id">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"
									placeholder="" value="${userobj.name}">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									placeholder="" value="${userobj.email}">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone No..</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phone"
									placeholder="" value="${userobj.phone}">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password" placeholder="">
							 </div>

							<div class="text-center p-2">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>

						</form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>