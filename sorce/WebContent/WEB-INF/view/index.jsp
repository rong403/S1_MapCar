<%@page import="mc.s1.mapcar.common.api.model.WeatherVo"%>
<%@page import="mc.s1.mapcar.place.model.PlaceInfoVo"%>
<%@page import="java.util.List"%>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/map_home_section.css">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dskw1cnb5i&submodules=geocoder"></script>
    <script type="text/javascript" src="https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode.js?ncpClientId=dskw1cnb5i"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.6.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script>
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
		                <div class="search_input_box">
		                    <div id="map_home_search">
		                        <input type="text" id="positionSearch" onKeypress="javascript:if(event.keyCode==13){Searchdata()}">
		                        <button type="button" onclick="Searchdata();"><img src="<%=request.getContextPath()%>/images/돋보기로고.jpg"></button>
		                    </div>
		                </div>
		                <div class="weather">
		                    <div>날씨</div>
		                    <div class="weatherlist">
		                    <table>
<%
	List<WeatherVo> weatherVoList = (List<WeatherVo>)request.getAttribute("WeatherList");
	if(weatherVoList == null){
%>
	<p>데이터가 업습니다.</p>
<%
	} else {
		for(int i=0; i<weatherVoList.size(); i++) {
			if(i % 12 == 0){
%>
			<tr>
				<th><span class=""><%=i/12 %>시</span></th>
<%
			}
			if(weatherVoList.get(i).getCategory().equals("TMP")||weatherVoList.get(i).getCategory().equals("PTY")){
%>
	        <th><span class=""><%=weatherVoList.get(i).getFcstValue() %></span></th>
<%		
			}
			if(i % 12 == 11){
%>
			</tr>
<%
			}
		}
	}
%>
                                
                            </table>
		                    </div>
		                </div>
		
		                
		                <h3 class="heading">
		                    <span>Place Info</span>
		                    <div class="line"></div>
		                </h3>
		                <div class="around_wrap">
		                    <div class="destination_list">
<%

	List<PlaceInfoVo> PlaceVolist = (List<PlaceInfoVo>)request.getAttribute("PlaceList");
	if(PlaceVolist == null){
%>
	<p>게시글이 없습니다.</p>
<%
	} else {
		for(int i=0; i<PlaceVolist.size(); i++) {
%>
		<!-- 장소 반복 구간 -->
	                        <div class="destination_div">
	                            <ul class="destination_ul">
	                                <li class="destination_li">
	                                    <div onclick="SearchMyStore('<%=PlaceVolist.get(i).getP_address() %>', this);">
	                                        <a>
	                                            <div class="destination_data">
	                                                <span class="destination_name"><%=PlaceVolist.get(i).getP_name() %></span>
	                                                <span class="destination_type"><%=PlaceVolist.get(i).getP_type() %></span>
	                                                <input type="hidden" class="a" value="<%=PlaceVolist.get(i).getP_no() %>">
	                                            </div>
	                                        </a>
	                                        <div>
	                                            <div>
	                                                <a>
	                                                    <span>
	                                                        <%=PlaceVolist.get(i).getP_address() %>
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
	}

%>
	                    </div>
	                </div>
                </div>
                <div class="page_button">

                </div>
            </div>

        </div>
    </section>

<script>
var mapOptions = {
    center: new naver.maps.LatLng(36.31089095,127.3893707),
    zoom: 17
};
var map = new naver.maps.Map('map', mapOptions);
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(36.31089095,127.3893707),
    map: map

});
let data = new Object(); // 위도 경도 들어가있는 객체

function Searchdata(){
	var inputdata = $('#positionSearch').val();
	var query = "searchtext=" + inputdata;
	$.ajax({
		url:"<%=request.getContextPath()%>/placesearch",
		type:"get",
		contentType:"application/json",
		data: query,
		dataType:"json",
		
		success: function( data ){
			var  result = new Array;
		    result = data.jArr;
			console.log(result);
			
			var content = '';
			
			$.each(result, function(key, value) {
				content +=    '<div class="destination_div">';
				content +=    '<ul class="destination_ul">';
				content +=    '<li class="destination_li">';
				content +=    '<div onclick="SearchMyStore(\''+value.p_address+'\', this);">';
	            content +=    '<a>';
	            content +=    '<div class="destination_data">';
	            content +=    '<span class="destination_name">'+value.p_name+'</span>';
	            content +=    '<span class="destination_type">'+value.p_type+'</span>';
	            content +=    '<input type="hidden" class="a" value="'+value.p_no+'">';
	            content +=    '</div>';
	            content +=    '</a>';
	            content +=    '<div>';
	            content +=    '<div>';
	            content +=    '<a>';
	            content +=    '<span>'+value.p_address+'</span>';
	            content +=    '</a>';
	            content +=    '</div>';
	            content +=    '</div>';
	            content +=    '</div>';
	            content +=    '<div class="des_button">';
	            content +=    '<div class="des_button_1">';
	            content +=    '<span class="des_button_1_span1">';
	            content +=    '<a href="#" role="button" class="des_button_1_span1_button">출발</a>';
	            content +=    '<a href="#" role="button" class="des_button_1_span1_button">도착</a>';
	            content +=    '</span>';
	            content +=    '</div>';
	            content +=    '</div>';
	            content +=    '</li>';
				content +=    '</ul>';
				content +=    '</div>';
	            
		      });
			
			console.log(content);
			$(".destination_list").html(content);  
		},   
		error:function(){
			alert("error");			
		}
	});
}

function SearchMyStore(positionSearch, thistarget) {
	console.log($(thistarget).find(".a").val());
    let position = positionSearch; // 사용자가 작성한 주소값 position 변수에 저장
    naver.maps.Service.geocode({ // 이부분부터 지오코드 네이버 api들어감
        query: position // query에 주소정보 들어감
    }, function (status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            return alert('Something wrong!');
        }

        var result = response.v2, // 검색 결과의 컨테이너
            items = result.addresses; // 검색 결과의 배열 items배열에 json 형식으로 위도 / 경도가 들어감

        data.latitude = items[0].y; // 위도 y가 위도고 
        data.longitude = items[0].x; // 경도 x가 경도임

        console.log("위도 =" + data.latitude + " 경도 = " + data.longitude)

        showMap(data); // 위도 경도로 만들어놨던 객체를 지도에 찍어주기위해 보내줌
    });
}
function showMap(pos) {
    var HOME_PATH = window.HOME_PATH || '.';
    var myPosition = new naver.maps.LatLng(data.latitude, data.longitude), // 여기에 위도와 경도를 차례대로 넣어주면, 마커가 생성된다.
        map = new naver.maps.Map('map', {
            center: myPosition,
            zoom: 15
        }),
        marker = new naver.maps.Marker({
            map: map,
            position: myPosition
        });
 	// 마커 내부정보
    // 이부분이 마커를 클릭하면 출력되는 정보가 들어감. html코드형식으로 들어간다.
    var contentString = [
        '<div class="iw_inner">',
        '   <h3>서울특별시청</h3>',
        '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
        '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
        '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
        '   </p>',
        '</div>'
    ].join('');

    var infowindow = new naver.maps.InfoWindow({ // 마커 디자인 정보
        content: contentString,
        maxWidth: 140,
        backgroundColor: "white",
        borderColor: "#2db400",
        borderWidth: 2,
        anchorSize: new naver.maps.Size(30, 30),
        anchorSkew: true,
        anchorColor: "white",
        pixelOffset: new naver.maps.Point(20, -20)
    });

    naver.maps.Event.addListener(marker, "click", function (e) { // 클릭시 마커에 등록된 정보들 출력하는 함수인듯
        if (infowindow.getMap()) {
            infowindow.close();
        } else {
            infowindow.open(map, marker);
        }
    });
}

</script>
</body>
</html>