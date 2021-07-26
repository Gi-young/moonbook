<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="myroom_sideMenu margin_top20">
	<h1 class="padding10">
		<a href="${path }/member/myroom.do">마이페이지</a>
	</h1>
	<ul class="sideMenu padding10">
		<li><h3>
				<a href="#">구매내역</a>
			</h3></li>
		<li><h3>
				<a href="#">e-Book</a>
			</h3></li>
		<li><h3>
				<a href="${path }/member/coupon.do">쿠폰함</a>
			</h3></li>
		<li><h3>
				<a href="#">문의내역</a>
			</h3></li>
		<li><h3>
				<a href="${path }/member/updateMember.do">회원정보수정</a>
			</h3></li>
		<li><h3>
				<a href="#">비밀번호변경</a>
			</h3></li>
		<li><h3>
				<a href="#">회원탈퇴</a>
			</h3></li>
	</ul>
</div>