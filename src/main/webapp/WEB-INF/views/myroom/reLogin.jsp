<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="회원정보수정 - 재로그인" />
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
						회원정보 수정을 위해서는 <span class="infoP2">재로그인</span>이 필요합니다.
					</p>
				</div>
			</div>
			<div class="login-box2 margin_top2e">
				<div class="login-container">
					<div class="login-title">
						<span>회원로그인</span>
						<hr class="hr3">
					</div>
					<form class="loginForm" action="${path }/member/login.do"
						method="post">
						<div class="logintext4">
							<div class="logintext1">
								<input type="text" name="memberId"
									value="${loginMember.memberId}" id="memberId_" readonly>
								<input type="password" name="memberPw" id="password"
									placeholder="비밀번호를 대/소문자 구분하여 입력"> <input type="hidden"
									name="reLogin" value="y">
							</div>
							<div class="loginSubmit">
								<input type="submit" name="로그인" value="로그인">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>