<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.*,com.admin.*,com.db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	Bookdaoimpl ob=new Bookdaoimpl(DbConnect.getCon());
	ob.delBook(id);
	response.sendRedirect("viewbook.jsp");
%>
</body>
</html>