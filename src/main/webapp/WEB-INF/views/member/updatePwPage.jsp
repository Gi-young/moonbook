<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재생성하기</title>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/login/reset.css">
<link rel="stylesheet" href="${path }/resources/css/login/updatePwPage.css">
</head>
<body>
<div class="updatePw-container">
		<p class="updateMyInfo-title3">비밀번호 다시 생성하기</p>
		
		<p class="updateMyInfo-title4">변경할 비밀번호를 입력하세요</p>
		<span class="memberPwcheck3">8자리 ~ 20자리 이내로 입력해주세요.</span>
							<span class="memberPwcheck4">비밀번호는 공백 없이 입력해주세요.</span>
							<span class="memberPwcheck5">영문,숫자, 특수문자를 혼합하여 입력해주세요.</span>
							<span class="memberPwcheck6">비밀번호가 정상적으로 확인되었습니다.</span>
		<div class="search1Ver-container">
			<form action="${path}/member/memberUpdatePw.do" method="post">
				<table class="search1Ver">
					<input type="hidden" name="memberId" value="${memberId }">
					<tr>
						<th class="search-Th">
							<label>비밀번호</label>
						</th>
						<td><input type="password" name="memberPw" placeholder="비밀번호입력" id="memberPw3"></td>
					</tr>
					<tr>
						<th class="search-Th">
							<label>비밀번호 재입력</label>
						</th>
						<td><input type="password" id="memberPw2" placeholder="비밀번호재입력"></td>
					</tr>
					
				</table>
				<div class="search1VerBtns">
					<input type="submit" value="확인" onclick="return fn_checkPw();"/>
					<button onclick="fn_close();">닫기</button>
				</div>
			</form>
		</div>
		
		
		
	</div>
</body>
</html>
<script type="text/javascript">

const fn_checkPw=()=>{
	const password=$("#memberPw2").parent().parent().prev().children().next().children().val();
	const password2=$("#memberPw2").val();
	console.log(password);
	console.log(password2);
	if(password2!=password){
		alert("비밀번호가 맞지 않습니다.");
		return false;
	}else if($('.memberPwcheck6').css("display")=="none"){
		alert("유효하지 않은 비밀번호입니다.");
		return false;
	}
}

function fn_close(){
	self.close();
}

$("#memberPw3").keyup(e=>{
	//영문(대소문자) 포함
	//숫자 포함
	//특수 문자 포함
	//공백 x
	//비밀번호 자리 8~20자
	const password=$("#memberPw3").val();
	
	var num = password.search(/[0-9]/g);
	var eng = password.search(/[a-z]/ig);
	var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(password.length<8 ||password.length>20){
		$(".memberPwcheck3").show(); //8~20 자리 이내
		$(".memberPwcheck4").hide();
		$(".memberPwcheck5").hide();
		$(".memberPwcheck6").hide();
	}else if(password.search(/\s/)!=-1){
		$(".memberPwcheck3").hide();
		$(".memberPwcheck4").show(); //비밀번호 공백 없이
		$(".memberPwcheck5").hide();
		$(".memberPwcheck6").hide();
	}else if(num<0 || eng<0||spe<0){
		$(".memberPwcheck3").hide();
		$(".memberPwcheck4").hide(); 
		$(".memberPwcheck5").show(); //영문,숫자 특수문자 혼합
		$(".memberPwcheck6").hide();
	}else{
		$(".memberPwcheck3").hide();
		$(".memberPwcheck4").hide();
		$(".memberPwcheck5").hide();
		$(".memberPwcheck6").show(); //통과
	}
	
})


</script>
