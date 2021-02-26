<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 페이지를 보여주는 것이 아니라 html요소가 필요 없다 -->
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("userid")== null){
		
%>
	<script>
		alert("로그인 후 이용하세요");
		location.href='../login.jsp';
	</script>
<%
	}else{
		// write_ok.jsp로 직접 페이지 접속한 경우 	
		if(request.getParameter("b_title") == null || request.getParameter("b_title").equals("")){
%>
			<!-- write부터 들어온게 아니라 대뜸 write_ok로 들어오면 title값이 없을 것이므로 그때는 잘못된 접근이라는 것을 알려주고 login으로 튕기게 한다. -->
			<script>
				alert("잘못된 접근입니다.");
				location.href='../login.jsp';
			</script>
<%
		}else{
			String userid = (String)session.getAttribute("userid");
			String username = (String)session.getAttribute("username");
			String b_title = request.getParameter("b_title");
			String b_content = request.getParameter("b_content");
			
			
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
	   				sql = "insert into tb_board(b_userid, b_name, b_title, b_content) values(?,?,?,?)";
	   				pstmt = conn.prepareStatement(sql);
	   				pstmt.setString(1, userid);
	   				pstmt.setString(2, username);
	   				pstmt.setString(3, b_title);
	   				pstmt.setString(4, b_content);
	   				pstmt.executeUpdate();
	   			}
	   		}catch(Exception e){
	   			e.printStackTrace();
	   		}
	   		
	   	%>
	   		<script>
		   		alert('등록되었습니다.');
	   			location.href="./list.jsp";
	   		</script>
	   	<%
		}
		
	}
		
%>