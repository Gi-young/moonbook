<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="회원등급별 혜택" />
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/memberGrade.css">
<div class="wrap">
	<div class="container">
		<div class="title_memberGrade bold">
			<h3>등급별 혜택</h3>
		</div>
		<div class="box_memberGrade">
			<table class="tbl_memberGrade">
				<tr>
					<th colspan="2"></th>
					<c:forEach var="mg" items="${mg }" varStatus="status">
						<th scope="col" class="tbl_head">

							<div class="member_grade${mg.membergradeNo}">${mg.membergradeName }</div>
						</th>
					</c:forEach>
					<!-- <th scope="col" class="tbl_head">
						<div class="member_grade4">플래티넘</div>
					</th>
					<th scope="col" class="tbl_head">
						<div class="member_grade3">골드</div>
					</th>
					<th scope="col" class="tbl_head">
						<div class="member_grade2">실버</div>
					</th>
					<th scope="col" class="tbl_head">
						<div class="member_grade1">프렌즈</div>
					</th> -->
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
					<th scope="row" colspan="2">추가 발급 가능 쿠폰 종류</th>
					<td class="valign_top">
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
					<td class="valign_top">
						<ul class="couponlist">
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_3000.png">
								</div> <span class="coupon_info">7만원 이상 구매시 사용</span></li>
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_3000.png">
								</div> <span class="coupon_info">5만원 이상 구매시 사용</span></li>
							<%-- <li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_3000.png">
								</div> <span class="coupon_info">3만원 이상 구매시 사용</span></li> --%>
						</ul>
					</td>
					<td class="valign_top">
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
					<td class="valign_top">
						<ul class="couponlist">
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_1000.png">
								</div> <span class="coupon_info">7만원 이상 구매시 사용</span></li>
							<li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_1000.png">
								</div> <span class="coupon_info">5만원 이상 구매시 사용</span></li>
							<%-- <li><div class="coupon">
									<img src="${path }/resources/images/img_coupon_1000.png">
								</div> <span class="coupon_info">3만원 이상 구매시 사용</span></li> --%>
						</ul>
					</td>
			</table>
		</div>
		<h4 class="title_memberStandard bold">등급 선정 기준</h4>
		<table class="tbl_memberStandard">
			<tr>
				<th scope="col" colspan="2">구분</th>
				<th scope="col">내용</th>
			</tr>
			<tr>
				<th scope="row" colspan="2">혜택기간</th>
				<td>매월 1일(오전 9시)부터 3개월</td>
			</tr>
			<tr>
				<th scope="row" colspan="2">선정기간</th>
				<td>직전 3개월 순수구매액(전월 1일 ~ 당월 1일, 결제일 기준)</td>
			</tr>
			<tr>
				<th scope="row" colspan="2">순수구매액</th>
				<td>쿠폰, 배송비 등을 제외한 도서 및 기프트 상품의 순수 금액</td>
			</tr>
		</table>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>