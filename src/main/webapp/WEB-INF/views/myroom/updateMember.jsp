<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="마이페이지 - KH문고" />
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="title" value="회원정보수정 - KH문고" />
		</jsp:include>
		<div class="myroom_contents">
			<form action="#">
				<div class="fm_div">
					<div class="fm_valDiv">
						<div>아이디</div>
						<div>
							<input name="memberId" value="${loginMember.memberId }" readonly>
						</div>
					</div>
					<div class="fm_valDiv">
						<div>이름</div>
						<div>
							<input name="memberName" value="${loginMember.memberName }">
						</div>
					</div>
				</div>
				<div class="fm_div">
					<div class="fm_valDiv">
						<div>전화번호</div>
						<div>
							<input name="memberPhone" value="${loginMember.memberPhone}">
						</div>
					</div>
					<div class="fm_valDiv">
						<div>주소</div>
						<div>
							<input name="memberAddress" value="${loginMember.memberAddress}">
						</div>
					</div>
				</div>
				<div class="fm_div">
					<div class="fm_valDiv">
						<div>이메일</div>
						<div>
							<input class="emailId"
								value="${loginMember.memberEmail.substring(0, loginMember.memberEmail.indexOf('@'))}">
								<div>@</div>
								<input class="emailAddress" value="${loginMember.memberEmail.substring(loginMember.memberEmail.indexOf('@')+1) }">
						</div>
					</div>
				</div>
				<div class="flex"></div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>