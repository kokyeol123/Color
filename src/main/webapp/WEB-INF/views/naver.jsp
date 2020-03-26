<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
$(function() {
	$("#sendData").on('click', function() {
		var data = $("#name").val();
		$.ajax({
			type : 'POST'
			, url : 'sendData'
			, data : 'name='+data
		});
	});
})

function receive() {
	$.ajax({
		type : 'GET'
		, url : 'myReceive'
		, success : function(resp) {
			alert(resp);
		}
	})
	// 코드상으론 밑에 경고창이 아래에있지만 ajax 에서 신호를 보내놓고 기다리는동안 밑에거를 실행하기 때문에 이게 먼저 실행될 수 도 있다.
	alert(",,,");
}
</script>
</head>
<body>
<div>
<input id="name" type="text">
<input id="sendData" type="button" value="전송">
<a href="javascript:receive()">신호를 받기</a>
</div>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naverIdLogin"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "FaZTpPB9vUh__y6WBOKT",
			callbackUrl: "http://localhost:8089/board/callback",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();

	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail();
			var name = naverLogin.user.getNickName();
			var birthday = naverLogin.user.getBirthday();			var uniqId = naverLogin.user.getId();
			var age = naverLogin.user.getAge();

			alert(email);
			alert(name);
			alert(birthday);
			alert(age);
		} else {
			console.log("AccessToken이 올바르지 않습니다.");
		}
	});
	
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->
</body>
</html>