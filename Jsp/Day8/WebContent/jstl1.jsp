<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - core</title>
</head>
<body>
	<h2>jstl - core</h2>
	<hr/>
	<h3>출력</h3>
	<p>c:out</p>
	<p><c:out value="${'Hello jstl'}"/></p>
	<hr/>
	<h3>변수 선언</h3>
	<p>c:set</p>
	<c:set var="userid" value="apple"/>
	<p>아이디 : ${userid}</p>
	<hr/>
	<h3>배열 선언</h3>
	<p>c:set</p>
	<c:set var="memList" value='<%=new String[]{"apple","banana","orange"}%>'/>
	<p>memList : ${memList}</p> <!-- 배열의 주소값이 출력됨 -->
	<p>memList[0] : ${memList[0]}</p>
	<hr/>
	<h3>변수 삭제</h3>
	<p>c:remove</p>
	<c:remove var="userid"/>
	<p>아이디 : ${userid}</p>
	<hr/>
	<h3>조건문 - if</h3>
	<p>c:if</p>
	<c:set var="userid" value="apple"/>
	<c:if test="${userid eq 'apple' }">
		<p>로그인 했습니다.</p>
	</c:if>
	<c:remove var="userid"/>
		<c:if test="${!userid}">
		<p>로그아웃 되었습니다.</p>
	</c:if>
	<hr/>
	<h3>empty 비교</h3>
	<p>empty</p>
	<c:if test="${empty userid}">
		<p>userid 데이터가 없습니다.</p>
	</c:if>
	<hr/>
	<h3>조건문 - choose</h3>
	<p>c:choose</p>
	<c:set var="userpw" value="1111"/>
	<!-- switch문과 비슷 -->
	<c:choose>
		<c:when test="${userid}">
			<p>로그인 되었습니다.</p>
		</c:when>
		<c:when test="${empty userpw}">
			<p>비밀번호를 입력하세요</p>
		</c:when>
		<c:otherwise>
			<p>비밀번호를 입력했어요</p>
		</c:otherwise>
	</c:choose>
	<hr/>
	<%
		String[] studentList = {"김사과", "반하나", "오렌지", "이메론"};
		pageContext.setAttribute("studentList", studentList);
	%>
	<h3>반복문 - forEach</h3>
	<table border="1" width="600">
		<tr>
			<th>index</th>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<c:forEach var="student" items="${studentList}" varStatus="status">
			<tr>
				<td>${status.index}</td>
				<td>${status.count}</td>
				<td>${student}</td>
			</tr>
		</c:forEach>
	</table>
	<hr/>
</body>
</html>