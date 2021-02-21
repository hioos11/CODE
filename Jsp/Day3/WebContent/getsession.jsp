<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = null;
	if(session.getAttribute("userid") != null) {
		userid = (String)session.getAttribute("userid");
		
	} else {
		userid = "아이디 없음";
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션</title>
</head>
<body>
	<h2>세션</h2>
	<p>세션 아이디 : <%=session.getId() %> </p>
	<p>아이디 : <%=userid %> </p>
	
</body>
</html>