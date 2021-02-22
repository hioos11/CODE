<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax</title>
</head>
<body>
	<h2>Ajax</h2>
	<button onclick="sendRequest()">요청 보내기</button>
	<p id="text"></p>
	<script>
		'use strict';
		function sendRequest(){
			const xhr = new XMLHttpRequest();
			xhr.open("GET","ajax1_ok.jsp?userid=apple&userpw=1111",true);	// 비동기식으로 설정해야 페이지를 이동하지 않고 데이터를 넘길 수 있다.
			xhr.send();//페이지가 이동하지 않고 ajax1_ok로 이동한다.
			
			// onreadystatechange : readyState 값이 바뀔 때마다 이 함수가 자동으로 호출된다.
			// XMLHttpRequest.DONE : 4, xhr.status == 200 : 
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
					document.getElementById("text").innerHTML = xhr.responseText;
				}
			}
			
		}
	</script>
</body>
</html>