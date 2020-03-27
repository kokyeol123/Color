<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// function formCheck() {
// 	var pwd = document.getElementById("custpwd1").value;
// 	if (pwd.trim().length < 3 || pwd.trim().length > 5) {
// 		alert("비밀번호를 3~5자 이내로 입력하세요");
// 		return false;
// 	}

// 	var name = document.getElementById("custname").value;
// 	if (name.trim().length < 1) {
// 		alert("이름을 입력하세요");
// 		return false;
// 	}

// 	var email = document.getElementById("email").value;
// 	if (email.trim().length < 1) {
// 		alert("이메일을 입력하세요");
// 		return false;
// 	}

// 	if (email.indexOf("@") == -1) {
// 		alert("이메일을 양식에 맞게 입력하세요");
// 		return false;
// 	}
	

// 	var idno = document.getElementById("idno").value;
// 	if (idno.trim().length < 1) {
// 		alert("식별번호를 입력하세요");
// 		return;
// 	}

// 	var address = document.getElementById("address").value;
// 	if (address.trim().length < 1) {
// 		alert("주소을 입력하세요");
// 		return;
// 	}
// }

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
	<c:url var="root" value="/" />
	<br />
	<a href="${root}">메인으로</a>
	<form id=modify action="modify" method="POST" >
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
				<td><input type="text" id="custemail" name="custemail" placeholder="Email을 입력하세요"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="custgender" value="male" checked="checked" />남자 &nbsp;
					<input type="radio" name="custgender" value="female" />여자 &nbsp;
				</td>
			</tr>
			<tr>
				<th>회원 구분</th>
				<td>
					<input type="radio" name="custage" value="0s" checked="checked" />10세 이하 &nbsp;
					<input type="radio" name="custage" value="10s" />11~20세 &nbsp;
					<input type="radio" name="custage" value="20s" />21~30세 &nbsp;
					<input type="radio" name="custage" value="30s" />31~40세 &nbsp;
					<input type="radio" name="custage" value="40s" />41~50세 &nbsp;
					<input type="radio" name="custage" value="50s" />51~60세 &nbsp;
					<input type="radio" name="custage" value="60s" />60세 이상 &nbsp;
				</td>
			</tr>
			<tr>
				<th>전화 번호</th>
				<td><input type="text" id="custphone" name="custphone" placeholder="010-0000-0000 형식으로 입력해주세요." /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="custaddress" name="custaddress" placeholder="주소를 입력하세요" /></td>
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