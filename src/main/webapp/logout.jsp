<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	HttpSession ses=request.getSession();
	
	ses.removeAttribute("user");
	ses.invalidate();
	HttpSession ses2=request.getSession();
	ses2.setAttribute("lmsg", "Log out successfull!!");
	response.sendRedirect("login.jsp");
%>
</body>
</html>