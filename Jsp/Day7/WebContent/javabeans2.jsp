<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈즈를 이용한 회원가입 테스트</title>
</head>
<body>
	<h2>자바빈즈를 이용한 회원가입 테스트</h2>
	<form method="post" action="javabeans2_ok.jsp">
		<p>아이디 : <input type="text" name="userid"></p>
		<p>비밀번호 : <input type="text" name="userpw"></p>
		<p>이름 : <input type="text" name="name"></p>
		<p>이메일 : <input type="email" name="mem_email"></p>
		<p>직업 : <input type="text" name="job"></p>
		<p><input type="submit" value="가입완료"></p>
	</form>
</body>
</html>