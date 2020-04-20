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
	<p>${sessionScope.custname}님, 안녕하세요.</p>
	</c:if>
<c:if test="${sessionScope.loginId == null}">
<a href="join">회원가입</a>
<a href="login">로그인</a>
</c:if>
<c:if test="${sessionScope.loginId != null}">
<a href="logout">로그아웃</a>
<a href="modify">회원정보수정</a>
<a href="delete?custid=${sessionScope.loginId}">회원탈퇴</a>
</c:if>
<a href="review">리뷰</a>
<a href="reviewWrite?custid=${sessionScope.loginId}">리뷰쓰기</a>
<a href="template">템플릿</a>
<a href="show">상품리스트</a>
</body>
</html>