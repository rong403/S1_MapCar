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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>맵카</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
        html, button, input, select, textarea, span, a, p {
            font-family: "Noto Sans KR", "malgun gothic", /*AppleGothic*/dotum, sans-serif;
        }
        .ui-autocomplete {
            max-height: 150px;
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
</head>
<body>
    <%@include file="/WEB-INF/view/header.jsp" %>
    <section>
        <div id="join_section">
            <div class="join_body">
                <div class="join_title">
                    회원가입
                </div>
                <form action="<%= request.getContextPath() %>/doJoin.do" method="post" id="joinForm" name="joinForm" onsubmit="return isValidation();">
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
                            <button id="check_id_button" type="button" onclick="checkId()">
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
                                <input id="memberPwd1" name="PWD" placeholder="비밀번호를 입력해주세요." type="password" class="join_body_mid_val_input" required>
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
                                <input id="memberPwd2" name="PWD2" placeholder="비밀번호를 한번 더 입력해주세요." type="password" class="join_body_mid_val_input" required>
                            </div>
                            <div class="hidden_msg_div">
                    			<p id="pwdMsg"></p>
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
                                <input id="memberEmail" name="EMAIL" placeholder="예: mapcar@mc.com" type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                            <button id="check_email_button" type="button" onclick="checkEmail();">
                                <span class="join_body_ovbtn_span">중복확인</span>
                            </button>
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>헨드폰번호<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberHndNo" name="HND_NO" placeholder="01011112222" type="text" class="join_body_mid_val_input" required>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberPostCode" name="POST_CODE" placeholder="우편번호" type="text" class="join_body_mid_val_input" readonly>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        	<div>
                                <button class="join_body_mid_val_button" type="button" onclick="searchPostCode();">
                                    <span>
                                        <img src="<%=request.getContextPath()%>/images/돋보기로고.jpg">
                                        주소검색
                                    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                            <label>주소<span class="join_tip_mark">*</span></label>
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberAddr1" name="ADDR1" placeholder="기본주소" type="text" class="join_body_mid_val_input" readonly>
                            </div>
                        </div>
                        <div class="join_body_mid_val_3">
                        </div>
                    </div>
                    <div class="join_body_mid_val">
                        <div class="join_body_mid_val_1">
                        </div>
                        <div class="join_body_mid_val_2">
                            <div>
                                <input id="memberAddr2" name="ADDR2" placeholder="상세주소" type="text" class="join_body_mid_val_input">
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
                            			<input id="memberCarCop" name="CAR_COP" type="hidden">
                                        <input id="carCopSearch" placeholder="제조사입력" type="text">
                                    </div>
                                    <div class="choice_cop_1_list">
                                    </div>
                                </div>
                                <div class="choice_cmodel">
                                	<div class="choice_cmodel_1">
                                		<input id="memberCarModel" name="CAR_MODEL" type="hidden">
                                		<input id="carModelSearch" placeholder="차종입력" type="text">                                       
                                    </div>
                                	<div class="choice_cmodel_1_list">
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
                </form>
            </div>
        </div>
    </section>
	<script>
		function searchPostCode(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            var post_code = data.zonecode;
		            var addr1 = data.roadAddress;
		            
		            document.getElementById('memberPostCode').value = post_code;
	                document.getElementById("memberAddr1").value = addr1;
		        }
		    }).open();
		}
	</script>
	<script>
	var isIdChecked = false;// id 중복 확인을 했는지 확인
	
	var isPwChecked = false;// pw 유효성 확인을 했는지 확인
	var isPwEquals = false;// pw 유효성 확인을 했는지 확인
	
	var isEmailChecked = false;// id 중복 확인을 했는지 확인
	
	$('#memberPwd1').keyup(function(){
		var joinPassword1 = $("#memberPwd1").val();
		var joinPassword2 = $("#memberPwd2").val();
			
		var reg = /^(?=.*?[A-Z|a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		$('.hidden_msg_div').css("display", "block");
		if(joinPassword2.length == 0 || !isPwChecked){
			if(false === reg.test(joinPassword1)) {
				$('#pwdMsg').text('8자 이상, 영문자/숫자/특수문자를 포함하여 입력해주세요.');
				isPwChecked = false;
			}else if(/(\w)\1\1\1/.test(joinPassword1)){
				$('#pwdMsg').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
				isPwChecked = false;
			 }else if(joinPassword1.search(/\s/) != -1){
				$('#pwdMsg').text('비밀번호는 공백을 사용하실 수 없습니다..');
				isPwChecked = false;
			 }else {
				$('#pwdMsg').text('비밀번호 확인을 위해 한번더 입력해주세요.');
				isPwChecked = true;
			 }
		}else{
			if(false === reg.test(joinPassword2)) {
				$('#pwdMsg').text('8자 이상, 영문자/숫자/특수문자를 포함하여 입력해주세요.');
				isPwChecked = false;
			}else if(/(\w)\1\1\1/.test(joinPassword2)){
				$('#pwdMsg').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
				isPwChecked = false;
			 }else if(joinPassword2.search(/\s/) != -1){
				$('#pwdMsg').text('비밀번호는 공백을 사용하실 수 없습니다..');
				isPwChecked = false;
			}else if(joinPassword1 != joinPassword2){
				$('#pwdMsg').text('비밀번호가 동일하지 않습니다.');
				isPwChecked = true;
				isPwEquals = false;
			}else{
				$('#pwdMsg').text('비밀번호가 사용가능합니다.');
				isPwChecked = true;
				isPwEquals = true;
			}
		}
	});
	$('#memberPwd2').keyup(function(){
		var joinPassword1 = $("#memberPwd1").val();
		var joinPassword2 = $("#memberPwd2").val();
			
		var reg = /^(?=.*?[A-Z|a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		if(joinPassword1.length == 0 || !isPwChecked){
			if(false === reg.test(joinPassword2)) {
				$('#pwdMsg').text('8자 이상, 영문자/숫자/특수문자를 포함하여 입력해주세요.');
				isPwChecked = false;
			}else if(/(\w)\1\1\1/.test(joinPassword2)){
				$('#pwdMsg').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
				isPwChecked = false;
			 }else if(joinPassword2.search(/\s/) != -1){
				$('#pwdMsg').text('비밀번호는 공백을 사용하실 수 없습니다..');
				isPwChecked = false;
			 }else {
				$('#pwdMsg').text('비밀번호 확인을 위해 한번더 입력해주세요.');
				isPwChecked = true;
			 }
		}else{
			if(false === reg.test(joinPassword1)) {
				$('#pwdMsg').text('8자 이상, 영문자/숫자/특수문자를 포함하여 입력해주세요.');
				isPwChecked = false;
			}else if(/(\w)\1\1\1/.test(joinPassword1)){
				$('#pwdMsg').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
				isPwChecked = false;
			}else if(joinPassword1.search(/\s/) != -1){
				$('#pwdMsg').text('비밀번호는 공백을 사용하실 수 없습니다..');
				isPwChecked = false;
			}else if(joinPassword1 != joinPassword2){
				$('#pwdMsg').text('비밀번호가 동일하지 않습니다.');
				isPwChecked = true;
				isPwEquals = false;
			}else{
				$('#pwdMsg').text('비밀번호가 사용가능합니다.');
				isPwChecked = true;
				isPwEquals = true;
			}
		}
	});
	
	$('#memberId').keyup(function(){
		isIdChecked = false;
	});
	
	$('#memberEmail').keyup(function(){
		isEmailChecked = false;
	});
	
	function checkId(){
		var userId = $('#memberId');
		
		var reg = /^[a-zA-Z0-9]*$/;
		
		if(userId.val().length < 6){
			alert("아이디는 6자리 이상이어야 합니다.");
			isIdChecked = false;
		}else if(!reg.test(userId.val())){
			alert("아이디는 영문/숫자만 사용하실 수 있습니다.");
			isIdChecked = false;
		}else{
			$.ajax({
				url: '<%= request.getContextPath() %>/checkId.do',
				data: {userId:userId.val()},
				success: function(data){
					console.log(data);
					if(data == 'success'){
						alert("사용가능한 아이디 입니다.");
						isIdChecked = true;
					}else{
						alert("이미 사용중인 아이디입니다.");
						isIdChecked = false;
					}
				}
			});
		}
		
	}
	
	function checkEmail(){
		var userEmail = $('#memberEmail');
		
		var reg = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
		
		if(userEmail.val() == "" || userEmail.val().length == 0){
			alert("이메일을 입력해주세요.");
			isEmailChecked = false;
		}else if(!reg.test(userEmail.val())){
			alert("이메일 형식에 맞지않습니다..");
			isEmailChecked = false;
		}else{
			$.ajax({
				url: '<%= request.getContextPath() %>/checkEmail.do',
				data: {userEmail:userEmail.val()},
				success: function(data){
					console.log(data);
					if(data == 'success'){
						alert("사용가능한 이메일 입니다.");
						isEmailChecked = true;
					}else{
						alert("이미 사용중인 이메일입니다.");
						isEmailChecked = false;
					}
				}
			});
		}
		
	}
	
	function isValidation(){
		var userName = document.getElementById("memberName").value;
		var userHndNo = document.getElementById("memberHndNo").value;
		var userPostCode = document.getElementById("memberPostCode").value;
		var userAddr1 = document.getElementById("memberAddr1").value;
		var userCarModel = document.getElementById("memberCarModel").value;
		
		if(!isIdChecked){
			alert("아이디 중복확인이 필요합니다.");
			return false;
		} else if(!isPwChecked) {
			alert("비밀번호가 유효하지 않습니다.")
			return false;
		} else if(!isPwEquals) {
			alert("비밀번호가 동일하지 않습니다.")
			return false;
		} else if(userName == "" || userName.length == 0){
			alert("이름을 입력해주세요.");
			return false;
		} else if(userHndNo == "" || userHndNo.length == 0){
			alert("핸드폰 번호를 입력해주세요.");
			return false;
		} else if(userHndNo.length < 11 || userHndNo.substring(0, 3) != '010'){
			alert("핸드폰 번호가 유효하지않습니다.");
			return false;
		} else if(!isEmailChecked){
			alert("이메일 중복확인이 필요합니다.");
			return false;
		} else if(userPostCode == "" || userPostCode.length == 0 || userAddr1 == "" || userAddr1.length == 0){
			alert("주소를 입력해주세요.");
			return false;
		} else if(userCarModel == "" || userCarModel.length == 0){
			alert("차량모델을 입력해주세요.");
			return false;
		}
		
		return true;
	}
	
	$(function() {
		$("#carModelSearch").autocomplete({ // autocomplete 구현 시작부
			source : function( request, response ) {
				$.ajax({
					type: 'POST',
					url: "<%= request.getContextPath() %>/searchCarModel.do",
					dataType: "json",
					data: {"carMaker":document.getElementById("memberCarCop").value, "searchStr":document.getElementById("carModelSearch").value},
					success: function(data) {
						response(
							$.map(data, function(item) { //json[i] 번째 에 있는게 item 임.
								return {
									label: item.car_model, //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
									value: item.car_model, //그냥 사용자 설정값?
									car_model: item.car_model,
								}
							})
						);
					}
				});
			},    // source 는 자동 완성 대상
			select : function(event, ui) {    //아이템 선택시
				console.log(ui.item);
				// 폰트 디자인
		        $('.choice_cmodel_1_list').css("display", "none");
		        cnt2 = 0;
		        // 텍스트 변환
		        $(".choice_cmodel_name").text(ui.item.car_model);
		        
				document.getElementById("memberCarModel").value = ui.item.car_model
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
//            disabled: true, //자동완성 기능 끄기
            position: { my : "right top", at: "right bottom" }, // 제안 메뉴의 위치를 식별
            close : function(event){ //자동완성창 닫아질때 호출
                console.log(event);
            }
        });
        
    });
	
	$(function() {
		$("#carCopSearch").autocomplete({ // autocomplete 구현 시작부
			source : function( request, response ) {
				$.ajax({
					type: 'POST',
					url: "<%= request.getContextPath() %>/searchCarCop.do",
					dataType: "json",
					data: {"searchStr":document.getElementById("carCopSearch").value},
					success: function(data) {
						response(
							$.map(data, function(item) { //json[i] 번째 에 있는게 item 임.
								return {
									label: item.cop, //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
									value: item.cop, //그냥 사용자 설정값?
									cop:   item.cop
								}
							})
						);
					}
				});
			},    // source 는 자동 완성 대상
			select : function(event, ui) {    //아이템 선택시
				console.log(ui.item);
			
				$('.choice_cop_1_list').css("display", "none");
		        cnt1 = 0;
		        // 텍스트 변환
		        $(".choice_cop_name").text(ui.item.cop);
		        
				document.getElementById("memberCarCop").value = ui.item.cop
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
//            disabled: true, //자동완성 기능 끄기
            position: { my : "right top", at: "right bottom" }, // 제안 메뉴의 위치를 식별
            close : function(event){ //자동완성창 닫아질때 호출
                console.log(event);
            }
        });
        
    });
	</script>

</body>
</html>