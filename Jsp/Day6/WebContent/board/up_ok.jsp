<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	response.setCharacterEncoding("UTF-8");
	if(session.getAttribute("userid")== null){
	
		
%>
		<script>
			alert("로그인 후 이용하세요");
			location.href='../login.jsp';
		</script>
<%
	}else{
		if(request.getParameter("b_idx") == null || request.getParameter("b_idx").equals("")){
%>
				<script>
					alert("잘못된 접근입니다.");
					location.href='../login.jsp';
				</script>
<%
		}else{
			String b_idx = request.getParameter("b_idx");
			
			//DB 연결
			Connection conn = null;
	   		PreparedStatement pstmt = null;
	   		ResultSet rs = null;
	      
	   		String sql = "";
	   		String url = "jdbc:mysql://localhost:3306/jspstudy";
	   		String uid = "root";
	   		String upw = "1234";
	   		String b_up = "";
	   		
	   		try{
	   			Class.forName("com.mysql.jdbc.Driver"); // com.mysql.cj.jdbc.Driver
	   			conn = DriverManager.getConnection(url, uid, upw);
	   			if(conn != null){
	   				sql = "update tb_board set b_up=b_up+1 where b_idx=?";
	   				pstmt = conn.prepareStatement(sql);
	   				pstmt.setString(1, b_idx);
	   				pstmt.executeUpdate();
	   				
	   				sql = "select b_up from tb_board where b_idx=?";
	   				pstmt = conn.prepareStatement(sql);
	   				pstmt.setString(1,b_idx);
	   				rs = pstmt.executeQuery();
	   				
	   				if(rs.next()){
	   					b_up = rs.getString("b_up");
	   					out.print(b_up);
	   					
	   				}
	   			}
	   		}catch(Exception e){
	   			e.printStackTrace();
	   		}

		}
	}
%>