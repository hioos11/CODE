<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String userid = null;
	
	if(cookies != null){
		for(Cookie cookie : cookies){
			if("userid".equals(cookie.getName())){
				userid = cookie.getValue();	// admin이 저장됨.
				
			}
		}
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
<%
	if(userid == null){
			
%>
	
	<form method="post" action="login_ok.jsp">
		<p><label>아이디 : <input type="text" name="userid"></label></p>
		<p><label>비밀번호 : <input type="password" name="userpw"></label></p>
		<p><input type="submit" value="로그인"></p>
		
	</form>
<%
	}else{
%>
	<h3><%=userid %>님 환영합니다.</h3>
	<p><input type="button" value="로그아웃" onclick="location.href='logout.jsp'"></p>
<%
	}
%>
</body>
</html>