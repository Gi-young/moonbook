<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 - 문곰책방</title>
	<style>
	
	</style>
</head>
<body>
	<form action="${path}/ebook/login.do" method="post">
		<div id="loginBox">
			<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력하세요" value="${cookie.saveId.value}">
			
			<label for="saveId">아이디 저장</label>
			<input type="checkbox" id="saveId" name="saveId">
			
			<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
		
			<input type="submit" value="로그인">
		</div>
	</form>
	
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
				let resultMsg = document.createElement("div");
				resultMsg.innerText = "로그인 실패, 다시 시도해주세요"
				resultMsg.style.color = "red";
				resultMsg.style.fontWeight = "bolder";
				
				document.getElementById("loginBox").appendChild(resultMsg);
			}
		</c:if>
	</script>
</body>
</html>