<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="allcss.jsp" %>
</head>
<body>
<%
if(session.getAttribute("user")=="admin@gmail.com"){
%>
<%@include file="navbar.jsp" %>



<h2 class="text-center text-success">Hello,Admin</h2>
<div class="container">
	<div class="row gap-20">
	<a href="addbook.jsp" class="col-md-3 bg-col-w gap-20">
		
			<div class="card-body text-center">
			<i class="fa-solid fa-plus fa-3x"></i>
				<h3>Add Book</h3>
				<p>- - - -</p>
			</div>
		
		</a>
		<a href="viewbook.jsp" class="col-md-3 bg-col-w gap-20">
		
			<div class="card-body text-center">
				<i class="fa-solid fa-book fa-3x"></i>
				<h3>All Book</h3>
				<p>- - - -</p>
			</div>
		
		</a>
		<a href="orderbook.jsp" class="col-md-3 bg-col-w gap-20">
		
			<div class="card-body text-center">
			<i class="fa-brands fa-jedi-order fa-3x"></i>
				<h3>Order</h3>
				<p>- - - -</p>
			</div>
		
		</a>
		<a href="../logout.jsp" class="col-md-3 bg-col-w gap-20">
		
			<div class="card-body text-center">
			
			<i class="fa-solid fa-right-from-bracket fa-3x"></i>
				<h3>Log out</h3>
				<p>- - - -</p>
			</div>
			</a>
		
	</div>
	</div>
	

	
<%@include file="footer.jsp" %>
<%
}
else{
	session.setAttribute("message", "Do Login");
	
	response.sendRedirect("../login.jsp");
}
%>
</body>
</html>