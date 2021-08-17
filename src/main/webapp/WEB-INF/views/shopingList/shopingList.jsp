<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<link rel="stylesheet" href="${path }/resources/css/order/layout.css">

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>

<section id="content">
<div class="wrap">
<form action="#">
	<div class="orderInfoBox">
		<div class="infoTitle">
			<h3>문곰도서 주문 정보</h3>
		</div>
		<div class="tbl_box">
			<table class="tbl_order">
				<tr class="tbl_first">
					<th colspan="2">도서정보</th>
					<th>도서금액</th>
					<th>주문 가능 수량</th>
					<th>주문 수량</th>
					<th>결제금액</th>
				</tr>
				<%-- <c:forEach var="s" items="shopingList"> --%>
				<c:forEach var="b" items="${bList }">
				 <tr> 
					<td>${b.image }</td>
					<td>${b.title }</td>
					<td>${b.price }</td>
					<td>${b.stock }</td>
					<td></td>
					<td>삼백원</td>
				 </tr> 
				</c:forEach> 
<%-- 					<td><img src="${s.image }"></td>
					<td>${s.title }</td>
					<td><fmt:formatNumber value="${s.price*0.9 }" type="currency"/></td>
					<td>${s.stock } 개</td>
					<td>${sellStock } 개</td>
					<td><fmt:formatNumber value="${(s.price*0.9)*sellStock }" type="currency"/></td> --%>
				<%-- </c:forEach> --%>
			</table>
		</div>
	</div>
	<div class="orderInfoBox">
		<div class="infoTitle">
			<h3>문곰e북 주문 정보</h3>
		</div>
		<div class="tbl_box">
			<table class="tbl_order">
				<tr class="tbl_first">
					<th colspan="2">e북정보</th>
					<th>e북금액</th>
					<th>주문 가능 수량</th>
					<th>주문 수량</th>
					<th>결제금액</th>
				</tr>
				<%-- <c:forEach var="e" items="shopingList"> --%>
				<tr>
						<tr>
					<td>이미지</td>
					<td>제목</td>
					<td>천만원</td>
					<td>오천개</td>
					<td>두개</td>
					<td>삼백원</td>
				</tr>
				<%-- </c:forEach> --%>
			</table>
		</div>
	</div>
	<div class="orderInfoBox">
		<div class="infoTitle">
			<h3>문곰템 주문 정보</h3>
		</div>
		<div class="tbl_box">
			<table class="tbl_order">
				<tr class="tbl_first">
					<th colspan="2">문곰템정보</th>
					<th>문곰템금액</th>
					<th>주문 가능 수량</th>
					<th>주문 수량</th>
					<th>결제금액</th>
				</tr>
				<%-- <c:forEach var="g" items="shopingList"> --%>
				<tr>
						<tr>
					<td>이미지</td>
					<td>제목</td>
					<td>천만원</td>
					<td>오천개</td>
					<td>두개</td>
					<td>삼백원</td>
				</tr>
				<%-- </c:forEach> --%>
			</table>
		</div>
	</div>
	<div class="orderInfoBox margin_bottom3em">
				<div class="infoTitle">
				
					<h3>결제 정보</h3>
				</div>
				<div class="tbl_box">
					<table class="tbl_payment">
						<tr class="tbl_first">
							<td>도서 금액</td>
							<td>₩7,200</td>
							<td>+</td>
							<td>배송비</td>
							<td id="delifee">₩3,000</td>
							<td>=</td>
							<td>총 </td>
							<td id="totalfee">₩10,200</td>
<%-- 							<td>도서 금액</td>
							<td><fmt:formatNumber value="${(book.price*0.9)*sellStock }" type="currency"/></td>
							<td>+</td>
							<td>배송비</td>
							<td id="delifee"><fmt:formatNumber value="3000" type="currency"/></td>
							<td>=</td>
							<td>총 </td>
							<td id="totalfee"><fmt:formatNumber value="${(book.price*0.9)*sellStock+3000 }" type="currency"/></td> --%>
						</tr>
					</table>
				</div>
			</div>
		</form>
			<div class="btnCenter">
				<button class="btnPay">결제하기</button>
			</div>
			</div>
</section>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp"/>