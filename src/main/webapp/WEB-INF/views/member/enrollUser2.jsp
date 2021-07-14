<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보입력</title>
<link rel="stylesheet"
	href="${path}/resources/css/login/reset.css">
<link rel="stylesheet"
	href="${path}/resources/css/login/enrollUser2.css">

</head>
<body>
	<div class="enrollInfo-container">
		<div class="enroll-title">
			<img alt="KH로고"
				src="${pageContext.request.contextPath}/resources/img/KHLogo3.PNG">
			<p>회원가입</p>
		</div>
		<div class="enrollInfo-box">
			<form name="memberEnrollFrm" action="${path }/member/memberEnrollEnd.do" method="post">
			<hr>
			<p class="enrollInfo-font">아이디</p>
			<input type="text" name="id" placeholder="아이디입력" required>
			<p class="enrollInfo-font">비밀번호</p>
			<input type="text" name="pwd" placeholder="비밀번호입력" required>
			<p class="enrollInfo-font">이름</p>
			<input type="text" name="name" placeholder="10자리 내 입력" required>
			<p class="enrollInfo-font">이메일</p>
			<div class="enrollInfo-box2">
				<input type="text" name="email" required> @ 
				<input type="text" name="domain" id="domain" value="">
				
				<select name='selectEmail' id="selectEmail" class="enrollInfo-select">
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
				</select>
				
				<button onclick="" class="enrollInfo-button">확인</button> 
			</div> 
			<p class="enrollInfo-font">전화번호</p>
				<input type="text" name="phone" placeholder="전화번호입력(-없이)" required>
			<p class="enrollInfo-font">주소</p>
				<input type="text" name="phone" placeholder="주소입력" required>
			<p class="enrollInfo-font">성별</p>
			<div class="enrollInfo-box3">
					<input type="radio" name="gender" id="genderM" value="M">
					<label for="genderM">남</label>
					<input type="radio" name="gender" id="genderF" value="F">
					<label for="genderF">여</label>
			</div>
			<p class="enrollInfo-font">생년월일</p>
				<input type="Date" name="birthDate" required>
			<div>
			<input class="enrollchoice3" type="submit" value="완료" >
			</div>
		</form>
		</div>
	</div>

</body>
</html>
<script>

</script>