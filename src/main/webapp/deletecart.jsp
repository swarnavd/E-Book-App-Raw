<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.db.*,com.entity.*,com.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int id=Integer.parseInt(request.getParameter("bid"));
	Cartdaoimpl ob=new Cartdaoimpl(DbConnect.getCon());
	ob.delCart(id);
	response.sendRedirect("cart.jsp");
%>
</body>
</html>