<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="회원등급별 혜택" />
</jsp:include>
<div class="wrap">
	<div class="container">
		<div class="title_memberGrade bold">
			<h3>등급별 혜택</h3>
		</div>
		<div class="box_memberGrade">
			<table class="tbl_memberGrade">
				<tr>
					<th colspan="2"></th>
					<th scope="col" class="tbl_head">
						<div class="member_grade">플래티넘</div>
					</th>
					<th scope="col" class="tbl_head">
						<div class="member_grade">골드</div>
					</th>
					<th scope="col" class="tbl_head">
						<div class="member_grade">실버</div>
					</th>
					<th scope="col" class="tbl_head">
						<div class="member_grade">프렌즈</div>
					</th>
				</tr>
				<tr>
					<th scope="row" colspan="2">최근 3개월<br>순수 구매액
					</th>
					<td><big>30만원 이상</big></td>
					<td><big>20~30만원</big></td>
					<td><big>10~20만원</big></td>
					<td><big>10만원 미만</big></td>
				</tr>
				<tr>
					<th scope="row" colspan="2">발급 가능 쿠폰 종류</th>
					<td class="valign_top">
						<ul class="couponlist">
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_3000.png">
								</div> <span class="coupon_info">3만원 이상 구매시 사용가능</span></li>
						</ul>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>