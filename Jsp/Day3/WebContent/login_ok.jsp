<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");

	// admin / 1234
	
	if(userid.equals("admin") && userpw.equals("1234")){
		// 로그인 성공
		session.setAttribute("userid",userid);
		
		
%>
	<script>
		alert("로그인 되었습니다.");
		location.href = 'login.jsp';		// 페이지 이동. 캐시가 지워지고 refresh되어 돌아간다.
		
	</script>
		
<%		
	}else{
		// 로그인 실패
%>
	<script>
		alert('아이디 또는 비밀번호를 확인하세요');
		history.back();						// 캐시가 지워지지 않고 기존 정보가 남아서 돌아간다. 입력한 아이디가 남아있다.
	
	</script>
<%
	}
%>