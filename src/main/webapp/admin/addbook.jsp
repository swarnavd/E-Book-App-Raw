<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>
<%@include file="allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
	<form action="<c:url value='/Book' />" method="post" enctype="multipart/form-data">
	<div class="row">
	<div class="col-md-4 offset-md-4">
	<div class="card-body">
	<h1>Add Book</h1>
	<c:if test="${not empty message }">
			<p class="text-center text-success">${message}</p>
			<c:remove var = "message" scope="session"/>
			</c:if>
	  <div class="form-group">
	    <label for="bookname">Book name</label>
	    <input type="text" class="form-control" name="bname" id="exampleInputEmail1" placeholder="Enter book name">
	  </div>
	  <div class="form-group">
	    <label for="authorname">Author name</label>
	    <input type="text" class="form-control" name="aname" id="exampleInputEmail1" placeholder="Enter author name">
	  </div>
	  
	  <div class="form-group">
	    <label for="Price">Price</label>
	    <input type="text" class="form-control" name="price" id="exampleInputEmail1" placeholder="Enter price">
	  </div>
	  
	  <div class="form-group">
	  <label for="category">Category</label>
	  	<select class="custom-select mr-sm-2" name="category" id="inlineFormCustomSelect">
        <option selected>Choose...</option>
        <option value="New">New</option>
        <option value="Old">Old</option>
      </select>
	  </div>
	  
	   <div class="form-group">
	  <label for="category">Book Status</label>
	  	<select class="custom-select mr-sm-2" name="status" id="inlineFormCustomSelect">
        <option selected>Choose...</option>
        <option value="Active">Active</option>
        <option value="In-active">In-active</option>
      </select>
	  </div>
	  
	  <div class="custom-file">
		  <input type="file" class="custom-file-input" name="file" id="customFile">
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