<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrapper {
	width : 510px;
	margin : 0 auto;
}
#wrapper h2 {
	text-align : center;
}
.header {
	width : 150px;
}
.inputdata {
	width : 350px;
}
input[type="text"],
input[type="password"] {
	width : 246px;
}
img {
	width : 20px;
}
</style>
<script>
function formCheck() {
	var pwd = document.getElementById("custpwd1").value;
	if (pwd.trim().length < 3 || pwd.trim().length > 5) {
		alert("비밀번호를 3~5자 이내로 입력하세요");
		return false;
	}

	var name = document.getElementById("custname").value;
	if (name.trim().length < 1) {
		alert("이름을 입력하세요");
		return false;
	}

	var email = document.getElementById("email").value;
	if (email.trim().length < 1) {
		alert("이메일을 입력하세요");
		return false;
	}

	if (email.indexOf("@") == -1) {
		alert("이메일을 양식에 맞게 입력하세요");
		return false;
	}
	

	var idno = document.getElementById("idno").value;
	if (idno.trim().length < 1) {
		alert("식별번호를 입력하세요");
		return;
	}

	var address = document.getElementById("address").value;
	if (address.trim().length < 1) {
		alert("주소을 입력하세요");
		return;
	}
}

function idCheck() {
	window.open("idCheck","win","width=500, height=600, left=50, up=50");
}
</script>
<c:if test="${result == 0}">
<script>
alert("비밀번호를 잘 못 입력하셨습니다.")
</script>
</c:if>
</head>
<body>
<div id="wrapper">
	<h2>[ 회원 정보 수정 ]</h2>
	<c:url var="home" value="/resources/images/home.png" />
	<c:url var="root" value="/" />
	참고 : ${pageContext.request.contextPath}
	<!-- pageContext 객체 안에는 현재 개발중인 정보가 들어있다 /board라고 나온다 지금현재 개발중인 환경의 context root 를 보여준다-->
	<!-- 아래 href=root 자리에 pageContext.request.contextPath 이걸써도 된다  -->
	<br />
	<a href="${root}"><img src="${home}" /></a>
	<form id=modify action="modify" method="POST" onsubmit="return formCheck()">
	<input type="hidden" value="${sessionScope.loginId}" name="custid" />
		<table border="1">
			<tr>
				<th>고객 ID</th>
				<td>${sessionScope.loginId}</td>
			</tr>
			<tr>
				<th>기존 비밀번호</th>
				<td><input type="password" id="custpwd1" name="custpwd" placeholder="원래 비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<th>수정할 비밀번호</th>
				<td><input type="password" id="custpwd2" name="custpwd2" placeholder="수정할 비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="custname" name="custname" placeholder="이름을 입력하세요"></td>
			</tr>
			<tr>
				<th>EMail</th>
				<td><input type="text" id="email" name="email" placeholder="Email을 입력하세요"></td>
			</tr>
			<tr>
				<th>회원 구분</th>
				<td>
					<input type="radio" name="division" value="personal" checked="checked" />개인 &nbsp;
					<input type="radio" name="division" value="company" />법인 &nbsp;
				</td>
			</tr>
			<tr>
				<th>식별 번호</th>
				<td><input type="text" id="idno" name="idno" placeholder="개인 : 주민등록번호 / 법인 : 사업자등록번호" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="address" name="address" placeholder="주소를 입력하세요" /></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정" />
					<input type="reset" value="다시 쓰기" />
				</th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>