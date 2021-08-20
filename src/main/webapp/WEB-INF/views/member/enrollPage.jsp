<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH문고 회원가입</title>
<link rel="stylesheet" href="${path }/resources/css/login/reset.css">
<link rel="stylesheet"
	href="${path }/resources/css/login/enrollPage.css">
</head>
<body>
	<div class="enroll-container">
		<div class="enroll-title">
			<img alt="문곰로고" src="${pageContext.request.contextPath}/resources/img/login/enroll1.PNG">
			<p>문곰 회원가입</p>
		</div>
		
		<div class="enroll-choice">
			<hr>
			<p class="enroll-welcome">문곰책방 회원가입을 환영합니다</p>
			<input class="enrollchoice1" type="button" value="문곰책방으로 가입" onclick="location.replace('${path}/member/enrollUser.do')">
			
			<p class="enroll-welcome1">매장 및 제휴 기가입한 회원의 아이디를 생성 하세요</p>
			<!-- <input type="button" value="네이버로 가입들어갈공간" onclick=""> -->
		</div>
		
		
		
	</div>
<script>

</script>
</body>
</html>