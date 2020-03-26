<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
// $(function() {
// 	$("#custid").on('keyup', function(){
// 		var custid = $('#custid').val();
// 		if(custid.trim().length < 3 || custid.trim().length > 5) {
// 			$("#idCheck").css("color", "red");
// 			$("#idCheck").text("아이디를 3~5자로 입력하세요");
// 			return;
// 		}
// 		$("#idCheck").text('');

// 		// 입력한 아이디가 사용가능한지 여부 체크
// 		$.ajax({
// 			type : "GET"
// 			, url : "idCheck"
// 			, data : {"custid" : custid}
// 			, success : function(resp) {
// 				// 사용가능한 경우 : 'success' 리턴
// 				// 사용불가능한 경우 : 'fail' 리턴
// 				if(resp == 'success') {
// 					$("#idCheck").css("color", "blue");
// 					$("#idCheck").text("사용 가능한 아이디입니다.");
// 				}
// 				else {
// 					$("#idCheck").css("color", "red");
// 					$("#idCheck").text("사용 불가능한 아이디입니다.");
// 				}
// 			}
// 		})
// 	})
// })
</script>
<script>
// function formCheck() {
// 	var id = document.getElementById("custid").value;
// 	if (id.trim().length < 3 || id.trim().length > 5) {
// 		alert("아이디를 3~5자 이내로 입력하세요");
// 		return false;
// 	}

// 	var pwd = document.getElementById("custpwd1").value;
// 	if (pwd.trim().length < 3 || pwd.trim().length > 5) {
// 		alert("비밀번호를 3~5자 이내로 입력하세요");
// 		return false;
// 	}

// 	var pwd2 = document.getElementById("custpwd2").value;
// 	if (pwd != pwd2) {
// 		alert("비밀번호가 일치하지 않습니다");
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
</head>
<body>
<div id="wrapper">
	<h2>[ 회원 가입 ]</h2>
	<c:url var="root" value="/" />
	<br />
	<a href="${root}">홈으로</a>
	<form id="join" action="join" method="POST" onsubmit="return formCheck()">
		<table border="1">
			<tr>
				<th>고객 ID</th>
				<td>
					<input type="text" id="custid" name="custid" placeholder="아이디를 4~10자 이내로 입력하세요" />
					<span id="idCheck"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="custpwd1" name="custpwd" placeholder="비밀번호를 4~10자 이내로 입력하세요"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="custpwd2" placeholder="입력하신 비밀번호랑 일치하는 값을 입력하세요"></td>
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
					<input type="submit" value="가입" />
					<input type="reset" value="다시 쓰기" />
				</th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>

