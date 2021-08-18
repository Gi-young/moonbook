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
		<c:set var="totalP" value="0"/>
		<div class="tbl_box">
			<table class="tbl_order">
				<tr class="tbl_first">
					<th colspan="2">도서정보</th>
					<th>도서금액</th>
					<th>주문 가능 수량</th>
					<th>주문 수량</th>
					<th>결제금액</th>
				</tr>
			
				<c:set var="bCount" value="0"/>
				<c:set var="bPrice" value="0"/>	
				<c:set var="bookNo" value=""/>	
			  	<c:forEach var="bs" items="${bList }">
			  		<c:set var="bCount" value="${bs.shopingListCount }"/>
			  		<c:set var="bookNo" value="${bs.bindNoB }"/>
			  	</c:forEach>
			  	<c:out value="${bCount }"/>
			  	<c:out value="${bookNo }"/>
				<c:forEach var="b" items="${book }">
				 <tr> 
					<td><img src="${b.image }" alt="${b.title }"/></td>
					<td>${b.title }</td>
					<td>${b.price*b.stock }</td>
					<td>${b.stock }</td>
					<td>${paramB } 주문수량</td>
					<td class="bookPrice"></td>
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
			  <c:set var="ePrice" value="0"/>		
			  <c:forEach var="es" items="${eList }">
			  	
			  </c:forEach>	
			  <c:forEach var="e" items="${eBook }">						
				<tr>
					<td><img src="${e.img }" alt="${e.title }"/></td>
					<td>${e.title }</td>
					<td>${e.price }</td>
					<td>${e.stock }</td>
					<td></td>
					<td class="eBookPrice">${e.price }</td>
				</tr>
			  </c:forEach>
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
			<c:set var="gPrice" value="0"/>		
			<c:forEach var="gs" items="${gList }">
			  	
			</c:forEach>	
			<c:forEach var="g" items="${gift }">
				<tr>
					<td><img src="${g.gift_img }"/></td>
					<td>${g.gift_title }</td>
					<td><fmt:formatNumber value="${g.gift_price }"  type="number"/></td>
					<td>${g.gift_count }</td>
					<td></td>
					<td class="giftPrice">${g.gift_price }</td>
				</tr>
			</c:forEach> 
			</table>
		</div>
	</div>
	
	<div class="orderInfoBox margin_bottom3em">
				<div class="infoTitle" style="display: flex; align-items: flex-end; margin-top: 1.3em; justify-content: space-between;">								  								   
					<h3>결제 정보</h3>
					<div class="deliFeeChoice">
						<input type="radio" value="advance" name="delifee" id="advance"/>
						<label for="advance">선불</label>
						<input type="radio" value="later" name="delifee" id="later"/>
						<label for="later">착불</label>
					</div>
				</div>
				<div class="tbl_box">
					<table class="tbl_payment">
						<tr class="tbl_first">
							<td>합산 금액</td>
							<td>${totalP }</td>
							<td>+</td>
							<td>배송비</td>
							<td id="delifee"></td>
							<td>=</td>
							<td>총 </td>
							<td id="totalfee"><fmt:formatNumber value="" type="number"/></td>
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

<script src="${path}/resources/js/shopingList/shopingListBuy.js"></script> 
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"/>
