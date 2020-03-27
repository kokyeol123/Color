<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.loginId != null}">
	<p><button type="button" class="btn btn-danger">${sessionScope.custname}님, 안녕하세요.</button></p>
	</c:if>
<a href="${pageContext.request.contextPath}/naver">네이버</a>
<a href="join">회원가입</a>
<a href="login">로그인</a>
<a href="logout">로그아웃</a>
<a href="modify">회원정보수정</a>
<a href="delete?custid=${sessionScope.loginId}">회원탈퇴</a>
</body>
</html>