<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
    <script src="<%=request.getContextPath()%>/js/jquery-3.6.1.js"></script>


    <title>로그인</title>
    <style>
        html{
            scroll-behavior: smooth;
        }
    </style>
    <!-- 전체공통 -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        html, button, input, select, textarea, span, a, p {
            font-family: "Noto Sans KR", "malgun gothic", /*AppleGothic*/dotum, sans-serif;
        }
    </style>
<body>
    <header>
        <div id="header">
            <div class="logo">
                <a href="#" class="logo_a"><img src="<%=request.getContextPath()%>/images/맵카로고.jpg" class="logo_img"></a>
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
        <div id="login_section">
            <div>
                <div class="login_area" id="login_txt">
                    <img src="<%=request.getContextPath()%>/images/맵카로고.jpg">
                    <span>맵카</span>
                </div>
                <div class="login_area" id="login_user_area">
                    <form action="<%=request.getContextPath()%>/main" method="post">
                        <div class="input_area">
                            <input type="text" id="input_ID" name="ID" placeholder="아이디를 입력해주세요">
                            <input type="password" id="input_PWD" name="PWD" placeholder="비밀번호를 입력해주세요">
                        </div>
                        <div id="submit_area">
                            <button type="submit" id="login_btn" onclick="location.href='<%=request.getContextPath()%>/main'">
                                <span>로그인</span>
                            </button>
                            <button type="button" id="join_btn" onclick="location.href='<%=request.getContextPath()%>/join'">
                                <span>회원가입</span>
                            </button>
                        </div>
                        <div id="search_user_account">
                            <a href="#">아이디 찾기</a>
                            <span></span>
                            <a href="#">비밀번호 찾기</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>