<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/map_home_section.css">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dskw1cnb5i"></script>
    <title>맵카</title>
    <style>
        
        
    </style>
</head>
<body>
    <header>
        <div id="header">
            <div class="logo">
                <a href="#" class="logo_a"><img src="./images/맵카로고.jpg" class="logo_img"></a>
            </div>
            <div class="content_bar">
                <div class="content_bar_div">
                    <ul class="content_bar_list">
                        <li class="content_item">
                            <a href="#" class="content_item_a">
                                <center>
                                    <img src="<%=request.getContextPath()%>/images/지도홈로고.jpg" class="map_home_logo">
                                </center>
                                <span class="map_home">지도 홈</span>
                            </a>
                        </li>
                        <li class="content_item">
                            <a href="#" class="content_item_a">
                                <center>
                                    <img src="<%=request.getContextPath()%>/images/길찾기로고.jpg" class="load_search_logo">
                                </center>
                                <span class="load_search">길찾기</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="login_button">
                <a href="#">
                    <span>로그인</span>

                </a>
            </div>
        </div>
    </header>
    <section>
        <div id="map"></div>
        <div id="map_home_page">
            <div class="search_input_box">
                <div id="map_home_search">
                    <input type="text" placeholder=".장소, 도로 검색">
                    <button type="button"><img src="<%=request.getContextPath()%>/images/돋보기로고.jpg"></button>
                </div>
            </div>
            <div class="weather">
                <div>날씨</div>
                <div>출력위치</div>
            </div>
            <div class="around_wrap">
                <h3 class="heading">
                    <span>장소</span>
                    <div class="line"></div>
                </h3>
            </div>
        </div>
    </section>

<script>
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};
var map = new naver.maps.Map('map', mapOptions);
</script>
</body>
</html>