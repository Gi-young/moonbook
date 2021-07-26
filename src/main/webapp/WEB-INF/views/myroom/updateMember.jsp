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
					<div class="padding10">
						<div>아이디</div>
						<div>
							<input name="memberId" value="${loginMember.memberId }" readonly>
						</div>
					</div>
					<div class="padding10">
						<div>이름</div>
						<div>
							<input name="memberName" value="${loginMember.memberName }">
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