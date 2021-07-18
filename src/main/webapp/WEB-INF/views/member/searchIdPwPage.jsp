<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="${path }/resources/css/login/reset.css">
<link rel="stylesheet"
	href="${path }/resources/css/login/searchIdPwPage.css">
</head>
<body>
	<div class="searchIdPw-container">
	<p class="searchMyInfo-title">내 정보로 간편 찾기</p>
	<input class="searchIdBtn" type="button" value="아이디 찾기" onclick="location.assign('${path}/member/searchIdPwPage2.do')">
	<input class="searchPwBtn" type="button" value="비밀번호 찾기" onclick="location.assign('${path}/member/searchIdPwPage3.do')">
	
	
	</div>
</body>
</html>