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
                                    <img src="./images/지도홈로고.jpg" class="map_home_logo">
                                </center>
                                <span class="map_home">지도 홈</span>
                            </a>
                        </li>
                        <li class="content_item">
                            <a href="#" class="content_item_a">
                                <center>
                                    <img src="./images/길찾기로고.jpg" class="load_search_logo">
                                </center>
                                <span class="load_search">길찾기</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="empty_space"></div>
            <div class="login_button">
                <a href="<%=request.getContextPath()%>/login">
                    <span>로그인</span>

                </a>
            </div>
        </div>
    </header>