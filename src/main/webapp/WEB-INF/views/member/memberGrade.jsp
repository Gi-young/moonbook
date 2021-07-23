<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="회원등급별 혜택" />
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<div class="memberGrade_head padding10">
			<h1>등급별 혜택</h1>
		</div>
		<div class="wrap_tbl">
			<table class="tbl_nextGrade">
				<tr>
					<th></th>
					<c:forEach var="mg" items="${allMembergrade }" varStatus="status">
						<th><img
							src="${path }/resources/images/${mg.membergradeImg }" />
							<div class="member_grade${mg.membergradeNo}">${mg.membergradeName }</div>
						</th>
					</c:forEach>
				</tr>
				<tr>
					<td class="td_first fs15">순수구매액</td>
					<td>30만원 이상</td>
					<td>20~30만원</td>
					<td>10~20만원</td>
					<td>10만원 미만</td>
				</tr>
				<tr>
					<td class="td_first">쿠폰 혜택</td>
					<c:forEach var="mg" items="${allMembergrade }">
					
					</c:forEach>
					<td>
						<ul class="couponlist">
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_3000.png">
								</div> <span class="coupon_info">3만원 이상 구매시 사용</span></li>
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_3000.png">
								</div> <span class="coupon_info">2만원 이상 구매시 사용</span></li>
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_3000.png">
								</div> <span class="coupon_info">1만원 이상 구매시 사용</span></li>
						</ul>
					</td>
					<td>
						<ul class="couponlist">
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_3000.png">
								</div> <span class="coupon_info">7만원 이상 구매시 사용</span></li>
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_3000.png">
								</div> <span class="coupon_info">5만원 이상 구매시 사용</span></li>
						</ul>
					</td>
					<td>
						<ul class="couponlist">
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_2000.png">
								</div> <span class="coupon_info">3만원 이상 구매시 사용</span></li>
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_2000.png">
								</div> <span class="coupon_info">2만원 이상 구매시 사용</span></li>
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_2000.png">
								</div> <span class="coupon_info">1만원 이상 구매시 사용</span></li>
						</ul>
					</td>
					<td>
						<ul class="couponlist">
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_1000.png">
								</div> <span class="coupon_info">7만원 이상 구매시 사용</span></li>
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_1000.png">
								</div> <span class="coupon_info">5만원 이상 구매시 사용</span></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td class="td_first fs15">적립포인트</td>
					<c:forEach var="mg" items="${allMembergrade }">
						<td><fmt:formatNumber type="percent"
								value="${mg.membergradePercent }" pattern="0%" /></td>
					</c:forEach>
				</tr>
			</table>
		</div>
		<div class="memberGrade_head margin_top2e padding10">
			<h3>등급 선정 기준</h3>
		</div>
		<div class="wrap_tbl">
			<table class="tbl_gradeInfo">
				<tr>
					<th>구분</th>
					<th>내용</th>
				</tr>
				<tr>
					<td class="td_first">혜택기간</td>
					<td>매월 1일(오전 9시)부터 3개월</td>
				</tr>
				<tr>
					<td class="td_first">선정기간</td>
					<td>직전 3개월 순수구매액(전월 1일 ~ 당월 1일, 결제일 기준)</td>
				</tr>
				<tr>
					<td class="td_first fs15">순수구매액</td>
					<td>쿠폰, 포인트 등을 제외한 도서 및 기프트 상품의 순수 결제금액</td>
				</tr>
				<tr>
					<td class="td_first fs15">적립포인트</td>
					<td>적립포인트의 소수점은 반올림하여 적용합니다.<br>예) 골드곰 회원(적립포인트 6%)이
						12,110원의 상품을 구입한 경우 <br> 726.6의 포인트가 반올림 되어 727 포인트로 적립
				<tr>
					<td class="td_first">쿠폰</td>
					<td>쿠폰은 결제일 기준, 30일 후에 재충전됩니다.</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>