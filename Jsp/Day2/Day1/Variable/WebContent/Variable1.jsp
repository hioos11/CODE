<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%
	String name = "김사과";
	int age = 20;
	double height = 160.5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 변수</title>
</head>
<body>
	<h2>현재 시간은 <%=new Date()%></h2>
	<p>이름 : <%=name%></p>
<%
	out.println("<p>나이 : " + age + "</p>");
	out.println("<p>키 : " + height + "</p>");
	
	if(age > 19){
		out.println("<p>성인입니다.</p>");
	}else{
		out.println("<p>미성년입니다.</p>");
	}
	
	for(int i=0; i<10; i++){
%>
		<p>현재 i의 값은 : <%=i%></p>
<%
	}
%>
</body>
</html>