<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.*,com.db.*,com.entity.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<%@include file="/AllComponent/allcss.jsp" %>
</head>
<body>
<%
	String email=request.getParameter("id");
	
	User obj=(User)session.getAttribute("ob");
	Cartdaoimpl ob=new Cartdaoimpl(DbConnect.getCon());
	List<CartAdd> list=ob.viewMyCart(email);
	
%>
<%@include file="/AllComponent/navbar.jsp" %>
	<div class="container">
		<div class="row gap20 mt-5">
			<div class="col-md-6 text-center bg-col-w">
				<table class="table text-center">
					<h1 class="text-success text-center"> Your Selected Books</h1>
					 <thead>
					    <tr>
					      <th scope="col">BookId</th>
					      <th scope="col">Book Name</th>
					      <th scope="col">Author</th>
					      <th scope="col">Price</th>
					      <th scope="col">Action</th>
					    </tr>
					  </thead>
					   <tbody>
					   	<%
					   		Double total_price=0.0;
					   		for(CartAdd c:list){
					   			total_price=c.getTotal_price();
					   	%>
						    <tr>
						      <th scope="row"><%=c.getBid()%></th>
						      <td><%=c.getBookname() %></td>
						      <td><%=c.getAuthorname() %></td>
						      <td><%=c.getPrice() %></td>
						      <td><a href="deletecart.jsp?bid=<%= c.getBid() %>" class="btn btn-danger">Remove</a></td>
						    </tr>
						    <%
					   		}
						    %>
						    <tr>
						    	<td>Total Price:</td>
						    	<td></td>
						    	<td></td>
						    	<td><%=total_price %></td>
						    </tr>
						 </tbody>
				</table>
				
			</div>
			
			<div class="row text-center bg-col-w ">
			<h1 class="text-center text-success">Your Delivery details</h1>
				<div class="col-md-6">
						<form action="Order" method="post">
							  <div class="form-group">
								    <label for="Name">Name</label>
								    <input type="text" class="form-control" id="name" name="name"  value="<%=obj.getName()%>">
								    <input type="hidden" class="form-control" id="name" name="id"  value="<%=obj.getId()%>">
								  </div>
								  <div class="form-group">
								    <label for="phone">Phone number</label>
								    <input type="text" class="form-control" id="phone" placeholder="Phone" name="phone"  value="<%=obj.getPhone()%>">
								  </div>
								  <div class="form-group">
								    <label for="land">Land Mark</label>
								    <input type="text" class="form-control" id="land" placeholder="landmark" name="land">
								  </div>
								  <div class="form-group">
								    <label for="state">State</label>
								    <input type="text" class="form-control" id="state" placeholder="state" name="state">
								  </div>
								   <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Payment method</label>
									  <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref" name="method">
									    <option selected>Choose...</option>
									    <option value="COD">COD</option>
									    <option value="Online">Online</option>
									    
									  </select>
									  <div class="mt-5 text-center" >
					<input type="submit" class="btn btn-primary" value="Order">
					<a href="home.jsp" class="btn btn-success text-center">Continue Shopping</a>
							
					</div>
								  
				</div>
				<div class="col-md-6">
					<label for="Name">Email</label>
								    <input type="text" class="form-control" id="name" name="email"  value="<%=obj.getEmail()%>">

								  <div class="form-group">
								    <label for="city">City</label>
								    <input type="text" class="form-control" id="city" placeholder="city" name="city" >
								  </div>
								  <div class="form-group">
								    <label for="address">Address</label>
								    <input type="text" class="form-control" id="address" placeholder="address" name="address">
								  </div>
								  <div class="form-group">
								    <label for="state">Pin Code</label>
								    <input type="text" class="form-control" id="pincode" placeholder="pincode" name="pincode">
								  </div>
								  
				</div>
				</form>
				
					
							
					
				</div>
				
			</div>
			
		</div>
		
	</div>
<%@include file="/AllComponent/footer.jsp" %>
</body>
</html>