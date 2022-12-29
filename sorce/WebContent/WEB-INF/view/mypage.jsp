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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dskw1cnb5i&submodules=geocoder"></script>
    <script type="text/javascript" src="https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode.js?ncpClientId=dskw1cnb5i"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.6.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/mypage.js"></script>
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
        <div class="mypage_top">
            <div class="mypage_top_info">
                <div class="mypage_top_info_name">
                    <div class="mypage_top_info_name_1">
                        <div class="mypage_top_info_name_1_1">웰컴</div>
                        <div class="mypage_top_info_name_1_2"><strong>KH 님</strong></div>
                    </div>
                    <div class="mypage_top_info_name_2">
                        <p>후기 수 : 0</p>
                    </div>
                    <div class="mypage_top_info_name_3">
                        <button onclick="location.href=''">프로필수정</button>
                        <button onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button>
                    </div>
                </div>
                <div class="mypage_top_info_2">
                    <div class="mypage_top_info_button">
                        <button class="mypage_top_info_button_1">
                            <div class="mypage_top_info_button_1_1">차량정보<span></span></div>
                            <div class="mypage_top_info_button_1_2">모닝</div>
                        </button>
                    </div>
                    <div class="mypage_top_info_button">
                        <button class="mypage_top_info_button_1">
                            <div class="mypage_top_info_button_1_1">날씨<span></span></div>
                            <div class="mypage_top_info_button_1_2">맑음</div>
                        </button>
                    </div>
                    <div class="mypage_top_info_button">
                        <button class="mypage_top_info_button_1">
                            <div class="mypage_top_info_button_1_1">찜한 목적지<span></span></div>
                            <div class="mypage_top_info_button_1_2">확인하기</div>
                        </button>
                    </div>
                </div>
                <div class="mypage_top_info_2">
                    <div class="mypage_top_info_div">
                        <button class="mypage_top_info_div_button" onclick="location.href='';">
                            <div class="mypage_top_info_button_1_1">상세 유가<span></span></div>
                            <div class="mypage_top_info_button_1_4">알아보기</div>
                        </button>
                    </div>
                    <div class="mypage_top_info_div">
                        <button class="mypage_top_info_div_button" onclick="location.href='';">
                            <div class="mypage_top_info_button_1_1">나의 후기<span></span></div>
                            <div class="mypage_top_info_button_1_4">확인하기</div>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="mypage_mid">
            <div class="mypage_mid_l">
                <div class="mypage_mid_l_wrap">
                    <div class="mypage_mid_l_div">페이지 선택</div>
                    <ul class="mypage_mid_l_ul">
                        <li class="mypage_mid_l_ul_li"><a class="active mypage_mid_l_ul_li_a">차량 정보<span></span></a></li>
                        <li class="mypage_mid_l_ul_li"><a class="mypage_mid_l_ul_li_a">상세 날씨<span></span></a></li>
                        <li class="mypage_mid_l_ul_li"><a class="mypage_mid_l_ul_li_a">찜한 목적지<span></span></a></li>
                        <li class="mypage_mid_l_ul_li"><a class="mypage_mid_l_ul_li_a">상세 유가<span></span></a></li>
                        <li class="mypage_mid_l_ul_li"><a class="mypage_mid_l_ul_li_a">목적지 후기<span></span></a></li>
                        <li class="mypage_mid_l_ul_li"><a class="mypage_mid_l_ul_li_a">개인 정보 수정<span></span></a></li>
                    </ul>
                    <a href="#" class="mypage_mid_l_3">
                        <div class="mypage_mid_l_3_1" onclick="location.href='#'">
                            <span class="mypage_mid_l_3_1_1">지도 홈으로</span>
                            <span class="mypage_mid_l_3_1_2">이동하기</span>
                        </div>
                        <span class="mypage_mid_l_3_2"></span>
                    </a>

                </div>
            </div>
            <div class="mypage_mid_r">
                <div class="mypage_mid_r_t">
                    <div class="mypage_mid_r_t_l">
                        <h2>차량 정보</h2>
                        <span>나의 차량 정보를 확인 할 수 있어요</span>
                    </div>
                </div>
                <div class="mypage_mid_r_m"></div>
                <div class="mypage_mid_r_b">
                    
                </div>
            </div>
        </div>
    </section>
</body>
</html>