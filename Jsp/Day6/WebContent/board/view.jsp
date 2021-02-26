<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
		String b_idx = "";
		String b_userid = "";
		String b_name = "";
		String b_title = "";
		String b_content = "";
		String b_regdate = "";
		String b_up = "";
		String b_hit = "";
		
		
		//DB 연결
		
		Connection conn = null;
   		PreparedStatement pstmt = null;
   		ResultSet rs = null;		
   		String sql = "";
   		String url = "jdbc:mysql://localhost:3306/jspstudy";
   		String uid = "root";
   		String upw = "1234";	
		// view.jsp로 직접 페이지 접속한 경우 	
		if(request.getParameter("b_idx") == null || request.getParameter("b_idx").equals("")){
%>
			<script>
				alert("잘못된 접근입니다.");
				location.href='../login.jsp';
			</script>
<%
		}else{
			b_idx = request.getParameter("b_idx");
			
	   		
	   		try{
	   			Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
	   			conn = DriverManager.getConnection(url, uid, upw);
	   			if(conn != null){
	   				
	   				// 조회수 1 증가시키는
	   				sql = "update tb_board set b_hit = b_hit + 1 where b_idx=?";
	   				pstmt = conn.prepareStatement(sql);
	   				pstmt.setString(1, b_idx);
	   				pstmt.executeUpdate();
	   				
	   				
					sql = "select * from tb_board where b_idx=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,b_idx);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						b_userid = rs.getString("b_userid");
						b_name = rs.getString("b_name");
						b_title = rs.getString("b_title");
						b_content = rs.getString("b_content");
						b_regdate = rs.getString("b_regdate");
						b_up = rs.getString("b_up");
						b_hit = rs.getString("b_hit");
						
					}
	   			}
	   		}catch(Exception e){
	   			e.printStackTrace();
	   		}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<script>
	function up(){
		'use strict';
		const httpRequest = new XMLHttpRequest();
		// 상태가 바뀔때마다 호출되는 함수
		httpRequest.onreadystatechange = function(){
			if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
				alert('좋아요 완료');
				document.getElementById('up').innerHTML = httpRequest.responseText;
			}
		}
		httpRequest.open('GET','up_ok.jsp?b_idx=<%=b_idx%>', true);
		httpRequest.send();
		
	}


</script>
</head>
<body>
	<h2>글보기</h2>
	<p>제목 : <%=b_title%></p>
	<p>작성자 : <%=b_name%>(<%=b_userid%>)</p>
	<p>조회수 : <%=b_hit%></p>
	<p>좋아요 : <span id="up"><%=b_up%></span></p>
	<p>날짜 : <%=b_regdate %></p>
	<p>내용</p>
	<p><%=b_content%></p>
	<p>
<%
	if(b_userid.equals(userid)){
%>
	<input type="button" value="수정" onclick="location.href='./edit.jsp?b_idx=<%=b_idx%>'"> 
	<input type="button" value="삭제" onclick="location.href='./delete.jsp?b_idx=<%=b_idx%>'"> 
<%
	}
%>
	<input type="button" value="좋아요" onclick="up()"> <input type="button" value="리스트" onclick="location.href='./list.jsp'"></p>
	<hr/>
	<form method="post" action='reply_ok.jsp'>
		<input type="hidden" name="re_boardIdx" value="<%=b_idx%>">	<!-- 받아오는건 b_idx로, 넘기는건 re_boardIdx로 -->
		<p><%=username%>(<%=userid%>) : <input type="text" name="re_content"> <input type="submit" value="확인"></p>	
	</form>
	<hr/>
<%
	sql = "select * from tb_reply where re_boardIdx=? order by re_idx desc";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, b_idx);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String re_idx = rs.getString("re_idx");
		String re_userid = rs.getString("re_userid");
		String re_name = rs.getString("re_name");
		String re_content = rs.getString("re_content");
		String re_regdate = rs.getString("re_regdate");
		String re_boardIdx = rs.getString("re_boardIdx");
%>	
	<p><%=re_name %>(<%=re_userid %>) : <%=re_content %> (<%=re_regdate %>)
	<%
		if(userid.equals(re_userid)){
	
	%>
	<input type="button" value="삭제" onclick="location.href='reply_delete.jsp?re_idx=<%=re_idx%>&b_idx=<%=b_idx%>'">
	<%
		}
	%>
	</p>
</body>
</html>
<%
	}
}
%>