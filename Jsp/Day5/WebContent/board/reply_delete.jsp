<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	if(session.getAttribute("userid")== null){
	
		
%>
		<script>
			alert("로그인 후 이용하세요");
			location.href='../login.jsp';
		</script>
<%
	}else{
		if(request.getParameter("re_idx") == null || request.getParameter("re_idx").equals("")){
%>
				<script>
					alert("잘못된 접근입니다.");
					location.href='../login.jsp';
				</script>
<%
		}else{
			String userid = (String)session.getAttribute("userid");
			String username = (String)session.getAttribute("username");
			String re_idx = request.getParameter("re_idx");
			String b_idx = request.getParameter("b_idx");
			
			//DB 연결
			Connection conn = null;
	   		PreparedStatement pstmt = null;
	   		ResultSet rs = null;
	      
	   		String sql = "";
	   		String url = "jdbc:mysql://localhost:3306/jspstudy";
	   		String uid = "root";
	   		String upw = "1234";
	   		
	   		try{
	   			Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
	   			conn = DriverManager.getConnection(url, uid, upw);
	   			if(conn != null){
	   				sql = "delete from tb_reply where re_idx=?";
	   				pstmt = conn.prepareStatement(sql);
	   				pstmt.setString(1, re_idx);
	   				pstmt.executeUpdate();
	   			}
	   		}catch(Exception e){
	   			e.printStackTrace();
	   		}
%>
		<script>
			alert('삭제되었습니다.');
			// 뷰로 가려면 원글 번호가 필요함
			location.href='view.jsp?b_idx=<%=b_idx%>';
		</script>
<%
		}
	}
%>