<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.*,com.db.*,com.dao.*,java.util.*"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<%@include file="/AllComponent/allcss.jsp" %>
</head>
<body>
<%
if(session.getAttribute("ob")==null){
	response.sendRedirect("login.jsp");
}


%>
</body>
<%@include file="/AllComponent/navbar.jsp" %>
	<!-- Starting of Recent Book -->
<div class="container">
<h3 class="text-center">New Book</h3>
	<div class="row">
	<%
	Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
	
	List<BookAdd> list=ob.showBookHome();
	for(BookAdd b:list){

	%>
		
		<div class="col-md-3 bg-col-w">
			<div class="card-body text-center">
				<img src="book/<%=b.getImage() %>" class="img-con">
				<p><%=b.getName() %></p>
				<p><%=b.getAuthorName() %></p>
				<p>Categories:<%=b.getCategory() %></p> 
				<div class="row text-center">
					<%
						if(session.getAttribute("ob")!=null){
					%>
						
						<a href="Cart?bid=<%=b.getId() %>&id=${ob.email}" class="btn btn-sm btn-danger ml-2">Add cart</a>
					<%
						}
						else{
					%>
							<a href="login.jsp" class="btn btn-sm btn-danger ml-2">Add cart</a>
					
					<%
					}
					%>
					
					<a href="view_details.jsp?id=<%=b.getId() %>" class="btn btn-sm btn-success ml-2"">View Details</a>
					<a href="" class="btn btn-sm btn-danger ml-2""><i class="fa fa-inr" aria-hidden="true"></i><%=b.getPrice() %></a>
				</div>
			</div>
		</div>
	<%
	}
	%>
	</div>
	<div class="text-center">
		<a href="all_new_book.jsp" class="btn btn-sm btn-danger text-white">View all</a>
	</div>
	
</div>
<!-- Ending Of recent book -->


<!-- Starting of new Book -->
<hr>
<div class="container">
	
<h3 class="text-center">Recent Book</h3>

	<div class="row">
	<%
	Bookdaoimpl ob1=new Bookdaoimpl(DbConnect.getCon());
	
	List<BookAdd> lis=ob1.getRecentBook();
	for(BookAdd b:lis){

	%>
		<div class="col-md-3 bg-col-w">
			<div class="card-body text-center">
				<img src="book/<%=b.getImage() %>" class="img-con">
				<p><%=b.getName() %></p>
				<p><%=b.getAuthorName() %></p>
				<p>Categories:<%=b.getCategory() %></p>
				<input type="hidden" value="<%=b.getId()%>" name="id">
				<div class="row text-center">
				<%
				if(b.getCategory().equals("New")){	
				%>
					<a href="" class=" col-md-4 btn btn-sm btn-danger ml-2">Add cart</a>
					<%
						}					
					%>
					<a href="view_details.jsp?id=<%=b.getId() %>" class="btn col-md-4 btn-sm btn-success ml-2">View</a>

					<a href="" class="btn btn-sm btn-danger ml-2""><i class="fa fa-inr" aria-hidden="true"></i><%=b.getPrice() %></a>
				</div>
			</div>
		</div>
		<%
	}
	%>
	</div>
	
	<div class="text-center">
		<a href="all_recent_book.jsp" class="btn btn-sm btn-danger text-white">View all</a>
	</div>
	
	
</div>


<hr>
<%@include file="/AllComponent/footer.jsp" %>
</html>