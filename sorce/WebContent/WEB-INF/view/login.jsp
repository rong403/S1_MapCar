<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%@include file="/WEB-INF/view/header.jsp" %>
    <section>
        <div id="login_section">
            <div>
                <div class="login_area" id="login_txt">
                    <img src="<%=request.getContextPath()%>/images/맵카로고.jpg">
                    <span>맵카</span>
                </div>
                <div class="login_area" id="login_user_area">
                    <form action="<%=request.getContextPath()%>/doLogin.do" method="post" onsubmit="return isValidation();">
                        <div class="input_area">
                            <input type="text" id="input_ID" name="ID" placeholder="아이디를 입력해주세요">
                            <input type="password" id="input_PWD" name="PWD" placeholder="비밀번호를 입력해주세요">
                        </div>
                        <div id="submit_area">
                            <button type="submit" id="login_btn">
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
    <script>
    function isValidation(){
		var userID = document.getElementById("input_ID").value;
		var userPWD = document.getElementById("input_PWD").value;
		
		if(userID == "" || userID.length == 0){
			alert("아이디를 입력해주세요.");
			return false;
		} else if(userPWD == "" || userPWD.length == 0){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		return true;
	}
    </script>
</body>
</html>