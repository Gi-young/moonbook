<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<c:set var="nextGrade"
	value="${Integer.parseInt(membergrade.membergradeImg.charAt(membergrade.membergradeImg.lastIndexOf('_')-1))+1}" />
<c:set var="lowGrade"
	value="${Integer.parseInt(membergrade.membergradeImg.charAt(membergrade.membergradeImg.lastIndexOf('_')-1))-1}" />
<%@page import="java.util.List, java.lang.Integer"%>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="마이페이지 - 문곰책방" />
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/myroom/layout.css">
<link rel="stylesheet" href="${path }/resources/css/memberGrade.css">
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
		<jsp:include page="/WEB-INF/views/common/myroomHead.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
		<div class="myroom_contents">
			<div class="content_middle padding10 flex">
				<div class="bold">이번달 등급 |</div>
				<div class="sub_title">
					<span class="fs8 padding10">당월 제외, 최근 3개월 기준</span>
				</div>
			</div>
			<table class="tbl_nextGrade">
				<tr>
					<th></th>
					<c:if test="${prevMonth-2 <= 0}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth + 10}" type="number" /></th>
					</c:if>
					<c:if test="${prevMonth-2 > 0}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth -2}" type="number" /></th>
					</c:if>
					<c:if test="${prevMonth-1 < 1}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth + 11}" type="number" /></th>
					</c:if>
					<c:if test="${prevMonth-1 >= 0}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth  - 1}" type="number" /></th>
					</c:if>
					<c:if test="${prevMonth < 1}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth  + 12}" type="number" /></th>
					</c:if>
					<c:if test="${prevMonth >= 1}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth }" type="number" /></th>
					</c:if>
				</tr>
				<tr>
					<td class="td_first">순수구매액</td>
					<td><c:if test="${list.get(3) != null}">
							<fmt:formatNumber type="currency" value="${list.get(3) }"></fmt:formatNumber>
						</c:if> <c:if test="${list.get(3) == null}">
							<fmt:formatNumber type="currency" value="0"></fmt:formatNumber>
						</c:if></td>
					<td><c:if test="${list.get(2) != null}">
							<fmt:formatNumber type="currency" value="${list.get(2) }"></fmt:formatNumber>
						</c:if> <c:if test="${list.get(2) == null}">
							<fmt:formatNumber type="currency" value="0"></fmt:formatNumber>
						</c:if></td>
					<td><c:if test="${list.get(1) != null}">
							<fmt:formatNumber type="currency" value="${list.get(1) }"></fmt:formatNumber>
						</c:if> <c:if test="${list.get(1) == null}">
							<fmt:formatNumber type="currency" value="0"></fmt:formatNumber>
						</c:if></td>
				</tr>
				<tr>
					<td rowspan="2" class="td_first">총합</td>
					<td rowspan="2"><fmt:formatNumber type="currency"
							value="${list.get(3)+list.get(2)+list.get(1) }"></fmt:formatNumber></td>
					<td colspan="2" rowspan="2" class="td_first"><div
							class="padding10">이번달 등급</div> <a href="${path }/member/grade.do"><img
							src="${path }/resources/images/${membergrade.membergradeImg }"></a></td>
				</tr>
			</table>
			<div class="content_middle padding10 flex">
				<div class="bold">다음 등급까지 남은 금액 |</div>
				<div class="sub_title">
					<span class="fs8 padding10">당월 포함, 3개월 기준</span>
				</div>
			</div>
			<table class="tbl_nextGrade">
				<tr>
					<th></th>
					<c:if test="${prevMonth-1 < 1}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth + 11}" type="number" /></th>
					</c:if>
					<c:if test="${prevMonth-1 >= 0}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth  - 1}" type="number" /></th>
					</c:if>
					<c:if test="${prevMonth < 1}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth  + 12}" type="number" /></th>
					</c:if>
					<c:if test="${prevMonth >= 1}">
						<th><fmt:formatNumber minIntegerDigits="2"
								value="${prevMonth }" type="number" /></th>
					</c:if>
					<th><fmt:formatNumber minIntegerDigits="2"
							value="${prevMonth  + 1}" type="number" /></th>
				</tr>
				<tr>
					<td class="td_first">순수구매액</td>
					<td><c:if test="${list.get(2) != null}">
							<fmt:formatNumber type="currency" value="${list.get(2) }"></fmt:formatNumber>
						</c:if> <c:if test="${list.get(2) == null}">
							<fmt:formatNumber type="currency" value="0"></fmt:formatNumber>
						</c:if></td>
					<td><c:if test="${list.get(1) != null}">
							<fmt:formatNumber type="currency" value="${list.get(1) }"></fmt:formatNumber>
						</c:if> <c:if test="${list.get(1) == null}">
							<fmt:formatNumber type="currency" value="0"></fmt:formatNumber>
						</c:if></td>
					<td><c:if test="${list.get(0) != null}">
							<fmt:formatNumber type="currency" value="${list.get(0) }"></fmt:formatNumber>
						</c:if> <c:if test="${list.get(0) == null}">
							<fmt:formatNumber type="currency" value="0"></fmt:formatNumber>
						</c:if></td>
				</tr>
				<tr>
					<td rowspan="2" class="td_first">남은 금액</td>
					<td rowspan="2"><c:choose>
							<c:when
								test="${membergrade.membergradeStandard +100000-list.get(2)-list.get(1)-list.get(0) > 0}">
								<fmt:formatNumber type="currency"
									value="${membergrade.membergradeStandard +100000-list.get(2)-list.get(1)-list.get(0)}"></fmt:formatNumber>
							</c:when>
							<c:when
								test="${membergrade.membergradeStandard +100000-list.get(2)-list.get(1)-list.get(0) <= 0}">
								<fmt:formatNumber type="currency" value="0"></fmt:formatNumber>
							</c:when>
						</c:choose></td>
					<td colspan="2" rowspan="2" class="td_first"><div
							class="padding10">다음달 등급</div> <a href="${path }/member/grade.do">
							<c:choose>
								<c:when
									test="${membergrade.membergradeStandard +100000-list.get(2)-list.get(1)-list.get(0)
									 > 0 && membergrade.membergradeNo==1}">
									<img
										src="${path }/resources/images/${membergrade.membergradeImg }">
								</c:when>
								<c:when
									test="${membergrade.membergradeStandard +100000-list.get(2)-list.get(1)-list.get(0)
									 > 0 && membergrade.membergradeNo > 1}">
									<img
										src="${path }/resources/images/${fn:replace(membergrade.membergradeImg,
										 membergrade.membergradeImg.charAt(membergrade.membergradeImg.lastIndexOf('_')-1), lowGrade) }">
								</c:when>
								<c:when
									test="${membergrade.membergradeStandard +100000-list.get(2)-list.get(1)-list.get(0) <= 0}">
									<img
										src="${path }/resources/images/${fn:replace(membergrade.membergradeImg,
										 membergrade.membergradeImg.charAt(membergrade.membergradeImg.lastIndexOf('_')-1), nextGrade) }">
								</c:when>
							</c:choose>
					</a></td>
				</tr>
			</table>
			<div class="myroom_infoBox">
				<div>
					<img src="${path }/resources/images/hello.png" />
				</div>
				<div class="myroom_info">
					<ul>
						<li>매월 순수구매액은 전월 1일 ~ 당월 1일까지 구매내역입니다.<br> <span>ex)
								7월 : 6월 1일 ~ 7월 1일</span>
						</li>
						<li>순수구매액은 도서, 기프트 상품 구입시 결제한 실제 금액이며, 쿠폰과 적립금을 통한 할인 금액은
							순수구매액에서 제외됩니다.</li>
						<li>쿠폰은 발급일 기준 30일 후에 재충전 됩니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>