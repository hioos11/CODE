<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500</title>
<style>
	h2 { font-size: 50px; }
</style>
</head>
<body>
	<h2>500</h2>
	<p>에러 타입 : <%=exception.getClass().getName() %></p>
	<p>에러 타입 : <%=exception.getMessage() %></p>
	
</body>
</html>