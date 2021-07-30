<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="비밀번호변경 - 문곰책방" />
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="title" value="마이페이지 - KH문고" />
		</jsp:include>
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
									value="${loginMember.memberEmail}" id="memberEmail" readonly>
								<button type="button" class="btn" id="sendEmail">코드전송</button>
							</div>
						</div>
						<div class="fm_valDiv2">
							<div class="word4">코드입력</div>
							<div class="div4">
								<input type="text" id="codeVal" placeholder="이메일로 인증코드를 전송했습니다.">
								<button type="button" class="btn" id="checkCode">인증하기</button>
							</div>
						</div>
						<div class="fm_valDiv2" style="display: none" id="changePw">
							<div class="word4">비밀번호</div>
							<div class="div4">
								<form action="/member/memberUpdatePw.do" method="post">
								<input type="hidden" name="memberId" value="${loginMember.memberId }">
									<input type="hidden" name="memberPw" id="memberPw">
									<button class="btn">변경하기</button>
								</form>
							</div>
						</div>
						<div id="infoF" class="infoF">잘못된 코드입니다.</div>
						<input type="hidden" id="wC" value="no">
					</div>
				</div>
			</div>
		</div>
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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>