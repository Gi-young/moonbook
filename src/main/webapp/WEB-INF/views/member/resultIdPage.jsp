<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/login/reset.css">
<link rel="stylesheet" href="${path }/resources/css/login/resultIdPage.css">

</head>
<body>
	<div class="resultId-container">
		<form action="${path }/member/cookieChangePage.do?" method="post" id="cookieChangeP">
			<!-- <p class="resultAlert">이창은 10초후에 닫힙니다.</p> -->
			
			<c:if test="${m2 ne null}">
				<p class="resultId-Info">사용자의 아이디는 <span class="m2Result">${m2 }</span> 입니다.</p> 
			</c:if>
			
			<c:if test="${resultPw ne null }">
				<p class="resultId-Info">정상적으로 비밀번호를 변경하였습니다.</p>
			</c:if>
			<div class="resultIdPwd-ok">
			<input type="hidden" name="memberId" value="${m2 }">
			<input type="button" value="확인" class="resultIdBtn" onclick="fn_resultIdPwdBtn()">
			</div>
		</form>
	</div>

	
</body>
</html>

<script type="text/javascript">

function fn_resultIdPwdBtn(){
	
	opener.document.getElementById('memberId_').value='${m2}';
	opener.document.getElementById('password').focus();
	
	window.close();
}


</script>