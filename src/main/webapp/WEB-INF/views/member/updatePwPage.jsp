<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재생성하기</title>
<link rel="stylesheet" href="${path }/resources/css/login/reset.css">
<link rel="stylesheet" href="${path }/resources/css/login/updatePwPage.css">
</head>
<body>
<div class="updatePw-container">
		<p class="updateMyInfo-title3">비밀번호 다시 생성하기</p>
		
		<p class="updateMyInfo-title4">변경할 비밀번호를 입력하세요</p>
		
		<div class="search1Ver-container">
			<form action="${path}/member/memberUpdatePw.do" method="post">
				<table class="search1Ver">
					<input type="hidden" name="memberId" value="${memberId }">
					<tr>
						<th class="search-Th">
							<label>비밀번호</label>
						</th>
						<td><input type="password" name="memberPw" placeholder="비밀번호입력"></td>
					</tr>
					<tr>
						<th class="search-Th">
							<label>비밀번호 재입력</label>
						</th>
						<td><input type="password" id="memberPw2" placeholder="비밀번호재입력"></td>
					</tr>
					
				</table>
				<div class="search1VerBtns">
					<input type="submit" value="확인" onclick="fn_checkPw();"/>
					<button onclick="fn_close();">닫기</button>
				</div>
			</form>
		</div>
		
		
		
	</div>
</body>
</html>
<script type="text/javascript">
const fn_checkPw=()=>{
	const password=$(e.target).parent().parent().prev().children().next().children().val();
	const password2=$(e.target).val();
	
	if(password2!=password){
		alert("비밀번호가 맞지 않습니다.");
		return false;
	}
}

function fn_close(){
	self.close();
}
</script>
