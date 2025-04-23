<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook RegisterPage</title>
<%@include file="All_Component/AllCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="All_Component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center p-2">Registration Page</h4>
						
						 
						
						<c:if test="${not empty SuccMsg }">
						<p class="text-center text-success">${SuccMsg }</p>
						<c:remove var="SuccMsg" scope="session"/>
						</c:if>
						
						
						<c:if test="${not empty FailedMsg }">
						<p class="text-center text-danger">${FailedMsg }</p>
						<c:remove var="FailedMsg" scope="session"/>
						</c:if>
						
						
						
						<form action="register" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="name" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"
									placeholder="">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									placeholder="">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone No..</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phone"
									placeholder="">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password" placeholder="">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & Condition</label>
							</div>

							<div class="text-center p-2">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="All_Component/footer.jsp"%>>

</body>
</html>