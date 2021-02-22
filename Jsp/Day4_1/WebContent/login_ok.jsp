<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	String url = "jdbc:mysql://localhost:3306/jspstudy";	// 프로토콜
	String uid = "root";
	String upw = "1234";
	try{
		// 드라이버 이름으로 연결 확인
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,uid,upw);
		
		if(conn != null){
			sql = "SELECT mem_idx, mem_name FROM tb_member WHERE mem_userid=? AND mem_userpw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,userpw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				// 로그인 성공
				session.setAttribute("userid",userid);
				session.setAttribute("username",rs.getString("mem_name"));
				session.setAttribute("useridx",rs.getString("mem_idx"));
				
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
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>