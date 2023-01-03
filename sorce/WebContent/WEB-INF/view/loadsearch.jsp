<%@page import="org.json.simple.JSONObject"%>
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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dskw1cnb5i&submodules=geocoder"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.6.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/loadsearch.js"></script>
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <title>맵카</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        html, button, input, select, textarea, span, a, p {
            font-family: "Noto Sans KR", "malgun gothic", /*AppleGothic*/dotum, sans-serif;
        }
        .ui-autocomplete {
            max-height: 500px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
	    }
	    /* IE 6 doesn't support max-height
	     * we use height instead, but this forces the menu to always be this tall
	     */
	    * html .ui-autocomplete {
	        height: 100px;
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
                    		<div><input id="dis" type="text"></div>
                    		<div><input id="dur" type="text"></div>
                    		<div><input id="fp" type="text"></div>
                    		<div><input id="tf" type="text"></div>

                        </div>
                        <div class="load_search_box">
	                        <div class="start_btn_div">
                                <input type="text" id="start_btn" name="start_data" placeholder="출발지 입력">
                            </div>
                            <div class="search_value_1">
                            </div>
                            <div class="mid_line"></div>
                            <button type="button" id="switch_btn"><img src="./images/위아래전환로고.jpg"></button>
                            <div class="arrival_btn_div">
                                <input type="text" id="arrival_btn" name="arrival_data" placeholder="도착지 입력">
                            </div>
                            <div class="search_value_2">
                            </div>
                        </div>
                        <div class="controll_btn">
                            <button id="reset_btn" class="controll_btn_1">다시 입력</button>
                            <button id="search_btn" class="controll_btn_1" onclick="searchLoad();">길찿기</button>
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
                                        <img src="<%=request.getContextPath()%>/images/찜버튼T.jpg">
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


$(function() {
	$("#arrival_btn").autocomplete({ // autocomplete 구현 시작부
		source : function( request, response ) {
			$.ajax({
				type: 'POST',
				url: "<%= request.getContextPath() %>/placeaotocomplete",
				dataType: "json",
				data: {"searchtext":document.getElementById("arrival_btn").value},
				success: function(data) {
					response(
						$.map(data, function(item) { //json[i] 번째 에 있는게 item 임.
							return {
								label: item.p_address, //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
								value: item.p_address, //그냥 사용자 설정값?
								p_address:   item.p_address
							}
						})
					);
				}
			});
		},    // source 는 자동 완성 대상
		select : function(event, ui) {    //아이템 선택시
			console.log(ui.item);
	        
			document.getElementById("arrival_btn").value = ui.item.p_address
        },
        focus : function(event, ui) { // 포커스 시 이벤트
            return false;
        },
        minLength: 0,// 최소 글자수
        autoFocus: false, //첫번째 항목 자동 포커스 기본값 false
        classes: { // 위젯 요소에 추가 할 클래스를 지정
            "ui-autocomplete": "highlight"
        },
        delay: 500, //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//        disabled: true, //자동완성 기능 끄기
        position: { my : "right top", at: "right bottom" }, // 제안 메뉴의 위치를 식별
        close : function(event){ //자동완성창 닫아질때 호출
            console.log(event);
        }
    });
	$("#start_btn").autocomplete({ // autocomplete 구현 시작부
		source : function( request, response ) {
			$.ajax({
				type: 'POST',
				url: "<%= request.getContextPath() %>/placeaotocomplete",
				dataType: "json",
				data: {"searchtext":document.getElementById("start_btn").value},
				success: function(data) {
					response(
						$.map(data, function(item) { //json[i] 번째 에 있는게 item 임.
							return {
								label: item.p_address, //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
								value: item.p_address, //그냥 사용자 설정값?
								p_address:   item.p_address
							}
						})
					);
				}
			});
		},    // source 는 자동 완성 대상
		select : function(event, ui) {    //아이템 선택시
			console.log(ui.item);
	        
			document.getElementById("start_btn").value = ui.item.p_address
        },
        focus : function(event, ui) { // 포커스 시 이벤트
            return false;
        },
        minLength: 0,// 최소 글자수
        autoFocus: false, //첫번째 항목 자동 포커스 기본값 false
        classes: { // 위젯 요소에 추가 할 클래스를 지정
            "ui-autocomplete": "highlight"
        },
        delay: 500, //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//        disabled: true, //자동완성 기능 끄기
        position: { my : "right top", at: "right bottom" }, // 제안 메뉴의 위치를 식별
        close : function(event){ //자동완성창 닫아질때 호출
            console.log(event);
        }
    });
    
});
function searchLoad() {
	var startValue = document.getElementById("start_btn").value;
	var arrivalValue = document.getElementById("arrival_btn").value;

	if(startValue == "" || startValue.length == 0){
		alert("출발지를 입력해주세요.");
		return false;
	} else if(arrivalValue == "" || arrivalValue.length == 0) {
		alert("도착지를 입력해주세요.")
		return false;
	}
	
	var order = {
			"addrx":startValue, 
			"addry":arrivalValue
			};
	console.log(order);
	$.ajax({
		url:"<%= request.getContextPath() %>/LoadSearchConroller",
		type:"post",
		contentType:"application/json",
		data: 
			JSON.stringify(order),
		
		dataType:"json",
		
		success: function( data ){
			var dur = data.duration/1000/60/60;
			var dis = data.distance/1000;
			var fp = data.fuelPrice
			var tf = data.taxiFare
			console.log(dur);
			document.getElementById("dur").value = dur;
			document.getElementById("dis").value = dis;
			document.getElementById("fp").value = fp;
			document.getElementById("tf").value = tf;
		},   
		// error의 콜백함수의 매개변수로 들어오는 값은 url에서 전달 그리고 응답과정에서 발생하는 오류내용
		error:function(){
			
		}
	});
}

</script>
</body>
</html>