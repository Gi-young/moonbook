<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 - 문곰책방</title>
	<link rel="icon" href="${path}/resources/images/ebook/favicon.png" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/login.css">
</head>
<body>
	<div class="color-band"></div>
	<div class="inner-color-band"></div>
	
	<form action="${path}/ebook/login.do" method="post" class="login-form">
		<div id="loginBox">
		 	<!-- value="${cookie.saveId.value}" --> 
			<div class="input-box">
				<div>
					<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력하세요" value="admin">
					<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" value="1234">
				</div>
				
				<input type="submit" value="로그인">
			</div>
			
			<div class="save-id-box">
				<label for="saveId">아이디 저장</label>
				<input type="checkbox" id="saveId" name="saveId">
			</div>
		</div>
	</form>
	
	<div class="inner-color-band"></div>
	<div class="color-band"></div>
	
	<div id="loginNotice"></div>
	
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script>
		<c:if test="${result != null}">
			if("${result}" === "로그인 성공") {
				opener.location.assign("${path}/ebook/pageEbook.do");
				window.close();
			} else {
				$("#memberId").val("");
				$("#password").val("");
				$("#memberId").focus();
				let loginNotice = document.getElementById("loginNotice");
				loginNotice.innerText = "로그인 실패, 다시 시도해주세요";
			}
		</c:if>
	</script>
</body>
</html>