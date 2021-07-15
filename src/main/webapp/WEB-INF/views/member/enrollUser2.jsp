<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>


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

			<form id="frm" action="${path }/member/memberEnrollEnd.do" method="post">

			<form action="${path }/member/memberEnrollEnd.do" method="post">

			<hr>
			<p class="enrollInfo-font">아이디</p>
		
			<input type="text" name="memberId" placeholder="아이디입력(4글자이상)" id="memberId" required>
			
			<span class="memberIdCheck" >이 아이디는 사용 가능합니다.</span><span class="memberIdCheck2">이 아이디는 이미 사용중입니다.</span>
			<span class="memberIdCheck3">아이디는 4글자 이상이여야 합니다.</span>
			<p class="enrollInfo-font">비밀번호</p>
			<input type="password" name="memberPw" placeholder="비밀번호입력" required>
			<p class="enrollInfo-font">비밀번호 재확인</p>
			<input type="password" id="memberPw2" placeholder="비밀번호재입력" required>
			<span class="memberPwCheck">비밀번호 일치합니다.</span><span class="memberPwcheck2">비밀번호 불일치합니다.</span>
			<p class="enrollInfo-font">이름</p>
			<input type="text" name="memberName" placeholder="10자리 내 입력" required>
			<p class="enrollInfo-font">이메일</p>
			<div class="enrollInfo-box2">
				<input type="text" id="localPart" required> @ 
				<input type="text" id="domain" value="naver.com">
				<select name='selectEmail' id="selectEmail" class="enrollInfo-select">
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
				</select>
				
				<input type="hidden" name="memberEmail" id="memberEmail">
				
				<!-- <button onclick="" class="enrollInfo-button">확인</button>  -->
			</div> 
			<p class="enrollInfo-font">전화번호</p>
				<input type="text" name="memberPhone" placeholder="전화번호입력(-없이)" required>
			<p class="enrollInfo-font">주소</p>
				<input type="text" name="memberAddress" placeholder="주소입력" required>
			<p class="enrollInfo-font">성별</p>
			<div class="enrollInfo-box3">
					<input type="radio" name="memberGender" id="genderM" value="M">
					<label for="genderM">남</label>
					<input type="radio" name="memberGender" id="genderF" value="F">
					<label for="genderF">여</label>
			</div>
			<p class="enrollInfo-font">생년월일</p>

				<input type="Date" name="memberBirth" required>
			<div class="enrollInfo-box4">
			<input class="enrollchoice3" type="submit" value="완료" onclick="return fn_frmsubmit();" >

			</div>
		</form>
		</div>
	</div>

</body>
</html>
<script>

	const fn_frmsubmit=()=>{
		if($('.memberIdCheck').css("display")!="none" && $('.memberPwcheck').css("display")!="none"){
			let memberEmail=$("#localPart").val()+"@"+$("#domain").val();
			document.getElementById("memberEmail").value=memberEmail;
			return true;
		}else{
			alert("확인 필요");
			return false;
		}
	}

	$("#selectEmail").change(e =>{
		let domain=$(e.target).val();
		document.getElementById("domain").value=domain;
	});
	
	$("#memberId").keyup(e=>{
		const memberId=$(e.target).val();
		
		if(memberId.length>=4){
			$(".memberIdCheck3").hide();
			$.get("${path}/member/checkId.do?memberId="+memberId,data=>{
				console.log(data);
				let obj=JSON.parse(data);
				console.log(obj);
				if(obj=="false"){
					$(".memberIdCheck3").hide();
					$(".memberIdCheck2").show();
					$(".memberIdCheck").hide();
				}else if(obj=="true"){
					$(".memberIdCheck3").hide();
					$(".memberIdCheck2").hide();
					$(".memberIdCheck").show();
				}
			});
		}else{
			$(".memberIdCheck3").show();
			$(".memberIdCheck2").hide();
			$(".memberIdCheck").hide();
		}
	});
	$("#memberPw2").keyup(e =>{
		const password=$(e.target).prev().prev().val();
		const password2=$(e.target).val();
		
		if(password2==password){
			$(".memberPwcheck").show();
			$(".memberPwcheck2").hide();
		}else{
			$(".memberPwcheck").hide();
			$(".memberPwcheck2").show();
		}
	})
	
	

</script>