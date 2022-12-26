<%@page import="mc.s1.mapcar.place.model.PlaceInfoVo"%>
<%@page import="java.util.List"%>
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
                <div class="close_button">
                    <button id="all_hidden_button"></button>
                </div>
                <div class="map_home_box">
	                <div class="search_input_box">
	                    <div id="map_home_search">
	                        <input type="text" placeholder=".장소, 도로 검색">
	                        <button type="button"><img src="./images/돋보기로고.jpg"></button>
	                    </div>
	                </div>
                <div class="weather">
                    <div>날씨</div>
                    <div>출력위치</div>
                </div>

                
                <h3 class="heading">
                    <span>Place Info</span>
                    <div class="line"></div>
                </h3>
                <div class="around_wrap">
                    <div class="destination_list">
<%

	List<PlaceInfoVo> volist = (List<PlaceInfoVo>)request.getAttribute("aaa");
	if(volist == null){
%>
	<p>게시글이 없습니다.</p>
<%
	} else {
		for(int i=0; i<volist.size(); i++) {
%>
		<!-- 장소 반복 구간 -->
                        <div class="destination_div">
                            <ul class="destination_ul">
                                <li class="destination_li">
                                    <div>
                                        <a>
                                            <div class="destination_data">
                                                <span class="destination_name"><%=volist.get(i).getP_name() %></span>
                                                <span class="destination_type"><%=volist.get(i).getP_type() %></span>
                                            </div>
                                        </a>
                                        <div>
                                            <div>
                                                <a>
                                                    <span>
                                                        <%=volist.get(i).getP_address() %>
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="des_button">
                                        <div class="des_button_1">
                                            <span class="des_button_1_span1">
                                                <a href="#" role="button" class="des_button_1_span1_button">출발</a>
                                                <a href="#" role="button" class="des_button_1_span1_button">도착</a>
                                            </span>
                                        </div>
    
                                    </div>
                                </li>
                            </ul>
                        </div>
<%		
		}
%>
	</table>
<%
	}

%>
                    </div>
                </div>
                <div class="page_button">

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