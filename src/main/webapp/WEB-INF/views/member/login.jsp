<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path }/resources/css/login/login.css">

<div class="loginPage-container">
		<div class="loginInfo">
			<p>홈 > 로그인</p>
			<hr class="hr1">
			<h3>로그인</h3>
		<hr class="hr2">
		</div>

		<div class="login-box">
		<div class="login-box2">
			<div class="login-container">
				<div class="login-title">
					<span>회원로그인</span>
					<hr class="hr3">
				</div>
				<c:if test="${empty list }">
					<form class="loginForm"
						action="${path }/login.do" method="post">
						<div class="logintext4">
							<div class="logintext1">
								<input type="text" name="loginId"
									placeholder="아이디를 대/소문자 구분하여 입력"> 
									<input type="password" name="password" id="password"
									placeholder="비밀번호를 대/소문자 구분하여 입력">
							</div>
							<div class="loginSubmit">
								<input type="submit" name="로그인" value="로그인">
							</div>
						</div>
						<div class="logintext2">
							<input type="checkbox" name="saveId" id="saveId"
								${list.id ne null? "checked":""}> <label for="saveId">아이디저장</label>
							<a class="searchIdPwd" href="">아이디/비밀번호찾기</a>
						</div>
						<div class="logintext3">
							<input type="button" name="naverLogin" value="네이버 Id로 가입/로그인">
							<input type="button" name="enroll" value="KH문고 회원가입">
						</div>
					</form>
					
				</c:if>
				
			</div>
				<div class="sleepingUser">
					<p>1년 이상 미접속 회원이신가요?</p>
					<input type="button" name="sleepUser" value="조회하기">
				</div>
			</div>
			
			<div class="login-ad">
				<img alt="광고사진"
					src="${pageContext.request.contextPath }/resources/img/login/loginAd.PNG">
			</div>
			
			
		</div>
		<div class="login-box3">
			<img alt="광고사진" src="${pageContext.request.contextPath }/resources/img/login/kh0.png">
		</div>
		<div class="login-box4">
		<p>KH문고가 더 좋은 이유</p>
			<img alt="광고사진" src="${pageContext.request.contextPath }/resources/img/login/kh1.PNG">
			<img alt="광고사진" src="${pageContext.request.contextPath }/resources/img/login/kh2.PNG">
			<img alt="광고사진" src="${pageContext.request.contextPath }/resources/img/login/kh3.png">
		</div>
		<div class="login-box5">
			<img alt="광고사진" src="${pageContext.request.contextPath }/resources/img/login/kh4.PNG">
			<img alt="광고사진" src="${pageContext.request.contextPath }/resources/img/login/kh5.PNG">
			<img alt="광고사진" src="${pageContext.request.contextPath }/resources/img/login/kh6.png">
		</div>
		
	</div>
	
	<script>
		const fn_invalidate=()=>{
		const userId=$("#userId").val();
		const pw=$("#password").val();
			if(userId.trim().length<4){
				alert("아이디를 4글자이상 입력하세요")
				return false;
			}
			if(pw.trim().length==0){
				alert("패스워드를 입력하세요")
				return false;
			}
				return true;
			}
				
			const fn_logout=()=>{
				location.replace("${pageContext.request.contextPath }/logout");
			}
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp">
<jsp:param name="" value=""/>
</jsp:include>
