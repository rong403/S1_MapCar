<%@page import="mc.s1.mapcar.common.api.model.OilVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
        <div id="header">
            <div class="logo">
                <a href="<%=request.getContextPath()%>/main" class="logo_a"><img src="./images/맵카로고.jpg" class="logo_img"></a>
            </div>
            <div class="content_bar">
                <div class="content_bar_div">
                    <ul class="content_bar_list">
                        <li class="content_item">
                            <a href="<%=request.getContextPath()%>/main" class="content_item_a">
                                <center>
                                    <img src="<%=request.getContextPath()%>/images/지도홈로고.jpg" class="map_home_logo">
                                </center>
                                <span class="map_home">지도 홈</span>
                            </a>
                        </li>
                        <li class="content_item">
                            <a href="<%=request.getContextPath()%>/loadsearch" class="content_item_a">
                                <center>
                                    <img src="<%=request.getContextPath()%>/images/길찾기로고.jpg" class="load_search_logo">
                                </center>
                                <span class="load_search">길찾기</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="empty_space">
            	<div class="oil_info">
<%
	List<OilVo> volist = (List<OilVo>)session.getAttribute("OilList");
	if(volist == null){
%>
	<p>데이터가 업습니다.</p>
<%
	} else {
		for(int i=0; i<volist.size(); i++) {
		if(volist.get(i).getProdcd().equals("D047") || volist.get(i).getProdcd().equals("B027")){
%>
	        <span class="oil_type"><%=volist.get(i).getProdnm() %></span>
	        <span class="oil_price"><%=volist.get(i).getPrice() %></span>
	        <span class="oil_ud"><%=volist.get(i).getDiff() %></span></br>                                 
<%		
			}
		}
	}
%>
            	</div>
            </div>
            <div class="login_button">
            	<c:choose>
                  		<c:when test="${empty user_info}">
                    		<a href="<%=request.getContextPath()%>/login"><span>로그인</span></a>
                   		</c:when>
                   		<c:otherwise>
	                        <a href="<%=request.getContextPath()%>/mypage"><span>마이페이지</span></a>
                   		</c:otherwise>
                   	</c:choose>
            </div>
        </div>
    </header>