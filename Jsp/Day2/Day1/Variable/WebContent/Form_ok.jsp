<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data = request.getParameter("data");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>전송된 값 출력</title>
</head>
<body>
		<h2>전송된 값 출력</h2>
		<p> 값 : <%=data %></p>
</body>
</html>