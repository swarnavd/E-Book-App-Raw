<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<%@include file="/AllComponent/allcss.jsp" %>
</head>
<body>
	<%@include file="/AllComponent/navbar.jsp" %>
	<div class="container">
	<div class="row">
	<div class="col-md-4 offset-md-4">
		<div class="card-body">
			<h2 class="text-center">Register Here</h2>
			<c:if test="${not empty message }">
			<p class="text-center text-success">${message}</p>
			<c:remove var = "message" scope="session"/>
			</c:if>
			
			<c:if test="${not empty errormessage }">
			<p class="text-center text-danger">${errormessage}</p>
			<c:remove var = "errormessage" scope="session"/>
			</c:if>
					<form action="Register" method="post">
					 <div class="form-group">
    
      <label for="validationDefault01">Name*</label>
      <input type="text" class="form-control" name="name" id="validationDefault01" placeholder="First name"  required>
    </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address*</label>
    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp"  class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  <div class="form-group">
    <label for="phone">Phone*</label>
    <input type="text" class="form-control" id="phone"  name="phone" placeholder="Enter Phone">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password*</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
		</div>
		</div>
		</div>
	</div>
	<%@include file="/AllComponent/footer.jsp" %>
</body>
</html>