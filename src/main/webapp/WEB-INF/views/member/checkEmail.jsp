<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/login/reset.css">
<link rel="stylesheet" href="${path }/resources/css/myroom/layout.css">
<link rel="stylesheet"
	href="${path }/resources/css/login/resultIdPage.css">
</head>
<body>
	<div class="resultId-container">
		<c:if test="${m2!=null }">
			<form action="${path }/member/resultIdPage.do?" method="post"
				id="cookieChangeP">
				<p class="resultId-Info">인증 코드를 입력하세요.</p>
				<div class="resultIdPwd-ok">
					<input type="text" id="codeVal"> <input type="hidden"
						name="m2" value="${m2 }"> <input type="submit" value="확인"
						class="resultIdBtn" onclick="return fn_resultIdPwdBtn();">
				</div>
				<div id="checkCode"
					style="display: none; color: red; text-align: center;"
					class="padding10">잘못된 인증코드</div>
			</form>
		</c:if>
		<c:if test="${m3!=null }">
			<form action="${path }/member/updatePwPage.do" method="post"
				id="cookieChangeP">
				<p class="resultId-Info">인증 코드를 입력하세요.</p>
				<div class="resultIdPwd-ok">
					<input type="text" id="codeVal"> <input type="hidden"
						name="m3" value="${m3 }"> <input type="submit" value="확인"
						class="resultIdBtn" onclick="return fn_resultIdPwdBtn();">
				</div>
				<div id="checkCode"
					style="display: none; color: red; text-align: center;"
					class="padding10">잘못된 인증코드</div>
			</form>
		</c:if>
	</div>


</body>
</html>

<script>
	const fn_resultIdPwdBtn = ()=> {
		var code = "${code}";
		if($("#codeVal").val() == code){
			return true;
		}else{
			$("#checkCode").css("display", "block");
			$("#codeVal").focus();
			return false;
		}
	}
	console.log("${code}");
</script>