<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카페 소개</title>
    <link href="./CSS/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!--전체적으로 묶어주는 div-->
    <div id="container">

		<%@ include file="./include/header.jsp" %>

        <section id="intro">
            <!-- 제목 넣는 영역-->
            <div class="page-title">
                <h1>카페 소개</h1>
            </div>
            <!-- 내용 넣는 영역-->
            <div class="content">
                <div class="photo">
                    <img src="./images/coffee.jpg" alt="커피">
                </div>
                <div class="text">
                    <p>영업 시간 : 오전 9시 ~ 밤 10시</p>
                    <p>휴무 : 매주 수요일<small><i>(수요일이 공휴일인 경우 수요일 영엽, 다음날 휴무)</i></small></p>
                </div>
            </div>
        </section>

        <section id="map">
            <!-- 제목 넣는 영역-->
            <div class="page-title">
                <h1>오시는 길</h1>
            </div>
            <!-- 내용 넣는 영역-->
            <div class="content">
                <div class="photo">
                    <img src="./images/map.jpg" alt="지도">
                </div>
                <div class="text">
                    <p>서귀포시 언덕면 사계리 000-000</p>
                    <p>제주 올레 10코스 산방산 근처</p>
                </div>
            </div>
        </section>        

        <section id="choice">
            <!-- 제목 넣는 영역-->
            <div class="page-title">
                <h1>이 달의 추천</h1>
            </div>
            <!-- 내용 넣는 영역-->
            <div class="content">
                <div class="photo">
                    <img src="./images/ice.jpg" alt="아이스 커피">
                </div>
                <div class="text">
                    <h2>핸드드립 아이스 커피</h2>
                    <ol>
                        <li>1인분 기준으로 서버에 각 얼음 5조각(한조각은 20cc)넣고 추출을 시작한다.</li>
                        <li>평상시 보다 원두의 양은 2배 정도(20g)와 같은 추출액은 얼음 포함해서 200cc까지 내린다.</li>    
                        <li>아이스 잔에 얼음 6~7개 섞어서 시원하게 마신다.</li> 
                    </ol>
                </div>
            </div>
        </section>
		<%@ include file="./include/footer.jsp" %>
    </div>
</body>
</html>