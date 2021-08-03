<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<link rel="stylesheet" href="${path }/resources/css/order/layout.css">
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<div class="wrap">
	<div class="orderHead">
		<h1 class="">주문/결제</h1>
	</div>
	<div class="container">
		<div class="orderInfoBox">
			<div class="infoTitle">
				<h3>배송 정보</h3>
			</div>
			<div class="tbl_box">
				<table class="tbl_deli">
					<tr class="tbl_first">
						<th>주문자</th>
						<td><input></td>
					</tr>
					<tr class="tbl_first">
						<th>이메일</th>
						<td><input></td>
					</tr>
					<tr class="tbl_first">
						<th>연락처</th>
						<td><input></td>
					</tr>
					<tr class="tbl_first">
						<th>배송지</th>
						<td><input type="radio" id="address"><label
							for="address">기존주소</label></td>
						<td><input type="radio" id="address"><label
							for="address">새주소</label></td>
					</tr>
					<tr class="tbl_first">
						<th>받는 분</th>
						<td><input></td>
					</tr>
					<tr class="tbl_first">
						<th>배송 연락처</th>
						<td><input></td>
						<td><input type="radio" id="phone"><label for="phone">주문자와
								동일</label></td>
					</tr>
					<tr class="tbl_first">
						<th>주문 요청사항</th>
						<td><input></td>
						<td><input type="radio" id="phone"><label for="phone">주문자와
								동일</label></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>