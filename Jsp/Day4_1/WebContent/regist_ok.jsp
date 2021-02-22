<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");				// userid 라는 이름을 가진 것의 value값을 가져와서 userid에 저장
	String userpw = request.getParameter("userpw");
	String username = request.getParameter("username");
	String hp = request.getParameter("hp");
	String email = request.getParameter("email");
	// 여러개 처리 위해 배열로 바꾼다.
	//String hobby = request.getParameter("hobby");
	String hobby[] = request.getParameterValues("hobby");
	String hobbystr = "";
	for(int i=0;i<hobby.length;i++){
		hobbystr = hobbystr + hobby[i] + " ";
	}
	
	// 체크박스에서 체크 된 항목의 value값들을 가져오는데 여러 개의 hobby가 있으니 배열로 가져온다.
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "";
	String url = "jdbc:mysql://localhost:3306/jspstudy";	// 프로토콜
	String uid = "root";
	String upw = "1234";
	try{
		// 드라이버 이름으로 연결 확인
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,uid,upw);
		
		// insert
		if(conn != null){
			sql += "insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email,mem_hobby, mem_ssn1,";
			sql += "mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values";
			sql += "(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			pstmt.setString(2,userpw);
			pstmt.setString(3,username);
			pstmt.setString(4,hp);
			pstmt.setString(5,email);
			pstmt.setString(6,hobbystr);
			pstmt.setString(7,ssn1);
			pstmt.setString(8,ssn2);
			pstmt.setString(9,zipcode);
			pstmt.setString(10,address1);
			pstmt.setString(11,address2);
			pstmt.setString(12,address3);
			pstmt.executeUpdate();
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	alert('회원가입 완료되었습니다.');
	location.href="login.jsp";
</script>