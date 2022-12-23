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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/join.css">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dskw1cnb5i"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.6.1.js"></script>
    <script src="<%=request.getContextPath()%>/js/join.js"></script>
    <title>맵카</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        html, button, input, select, textarea, span, a, p {
            font-family: "Noto Sans KR", "malgun gothic", /*AppleGothic*/dotum, sans-serif;
        }
    </style>
</head>
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
        <div id="join_section">
            <div class="join_body">
                <div class="join_title">
                    회원가입
                </div>
                <div class="join_body_top"><span class="join_tip_mark">*</span>필수입력사항</div>
                <div class="join_body_mid">
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>아이디<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberId" name="ID" placeholder="아이디를 입력해주세요." type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                            <button class="join_body_mid_val_button" type="button">
                                <span class="join_body_ovbtn_span">중복확인</span>
                            </button>
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>비밀번호<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberPwd" name="Pwd" placeholder="비밀번호를 입력해주세요." type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>비밀번호확인<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberPwd" name="Pwd2" placeholder="비밀번호를 한번 더 입력해주세요." type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>이름<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberName" name="NAME" placeholder="이름을 입력해주세요." type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>이메일<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberName" name="NAME" placeholder="예: mapcar@mc.com" type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                            <button class="join_body_mid_val_button" type="button">
                                <span class="join_body_ovbtn_span">중복확인</span>
                            </button>
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>주소<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <button class="join_body_mid_val_button" type="button">
                                    <span>
                                        <img src="<%=request.getContextPath()%>/images/돋보기로고.jpg">
                                        주소검색
                                    </span>
                                </button>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>차종<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div class="choice_box">
                                <div class="choice_cop">
                                    <div class="choice_cop_1">
                                        <span class="choice_cop_name">제조사</span><span class="choice_list_btn_1"></span>
                                    </div>
                                    <div class="choice_cop_1_list">
                                        <ul class="choice_cop_1_list_ul">
                                            <li class="choice_list_li"><span>현대</span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="choice_cmodel">
                                    <div class="choice_cmodel_1">
                                        <span class="choice_cmodel_name">모델명</span><span class="choice_list_btn_2"></span>
                                    </div>
                                    <div class="choice_cmodel_1_list">
                                        <ul class="choice_cmodel_1_list_ul">
                                            <li class="choice_list_li"><span>현대</span></li>
                                            <li class="choice_list_li"><span>기아</span></li>
                                            <li class="choice_list_li"><span>현대</span></li>
                                            <li class="choice_list_li"><span>현대</span></li>
                                            <li class="choice_list_li"><span>현대</span></li>
                                            <li class="choice_list_li"><span>현대</span></li>
                                            <li class="choice_list_li"><span>현대</span></li>
                                            <li class="choice_list_li"><span>현대</span></li>
                                            <li class="choice_list_li"><span>현대</span></li>
                                            <li class="choice_list_li"><span>현대</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                </div>
                <div class="join_button">
                    <button class="join_button_submit" type="submit">
                        <span>가입하기</span>
                    </button>
                </div>
            </div>
        </div>
    </section>

</body>
</html>