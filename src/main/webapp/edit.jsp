<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.*,com.entity.*,com.db.*"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
<%@include file="/AllComponent/allcss.jsp" %>
</head>
<body>
<%
User obj=(User)session.getAttribute("ob");


%>
	<%@include file="/AllComponent/navbar.jsp" %>
	<div class="container">
	<div class="row mt-3">
	<div class="col-md-4 offset-md-4 bg-col-w p-3">
		<div class="card-body">
			<h2 class="text-center">Edit Your Profile</h2>
			<c:if test="${not empty message }">
			<p class="text-center text-success">${message}</p>
			<c:remove var = "message" scope="session"/>
			</c:if>
			
			<c:if test="${not empty errormessage }">
			<p class="text-center text-danger">${errormessage}</p>
			<c:remove var = "errormessage" scope="session"/>
			</c:if>
					<form action="EditUser" method="post" >
					 <div class="form-group">
    
      <label for="validationDefault01">Name*</label>
      <input type="text" name="name" class="form-control" name="name" id="validationDefault01" placeholder="First name"  value="<%=obj.getName()%>" required>
    </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address*</label>
    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp"  value="<%=obj.getEmail()%>"placeholder="Enter email">
    <input type="hidden" class="form-control"  id="exampleInputEmail1" aria-describedby="emailHelp"  value="<%=obj.getId()%>"placeholder="Enter email" name="id">
    
  </div>
 
  <div class="form-group">
    <label for="phone">Phone*</label>
    <input type="text" class="form-control" id="phone"  name="phone" placeholder="Enter Phone" value="<%=obj.getPhone()%>">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password*</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password" value="<%=obj.getPassword()%>">
  </div>
  
  <button type="submit" class="btn btn-primary">Change</button>
</form>
		</div>
		</div>
		</div>
	</div>
	<%@include file="/AllComponent/footer.jsp" %>
</body>
</html>