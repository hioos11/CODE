<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String userid = request.getParameter("userid");
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
		if(conn !=null){
			sql = "select mem_idx from tb_member where mem_userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
		
			if(rs.next()){
				out.println("no");	//중복아이디가 있는 경우
			}else{
				out.println("ok");  //중복아이디가 없는 경우
			}
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
		
%>

