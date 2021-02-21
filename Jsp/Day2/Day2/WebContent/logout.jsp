<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
			if("userid".equals(cookie.getName())){
				Cookie newCookie = new Cookie("userid","");
				newCookie.setMaxAge(0);		// 현재 쿠키를 받아와서 만료시간을 0으로 세팅해 바로 만료시킨다.
				response.addCookie(newCookie);
			}
		}	
	}
%>
<script>
	alert('로그아웃 되었습니다.');
	location.href="login.jsp";
	
</script>