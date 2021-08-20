<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/myroom/layout.css">
<link rel="stylesheet" href="${path }/resources/css/memberGrade.css">
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="비밀번호변경 - 문곰책방" />
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="title" value="" />
		</jsp:include>
		<c:if test="${del == null }">
			<div class="myroom_contents">
				<div class="reLoginInfo">
					<div>
						<p class="infoP3">
							비밀번호 변경을 위해서는 <span class="infoP2">이메일 인증</span>이 필요합니다.
						</p>
					</div>
				</div>
				<div class="login-box2 margin_top2e">
					<div class="login-container">
						<div class="login-title">
							<span>이메일 인증</span>
							<hr class="hr3">
						</div>
						<div class="">
							<div class="fm_valDiv2">
								<div class="padding10">이메일</div>
								<div>
									<input type="text" name="memberEmail"
										value="${loginMember.memberEmail}" id="memberEmail"
										class="input" readonly>
									<button type="button" class="btn" id="sendEmail">코드전송</button>
								</div>
							</div>
							<div class="fm_valDiv2">
								<div class="word4">코드입력</div>
								<div class="div4">
									<input type="text" id="codeVal"
										placeholder="이메일로 인증코드를 전송했습니다." class="input">
									<button type="button" class="btn" id="checkCode">인증하기</button>
								</div>
							</div>
							<div class="fm_valDiv2" style="display: none" id="changePw">
								<div class="word4">비밀번호</div>
								<div class="div4">
									<form action="${path }/member/memberUpdatePw.do" method="post">
										<input type="hidden" name="memberId"
											value="${loginMember.memberId }"> <input
											type="hidden" name="memberPw" id="memberPw">
										<button class="btn" type="botton"
											onclick="return fn_frmsubmit();">변경하기</button>
									</form>
								</div>
							</div>
							<span class="memberPwcheck3">8자리 ~ 20자리 이내로 입력해주세요.</span> <span
								class="memberPwcheck4">비밀번호는 공백 없이 입력해주세요.</span> <span
								class="memberPwcheck5">영문,숫자, 특수문자를 혼합하여 입력해주세요.</span> <span
								class="memberPwcheck6">비밀번호가 정상적으로 확인되었습니다.</span>
							<div id="infoF" class="infoF">잘못된 코드입니다.</div>
							<input type="hidden" id="wC" value="no">
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${del != null }">
			<div class="myroom_contents">
				<div class="reLoginInfo">
					<div>
						<p class="infoP3">
							회원탈퇴를 위해서는 <span class="infoP2">이메일 인증</span>이 필요합니다.
						</p>
					</div>
				</div>
				<div class="login-box2 margin_top2e">
					<div class="login-container">
						<div class="login-title">
							<span>이메일 인증</span>
							<hr class="hr3">
						</div>
						<div class="">
							<div class="fm_valDiv2">
								<div class="padding10">이메일</div>
								<div>
									<input type="text" name="memberEmail"
										value="${loginMember.memberEmail}" id="memberEmail"
										class="input" readonly>
									<button type="button" class="btn" id="sendEmail">코드전송</button>
								</div>
							</div>
							<div class="fm_valDiv2">
								<div class="word4">코드입력</div>
								<div class="div4">
									<input type="text" id="codeVal"
										placeholder="이메일로 인증코드를 전송했습니다." class="input">
									<button type="button" class="btn" id="checkCode">인증하기</button>
								</div>
							</div>
							<div class="fm_valDiv2" style="display: none" id="changePw">
								<div class="word4">정말 탈퇴 하시겠습니까?</div>
								<div class="div4">
									<form action="${path }/member/myroom/deleteMember.do"
										method="post">
										<input type="hidden" name="memberId"
											value="${loginMember.memberId }">
										<button class="btn">탈퇴하기</button>
									</form>
								</div>
							</div>
							<div id="infoF" class="infoF">잘못된 코드입니다.</div>
							<input type="hidden" id="wC" value="no">
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</div>
<script>
$("#sendEmail").click(e=>{
	const memberEmail = $("#memberEmail").val();
	$.get("${path}/member/checkEmail.do?memberEmail="+memberEmail, data=>{
		alert("이메일로 인증코드를 전송했습니다.");
		console.log(data);
		$("#checkCode").click(e=>{
			const val=$("#codeVal").val();
			if(data == val){
				$("#changePw").css("display", "flex");
				$("#memberPw").attr("type", "password");
				$("#infoF").css("display", "none");
				$("#wC").val("yes");
			}else{
				$("#changePw").css("display", "none");
				$("#memberPw").attr("type", "hidden");
				$("#infoF").css("display", "block");
				$("#wC").val("no");
			}
		})
	})
})
$("#memberPw").keyup(e=>{
		//영문(대소문자) 포함
		//숫자 포함
		//특수 문자 포함
		//공백 x
		//비밀번호 자리 8~20자
		const password=$("#memberPw").val();
		
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
	
	const fn_frmsubmit=()=>{
		if($('.memberPwcheck6').css("display")!="none"){
			
			return true;
		}else{
			alert("확인 필요");
			return false;
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>