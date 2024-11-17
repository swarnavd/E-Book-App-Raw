<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.Bookdaoimpl,com.db.DbConnect,com.entity.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Book</title>
<%@include file="allcss.jsp" %>
</head>

<body>
<%@include file="navbar.jsp" %>
	<div class="container">
		<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<!-- <th scope="col">Id</th> -->
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Image</th>
				<th scope="col">Action</th>
				<th scope="col">Action</th>
			</tr>
		</thead>	
		<%
			Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
			BookAdd br=new BookAdd();
			List<BookAdd> list=ob.viewBook(br);
			for(BookAdd b:list){
	%>
		<tr>
				<!-- <th scope="col">Id</th> -->
				<td scope="col"><%= b.getName()%></td>
				<td scope="col"><%=b.getAuthorName() %></td>
				<td scope="col"><%= b.getPrice()%></td>
				<td scope="col"><%= b.getCategory()%></td>
				<td scope="col"><%= b.getStatus()%></td>
				<td scope="col"><img src="../book/<%= b.getImage()%>" class="view-img"></td>
				<td scope="col"><a href="edit.jsp?id=<%=b.getId() %>" class="btn btn-success">Edit</a></td>
				<td scope="col"><a href="delete.jsp?id=<%=b.getId() %>" class="btn btn-danger">Delete</a></td>
			</tr>
			<%
			}
		%>
		</table>
		
		
	</div>
<%@include file="footer.jsp" %>
</body>
</html>