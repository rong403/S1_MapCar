<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/loadsearch.css">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dskw1cnb5i"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.6.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/loadsearch.js"></script>
    <title>맵카</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        html, button, input, select, textarea, span, a, p {
            font-family: "Noto Sans KR", "malgun gothic", /*AppleGothic*/dotum, sans-serif;
        }
    </style>
    <style>
        
        
    </style>
</head>
<body>
	<%@include file="/WEB-INF/view/header.jsp" %>
    <section>
        <div id="main_section">
            <div id="map"></div>
            <div id="map_home_page">
                <div class="map_home_box">
                    <div class="close_button">
                        <button id="all_hidden_button"><img class="all_hidden_button_img" src="<%=request.getContextPath()%>/images/화살표머리로고.jpg"></button>
                    </div>
                    <div class="hidden_box">
                        <div class="TODO_space">

                        </div>
                        <div class="load_search_box">
                            <div class="start_btn_div">
                                <input type="text" id="start_btn" name="start_data" placeholder="출발지 입력">
                            </div>
                            <div class="mid_line"></div>
                            <button type="button" id="switch_btn"><img src="<%=request.getContextPath()%>/images/위아래전환로고.jpg"></button>
                            <div class="arrival_btn_div">
                                <input type="text" id="arrival_btn" name="arrival_data" placeholder="도착지 입력">
                            </div>
                        </div>
                        <div class="controll_btn">
                            <button id="reset_btn" class="controll_btn_1">다시 입력</button>
                            <button id="search_btn" class="controll_btn_1">길찿기</button>
                        </div>
        
                        <div class="mark_block">
                            <h3 class="heading">
                                <span>자주 가는 곳</span>
                                <div class="line"></div>
                            </h3>
                            <ul class="bookmark">
                                <li class="bookmark_list">
                                    <img src="<%=request.getContextPath()%>/images/집로고.jpg">
                                    <button>집</button>
                                </li>
                                <li class="bookmark_list">
                                    <img src="<%=request.getContextPath()%>/images/회사로고.jpg">
                                    <button>회사/학교</button>
                                </li>
                                <li class="bookmark_list">
                                    <img src="<%=request.getContextPath()%>/images/추가로고.jpg">
                                    <button>추가 등록하기</button>
                                </li>
                            </ul>
                        </div>
                        <div class="around_wrap">
                            <h3 class="heading">
                                <span>찜한 목적지</span>
                                <div class="line"></div>
                            </h3>
                            <ul class="wrap_list">
                                <li class="item_list">
                                    <a class="item_list_content">
                                        <img src="<%=request.getContextPath()%>/images/찜버튼T.jpg">
                                        <button>찜 목록 나열</button>
                                    </a>
                                </li>
                                <li class="item_list">
                                    <a class="item_list_content">
                                        <img src="<%=request.getContextPath()%>/images/찜버튼T.jpg">
                                        <button>찜 목록 나열</button>
                                    </a>
                                </li>
                                <li class="item_list">
                                    <a class="item_list_content">
                                        <img src="<%=request.getContextPath()%>./images/찜버튼T.jpg">
                                        <button>찜 목록 나열</button>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="page_button">
    
                    </div>

                </div>
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