<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.db.*,com.dao.*,com.entity.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file="/AllComponent/allcss.jsp" %>
</head>
<body>
<%@include file="/AllComponent/navbar.jsp" %>
<%
	Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
	
	List<BookAdd> list=ob.allRecentBook();
%>
<div class="container">
<div class="row">
<%
	for(BookAdd b:list){
		%>
	<div class="col-md-3">
		<div class="card-body text-center bg-col-w">
			<img src="book/<%=b.getImage() %>" class="img-con">
				<p><%=b.getName() %></p>
				<p><%=b.getAuthorName() %></p>
				<p>Categories:<%=b.getCategory() %></p>
				<div class="row text-center">
				<%
				if(b.getCategory().equals("New")){	
				%>
					<a href="" class="btn btn-sm btn-danger ml-2">Add cart</a>
					<%
						}					
					%>
					<a href="" class="btn btn-sm btn-success ml-2"">View Details</a>
					<a href="" class="btn btn-sm btn-danger ml-2""><%=b.getPrice() %></a>
				</div>
		</div>
	</div>
	<%
	}
	%>
</div>
</div>
<%@include file="/AllComponent/footer.jsp" %>
</body>
</html>