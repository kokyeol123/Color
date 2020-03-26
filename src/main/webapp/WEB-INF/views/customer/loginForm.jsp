<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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
	width : 200px;
}
img {
	width : 20px;
}
</style>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>

function idValidate() {
	var custid = $("#custid").val();
	if (custid.trim().length < 3 || custid.trim().length > 5) {
		alert("아이디를 3~5자 이내로 입력하세요");
		return;
	}

	var custpwd = $("#custpwd").val();
	if (custpwd.trim().length < 3 || custpwd.trim().length > 5) {
		alert("비밀번호를 3~5자 이내로 입력하세요");
		return;
	}

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
	<c:url var="home" value="/resources/images/home.png" />
	<c:url var="root" value="/" />
	<a href="${root}"><img src="${home}" /></a>
	<form id="myForm" action="login" method="POST">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="custid" name="custid" value="${cookie['savedId'].value}" placeholder="3~5사이의 아이디 입력" />
				<input type="checkbox" name="rememberMe" /> 아이디 저장
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="custpwd" name="custpwd" placeholder="3~5사이의 비밀번호 입력" />
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
</body>
</html>