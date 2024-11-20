<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.db.*,com.dao.*,com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
<%@include file="/AllComponent/allcss.jsp" %>
</head>
<body>
<%
	User obj=(User)session.getAttribute("ob");

%>
<%@include file="/AllComponent/navbar.jsp" %>
	<div class="container text-center">
		<h1>Hello <%=obj.getName()%></h1>
		<div class="row j-c">
		<a href="edit.jsp">
			<div class="col-mod-6 text-center bg-col-w text-primary p-5 curve">
				
				<div class = "card-body text-center">
					<i class="fas fa-edit fa-3x"></i>
					<h2>Login & Security(Edit Profile)</h2>
				</div>
				
			</div>
			</a>
		</div>
		
		<div class="row mt-3 gap-120">
		<a href=>
			<div class="col-mod-4 text-center bg-col-w text-primary p-5 curve">
				<div class = "card-body text-center">
					<i class="fa-solid fa-location-dot fa-3x text-warning"></i>
					<h2>Your Address</h2>
					<h4>Edit address</h4>
				</div>
			</div>
			</a>
			<a href=>
			<div class="col-mod-4 text-center bg-col-w text-primary p-5 curve">
				<div class = "card-body text-center">
					<i class="fa-solid fa-location-dot fa-3x text-danger"></i>
					<h2>My Order</h2>
					<h4>Track Order</h4>
				</div>
			</div>
			</a>
			<a href=>
			<div class="col-mod-4 text-center bg-col-w text-primary p-5 curve">
				<div class = "card-body text-center">
					<i class="fa-solid fa-address-book fa-3x text-warning"></i>
					<h2>Help Center</h2>
					<h4>Contact us</h4>
				</div>
			</div>
			</a>
		</div>
	</div>
<%@include file="/AllComponent/footer.jsp" %>
</body>
</html>