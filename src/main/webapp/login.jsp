<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<%@include file="/AllComponent/allcss.jsp" %>
</head>
<body>
<%@include file="/AllComponent/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card-body">
					 <c:if test="${not empty message }">
			<p class="text-center text-danger">${message}</p>
			<c:remove var = "message" />
			</c:if>
			<c:if test="${not empty lmsg }">
			<p class="text-center text-danger">${lmsg}</p>
			<c:remove var = "lmsg" />
			</c:if>
					<h2 class="text-center">Log In</h2>
					<form action="Login" method="post">
					  <div class="form-group">
					    <label for="exampleInputEmail1">Email address</label>
					    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
					    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">Password</label>
					    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
					  </div>
					  <div class="text-center">
					  	<button type="submit" class="btn btn-primary">Submit</button>
					  </div>
					  
					</form>
				</div>
			</div>
		</div>
	</div>
<%@include file="/AllComponent/footer.jsp" %>
</body>
</html>