<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.koreait.Member"%>
<%
	Member member1 = new Member();
	member1.setUserid("apple");
	member1.setUserpw("1111");
	member1.setName("김사과");
%>
<jsp:useBean id="member2" class="com.koreait.Member" scope="page"/>
<jsp:setProperty property="userid" name="member2" value="banana"/>
<jsp:setProperty property="userpw" name="member2" value="2222"/>
<jsp:setProperty property="name" name="member2" value="반하나"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈즈 테스트</title>
</head>
<body>
	<h2>자바빈즈 테스트</h2>
	<hr/>
	<p>member1의 아이디 : <%=member1.getUserid()%></p>
	<p>member1의 비밀번호 : <%=member1.getUserpw()%></p>
	<p>member1의 이름 : <%=member1.getName()%></p>
	<hr/>
	<p>member2의 아이디 : <jsp:getProperty property="userid" name="member2"/></p>
	<p>member2의 비밀번호 : <jsp:getProperty property="userpw" name="member2"/></p>
	<p>member2의 이름 : <jsp:getProperty property="name" name="member2"/></p>
</body>
</html>