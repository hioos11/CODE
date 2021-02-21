<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List"%>
<% 
	int sum = 0;
	List<String> list = (List)session.getAttribute("productList");
	
	if(list != null){
		for(String product : list){
			// 결제할 상품 갯수 만큼 반복
			if("생수".equals(product)){
				sum += 700;
				
			}else if("사이다".equals(product)){
				sum += 1000;
				
			}else if("콜라".equals(product)){
				sum += 1400;
				
			}else if("커피".equals(product)){
				sum += 2000;
				
			}else if("오렌지주스".equals(product)){
				sum += 1500;
				
			}
			
		}
%>
	<script>
		if(confirm('<%=sum%>원을 결제하시겠습니까?')){
			// 예
			alert('결제가 성공적으로 완료되었습니다.\n장바구니를 초기화합니다.');
			location.href="basket_invalid.jsp";
		}else {
			// 아니오
			alert("결제를 취소했습니다.");
			history.back();
			
		}
	
	</script>
<%
	}else{
		// 결제할 상품이 없음
%>
		<script>
			alert("결제할 상품이 없습니다.");
			history.back();
		</script>

<%
		
	}

%>