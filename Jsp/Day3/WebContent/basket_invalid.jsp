<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	response.sendRedirect("basket.jsp");

%>
<!-- 
<script>
	location.href="basket.jsp";
</script>
 -->