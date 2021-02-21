<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 만들기</title>
<script>
	const payment = function(){
		alert("결제 페이지로 이동합니다.");
		location.href='basket_payment.jsp';
	}
</script>
</head>
<body>
	<h2>장바구니 만들기</h2>
	<form method="post" action="basket_ok.jsp">
		<p>
			<select name="product">
				<option value="생수">생수</option>
				<option value="사이다">사이다</option>
				<option value="콜라">콜라</option>
				<option value="커피">커피</option>
				<option value="오렌지주스">오렌지주스</option>
			</select>
		</p>
		<hr/>
		<p><input type="submit" value="추가"> <input type="button" value="결제" onclick="payment()"></p>
	</form>
	<hr/>
	<p>
		<%
			List<String> list = (List)session.getAttribute("productList");
			if(list != null) {
				for(String product : list){
					out.print(product + " ");
				}
			}
		
		%>
	</p>
</body>
</html>