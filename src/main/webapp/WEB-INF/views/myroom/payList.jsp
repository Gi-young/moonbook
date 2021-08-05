<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<link rel="stylesheet" href="${path }/resources/css/myroom/layout.css">
<link rel="stylesheet" href="${path }/resources/css/memberGrade.css">
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="마이페이지 - KH문고" />
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="title" value="구매내역 - KH문고" />
		</jsp:include>
		<jsp:include page="/WEB-INF/views/common/myroomHead.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
		<div class="myroom_contents">
			<div class="content_title">
				<div class="bold">구매 내역 |</div>
				<div class="dateBox">
					<span> <input type="date" id="startDay">
					</span> - <span> <input type="date" id="endDay">
					</span>
					<button class="btn">조회</button>
				</div>
			</div>
			<div class="optionBox">
				<select class="selectBox">
					<option>---진행상황---</option>
				</select>
			</div>
			<div class="content_title">
				<div class="payCate">
					<a href="#"> 도서 </a>
				</div>
				<span class="padding10"> | </span>
				<div>
					<a href="#"> e-Book </a>
				</div>
				<span class="padding10"> | </span>
				<div>
					<a href="#"> 기프트 </a>
				</div>
			</div>
			<table class="tbl_order">
				<tr>
					<th class="orderTh">상품</th>
					<th>결제금액</th>
					<th>결제날짜</th>
					<th>진행상황</th>
				</tr>
				<tr>
					<td><div class="flex">
							<div>(대표)상품이미지</div>
							<div>(대표)상품명</div>
						</div></td>
					<td>0</td>
					<td>날짜</td>
					<td>거래 완료</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<script>
	var date = new Date();
	var formattedDate = date.getFullYear()
			+ "-"
			+ (date.getMonth() + 1 < 9 ? ("0" + (date.getMonth() + 1)) : (date
					.getMonth() + 1)) + "-"
			+ (date.getDate() < 10 ? ("0" + date.getDate()) : date.getDate());
	console.log(formattedDate);
	$("#endDay").val(formattedDate);
	var formattedDate = (date.getFullYear() - 1)
			+ "-"
			+ (date.getMonth() + 1 < 9 ? ("0" + (date.getMonth() + 1)) : (date
					.getMonth() + 1)) + "-"
			+ (date.getDate() < 10 ? ("0" + date.getDate()) : date.getDate());
	$("#startDay").val(formattedDate);
	console.log(date);
</script>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>