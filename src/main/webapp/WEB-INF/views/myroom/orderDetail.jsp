<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<link rel="stylesheet" href="${path }/resources/css/order/layout.css">
<link rel="stylesheet" href="${path }/resources/css/myroom/layout.css">
<style>
.shopListHeader {
	font-weight: 800;
	font-size: 22px;
	margin-top: 20px;
}
</style>

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="title" value="" />
		</jsp:include>
		<div class="myroom_contents">
			<h2 class="shopListHeader">주문 정보 : ${order.orderNo }</h2>
			<c:if test="${not empty order.getBookOrderList()}">
				<div class="orderInfoBox">
					<div class="infoTitle">
						<h3>문곰도서 주문 정보</h3>
					</div>
					<div class="tbl_box">
						<table class="tbl_order">
							<tr class="tbl_first">
								<th colspan="2">도서정보</th>
								<th class="fs8 width10p">도서금액</th>
								<th class="fs8 width10p">결제날짜</th>
								<th class="fs8 width10p">주문수량</th>
								<th class="fs8 width10p">결제금액</th>
							</tr>
							<c:forEach var="b" items="${order.getBookOrderList() }"
								varStatus="status">
								<tr>
									<td><img src="${b.image }" alt="${b.title }" /></td>
									<td>${b.title }</td>
									<td><fmt:formatNumber value="${b.price }" type="number" /></td>
									<td>${order.getOrderDate()}</td>
									<td>${b.orderVolume }</td>
									<td class="bookPrice"><fmt:formatNumber
											value="${b.price }" type="number" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty order.getEbookOrderList()}">
				<div class="orderInfoBox">
					<div class="infoTitle">
						<h3>문곰e북 주문 정보</h3>
					</div>
					<div class="tbl_box">
						<table class="tbl_order">
							<tr class="tbl_first">
								<th colspan="2">e북정보</th>
								<th class="fs8 width10p">e북금액</th>
								<th class="fs8 width10p">결제날짜</th>
								<th class="fs8 width10p">주문수량</th>
								<th class="fs8 width10p">결제금액</th>
							</tr>
							<c:forEach var="e" items="${order.getEbookOrderList() }"
								varStatus="status">
								<tr>
									<input type="hidden" class="eBookNo" value="${e.bindNo }"
										name="eBookNo${status.index }">
									<td><img src="${e.image }" alt="${e.title }" /></td>
									<td>${e.title }</td>
									<td><fmt:formatNumber value="${e.price }" type="number" /></td>
									<td>${order.getOrderDate()}</td>
									<td>1</td>
									<td class="eBookPrice"><fmt:formatNumber
											value="${e.price }" type="number" /></td>
									<input type="hidden" value="${e.price }" class="eBookP">
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty order.getGiftOrderList() }">
				<div class="orderInfoBox">
					<div class="infoTitle">
						<h3>문곰템 주문 정보</h3>
					</div>
					<div class="tbl_box">
						<table class="tbl_order">
							<tr class="tbl_first">
								<th colspan="2">문곰템정보</th>
								<th class="fs8 width10p">문곰템금액</th>
								<th class="fs8 width10p">결제날짜</th>
								<th class="fs8 width10p">주문수량</th>
								<th class="fs8 width10p">결제금액</th>
							</tr>
							<c:forEach var="g" items="${order.getGiftOrderList() }"
								varStatus="status">
								<tr>
									<td><img src="${g.gift_img }" /></td>
									<td>${g.gift_title }</td>
									<td><fmt:formatNumber value="${g.gift_price }"
											type="number" /></td>
									<td>${order.getOrderDate() }</td>
									<td>${g.orderVolume }</td>
									<td class="giftPrice"><fmt:formatNumber
											value="${g.gift_price }" type="number" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</c:if>
			<div class="orderInfoBox margin_bottom3em">
				<div class="tbl_box">
					<form id="refundtable">
					<table class="tbl_payment" >
						<tr class="tbl_first">
							<td>합산 금액</td>
							<td id="originPrice">${order.getPaidAmount() }</td>
							<td></td>
							<td>적립금</td>
							<td id="delifee">${order.getOrderPoint() }</td>
							<td>쿠폰사용</td>
							<c:if test="${order.orderCouponNo != 0 }">
								<td>${order.orderCouponNo }</td>
							</c:if>
							<c:if test="${order.orderCouponNo == 0 }">
								<td>X</td>
							</c:if>
							<td id="totalfee"></td>
						</tr>
					</table>
<%-- 						<input type="hidden" name="impUid" value="${Payment.paymentId }"/>
						<input type="hidden" name="memberId" value="${loginMember.memberId }"/>
						<input type="hidden" name="bindNo" value="${order.bindNo  }"/> --%>
					</form>
				</div>
			</div>
			<div class="btnCenter">
				<button id="refund" class="btnPay">환불하기</button>
			</div>

		</div>
	</div>
</div>
</div>
<script>
/* let refund=document.getElementById('refund');
let refundtable=document.getElementById('refundtable');
refund.addEventListener('click',function(){
	refundtable.attr("action","${path}/SellbookController/cancelPayment.do");
	refundtable.submit();
}); */

</script>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>