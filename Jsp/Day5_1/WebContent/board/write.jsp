<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid")== null){
		
%>
	<script>
		alert("로그인 후 이용하세요");
		location.href='../login.jsp';
	</script>
<%
	}else{
		String userid = (String)session.getAttribute("userid");
		String username = (String)session.getAttribute("username");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h2>글쓰기</h2>
	<!-- 데이터를 전송하기 위해서는 form태그가 필수 -->
	<form method="post" action="write_ok.jsp">
		<p>작성자 : <%=username%>(<%=userid%>)</p>
		<p><label>제목 : <input type="text" name="b_title"></label></p>
		<p>내용</p>
		<p><textarea rows="5" cols="40" name="b_content"></textarea></p>
		<p><input type="submit" value="등록"> <input type="button" value="리스트" onclick="location.href='list.jsp'"></p>	
	</form>
</body>
</html>
<%
}
%>