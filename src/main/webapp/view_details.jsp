<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.db.*,com.dao.*,com.entity.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<%@include file="/AllComponent/allcss.jsp" %>
</head>
<body>
<%@include file="/AllComponent/navbar.jsp" %>
	<%
		int id=Integer.parseInt(request.getParameter("id"));
		Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
		BookAdd b = ob.viewDetails(id);
		
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="card-body text-center">
					<img src="book/<%=b.getImage() %>" class="img-con">
					<h3 class="text-success mt-3">Book Name:<%=b.getName() %></h3>
					<h3 class="text-success mt-3">Author Name:<%=b.getAuthorName() %></h3>
					<h3 class="text-success mt-3">Category:<%=b.getCategory() %></h3>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="card-body text-center">
					<h1 class="text-dark mt-3 "><%=b.getName() %></h3>
					<a href="" class="text-primary big">Contact Seller</a><br>
					<a href="" class="text-primary big"><i class="fa fa-envelope" aria-hidden="true"></i>Email:admin</a>
					<h3 class="text-success mt-3">Category:<%=b.getCategory() %></h3>
				</div>
				<div class="row">
					<div class="col-md-4 text-center text-danger">
						<i class="fa-solid fa-money-bill-wave fa-3x"></i>
						<h3 class="text-dark">Cash on delivery</h3>
					</div>
					
					<div class="col-md-4 text-center text-danger">
						<i class="fa fa-undo fa-3x" aria-hidden="true"></i>
						<h3 class="text-dark">Return available</h3>
					</div>
					
					<div class="col-md-4 text-center text-danger">
						<i class="fas fa-shipping-fast fa-3x"></i>
						<h3 class="text-danger">Free Delivery</h3>
					</div>
					</div>
					<div class="con text-center p-5">
						
							<a href="" class="btn btn-success mt-8">Continue Shopping</a>
							
							
							<a href="" class="btn btn-danger"><i class="fa fa-inr" aria-hidden="true"></i><%=b.getPrice() %></a>
						
					</div>
					
				
			</div>
		</div>
	</div>

<%@include file="/AllComponent/footer.jsp" %>
</body>
</html>