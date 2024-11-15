<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.User"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("ob")==null){
	response.sendRedirect("login.jsp");
}

%>
<c:if test="${not empty ob }">
			<p class="text-center text-success">${ob.name}</p>
			
			</c:if>
</body>
</html>