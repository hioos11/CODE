<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="boardDTO" class="com.koreait.board.BoardDTO"/>
<jsp:useBean id="boardDAO" class="com.koreait.board.BoardDAO"/>
<c:set var="boardList" value="${boardDAO.selectBoard()}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>
	<h2>글목록</h2>
	<table border="1" width="800">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>조회수</th>
			<th>좋아요</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="item" items="${boardList}" varStatus="status">
			<tr>
				<td>${status.count}</td>		
				<td>${item.title}</td>		
				<td>${item.name}(${item.userid})</td>		
				<td>${item.hit}</td>		
				<td>${item.up}</td>		
				<td>${item.regedate }</td>		
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6">1 2 3 4 5 6 7 8 9</td>
			
		</tr>
		<tr>
			<td colspan="6"><input type="button" value="글작성"> <input type="button" value="돌아가기"></td>
		</tr>
	</table>
</body>
</html>