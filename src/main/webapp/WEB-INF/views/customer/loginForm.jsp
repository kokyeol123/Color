<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="997225468189-hkslv3t2oruo76np19ida1qn6s1msimr.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
function idValidate() {
// 	var custid = $("#custid").val();
// 	if (custid.trim().length < 3 || custid.trim().length > 5) {
// 		alert("아이디를 3~5자 이내로 입력하세요");
// 		return;
// 	}

// 	var custpwd = $("#custpwd").val();
// 	if (custpwd.trim().length < 3 || custpwd.trim().length > 5) {
// 		alert("비밀번호를 3~5자 이내로 입력하세요");
// 		return;
// 	}

	// 서브밋 필요
	var myForm = $("#myForm");
	myForm.submit();
}
</script>
<c:if test="${not empty error}">
<script>
alert("${error}");
</script>
</c:if>
</head>
<body>

<div id="wrapper">
	<h2> [ 로 그 인 ]</h2>
	<c:url var="root" value="/" />
	<a href="${root}">메인으로</a>
	<form id="myForm" action="login" method="POST">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="custid" name="custid" value="${cookie['savedId'].value}" placeholder="4~10사이의 아이디 입력" />
				<input type="checkbox" name="rememberMe" /> 아이디 저장
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="custpwd" name="custpwd" placeholder="4~10사이의 비밀번호 입력" />
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="로그인" onclick="idValidate()" /> &nbsp;
				<input type="reset" value="취소" />
			</th>
		</tr>
	</table>
	</form>
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

<!-- 구글로그인 -->

    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);

// 		if (profile.getId() != null) {
//         	location.href="http://localhost:8089/color/";
// 		}
      }
    </script>

<!-- 구글로그인 끝 -->
</body>
</html>