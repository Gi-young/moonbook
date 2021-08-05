<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<input type="hidden" id="memberId"
	value="${sessionScope.loginMember.memberId}">
<input type="hidden" id="contextPath" value="${path}" />
<script src="${path}/resources/js/ebook/home/ebookHeader.js"></script>
<div class="myroom_sideMenu margin_top20">
	<h1 class="padding10">
		<a href="${path }/member/myroom/main.do">마이페이지</a>
	</h1>
	<ul class="sideMenu padding10">
		<li><h3>
				<a href="${path }/member/myroom/payList.do">구매내역</a>
			</h3></li>
		<li><h3>
				<a href="javascript:openEbookWizard();">e-Book</a>
			</h3></li>
		<li><h3>
				<a href="${path }/member/myroom/coupon.do">쿠폰함</a>
			</h3></li>
		<li><h3>
				<a href="#">문의내역</a>
			</h3></li>
		<li><h3>
				<a href="${path }/member/myroom/reLogin.do?">회원정보수정</a>
			</h3></li>
		<li><h3>
				<a href="${path }/member/myroom/changePw.do?del=0">비밀번호변경</a>
			</h3></li>
		<li><h3>
				<a href="${path }/member/myroom/changePw.do?del=1">회원탈퇴</a>
			</h3></li>
	</ul>
</div>