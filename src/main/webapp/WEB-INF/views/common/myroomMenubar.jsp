<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<div class="wrap">
	<div class="container">
		<p class="path">
			홈 > <span>마이룸 > main</span>
		</p>
		<div class="myroom_snb">
			<h2 class="cscenter_h2">
				<a href="${path }/member/myroom.do">마이룸</a>
			</h2>
			<ul class="cscenter_snb3">
				<li><strong>주문관리</strong>
					<ul>
						<li><a href="#">주문/배송조회</a></li>
						<li><a href="#">취소/교환/반품조회</a></li>
					</ul></li>
				<li><strong>e-Book</strong>
					<ul>
						<li><a href="#">e-Book서재</a></li>
						<li><a href="#">찜</a></li>
					</ul></li>
				<li><a href="#"><strong>쿠폰함</strong></a></li>
				<li><a href="#"><strong>관심작가</strong></a></li>
				<li><a href="#"><strong>문의내역</strong></a></li>
				<li><strong>회원정보관리</strong>
					<ul>
						<li><a href="#">회원정보수정</a></li>
						<li><a href="#">비밀번호변경</a></li>
						<li><a href="#">회원등급조회/혜택안내</a></li>
						<li><a href="#">회원탈퇴</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="myroom_contents">
			<div class="out_myroom_gradearea">
				<div class="user_section">
					<div class="user_name">${loginMember.memberName }님
						(${loginMember.memberGrade })</div>
					<div class="btn_group">
						<a href="${path }/member/grade.do" class="btn_small">혜택보기</a> <a
							href="${path }/member/nextGrade.do" class="btn_small">다음달 예상
							등급</a>
					</div>
				</div>
				<table class="user_info_list">
					<tr>
						<td class="first">
							<div class="tit">
								<a href="#">쿠폰</a>
							</div>
							<div class="padding3">
								<a href="#"><strong class="bold">${coupon.size() }</strong></a>장
							</div>
						</td>
					</tr>
				</table>
			</div>