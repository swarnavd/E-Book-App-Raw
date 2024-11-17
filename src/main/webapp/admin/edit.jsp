<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.Bookdaoimpl,com.db.*,com.entity.*"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<%@include file="allcss.jsp" %>
</head>
<body>
<%
	Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
	String idp=request.getParameter("id");
	int id=Integer.parseInt(idp);
	System.out.println(id);
	//Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
	//BookAdd b=new BookAdd();
	BookAdd b=ob.editBook(id);
	
	
	
	
%>
<%@include file="navbar.jsp" %>
	<form action="../Edit" method="post" enctype="multipart/form-data">
	<div class="row">
	<div class="col-md-4 offset-md-4">
	<div class="card-body">
	<h1>Edit Book</h1>
	<c:if test="${not empty message }">
			<p class="text-center text-success">${message}</p>
			<c:remove var = "message" scope="session"/>
			</c:if>
			<input type="text" value="<%=b.getId()%>" name="idp">
	  <div class="form-group">
	    <label for="bookname">Book name</label>
	    <input type="text" class="form-control" name="bname" id="exampleInputEmail1" placeholder="Enter book name" value="<%=b.getName()%>">
	  </div>
	  <div class="form-group">
	    <label for="authorname">Author name</label>
	    <input type="text" class="form-control" name="aname" id="exampleInputEmail1" placeholder="Enter author name" value="<%=b.getAuthorName()%>">
	  </div>
	  
	  <div class="form-group">
	    <label for="Price">Price</label>
	    <input type="text" class="form-control" name="price" id="exampleInputEmail1" placeholder="Enter price" value="<%=b.getPrice()%>">
	  </div>
	  
	  <!-- Category Dropdown -->
<div class="form-group">
    <label for="category">Category</label>
    <select class="custom-select mr-sm-2" name="category" id="inlineFormCustomSelect">
        <option value="New" <%= "New".equals(b.getCategory()) ? "selected" : "" %>>New</option>
        <option value="Old" <%= "Old".equals(b.getCategory()) ? "selected" : "" %>>Old</option>
    </select>
</div>

<!-- Status Dropdown -->
<div class="form-group">
    <label for="status">Book Status</label>
    <select class="custom-select mr-sm-2" name="status" id="inlineFormCustomSelect">
        <option value="Active" <%= "Active".equals(b.getStatus()) ? "selected" : "" %>>Active</option>
        <option value="In-active" <%= "In-active".equals(b.getStatus()) ? "selected" : "" %>>In-active</option>
    </select>
</div>
	  
	  <div class="custom-file">
		  <input type="file" class="custom-file-input" name="file" id="customFile" value="<%= b.getImage()%>">
		  <label class="custom-file-label" for="customFile">Choose Image</label>
		</div>
	  <button type="submit" class="btn btn-primary text-center">Add</button>
	  </div>
	  </div>
	  </div>
</form>
<%@include file="footer.jsp" %>
</body>
</html>