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
				  	
				<c:forEach var="b" items="${book }" varStatus="status">			
				 <c:set var="bc" value="${book[status.end] }"/>
				 <c:out value="${bc }"/>
				 <tr> 
					<td><img src="${b.image }" alt="${b.title }"/></td>
					<td>${b.title }</td>
					<td><fmt:formatNumber value="${b.price }"  type="number"/></td>
					<td>${b.stock}</td>
					<td>${bList[status.index].getShopingListCount() }</td>
					<td class="bookPrice"><fmt:formatNumber value="${b.price*bList[status.index].getShopingListCount() }"  type="number"/></td>
				 	<input type="hidden" value="${b.price*bList[status.index].getShopingListCount() }" class="bookP">			
				 </tr> 
				</c:forEach> 
					<p>${bTotal }</p>			
					<p>${bookP }</p>			 
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
			  <c:forEach var="e" items="${eBook }" varStatus="status">						
				<tr>
					<td><img src="${e.image }" alt="${e.title }"/></td>
					<td>${e.title }</td>
					<td><fmt:formatNumber value="${e.price }"  type="number"/></td>
					<td>${e.stock }</td>
					<td>1</td>
					<td class="eBookPrice"><fmt:formatNumber value="${e.price }"  type="number"/></td>				
				 	<input type="hidden" value="${e.price }" class="eBookP">
				</tr>
			  </c:forEach>
				 <p>${eBookP }</p>				
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
			<c:forEach var="g" items="${gift }" varStatus="status">
				<tr>
					<td><img src="${g.gift_img }"/></td>
					<td>${g.gift_title }</td>
					<td><fmt:formatNumber value="${g.gift_price }"  type="number"/></td>
					<td>${g.gift_count }</td>
					<td>${gList[status.index].getShopingListCount() }</td>
					<td class="giftPrice"><fmt:formatNumber value="${g.gift_price*gList[status.index].getShopingListCount()  }"  type="number"/></td>
					<input type="hidden" value="${g.gift_price*gList[status.index].getShopingListCount()  }" class="giftP">
				</tr>
			</c:forEach> 
			</table>
		</div>
	</div>
	
	<div class="orderInfoBox margin_bottom3em">
				<div class="infoTitle" style="display: flex; align-items: flex-end; margin-top: 1.3em; justify-content: space-between;">								  								   
					<h3>결제 정보</h3>
					<div class="deliFeeChoice">
						<input type="radio" value="advance" name="delifee" id="advance" checked/>
						<label for="advance">선불</label>
						<input type="radio" value="later" name="delifee" id="later"/>
						<label for="later">착불</label>
					</div>
				</div>
				<div class="tbl_box">
					<table class="tbl_payment">
						<tr class="tbl_first">
							<td>합산 금액</td>
							<td id="originPrice"></td>
							<td>+</td>
							<td>배송비</td>
							<td id="delifee"></td>
							<td>=</td>
							<td>총 </td>
							<td id="totalfee"></td>
						<%-- <td>도서 금액</td>
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
<div id="set">
</div>
<input type="hidden" value="0" id="op">
<script>
	let bookPriceLength = document.getElementsByClassName("bookP").length;
	let bookPrice = document.getElementsByClassName("bookP");
	let bTotal = 0;
	
	let eBookPriceLength = document.getElementsByClassName("eBookP").length;
	let eBookPrice = document.getElementsByClassName("eBookP");
	let eTotal = 0;	
	
	let giftPriceLength = document.getElementsByClassName("giftP").length;
	let giftPrice = document.getElementsByClassName("giftP");
	let gTotal = 0;

	let op = document.getElementById("op");
	let originPrice = document.getElementById("originPrice");
	let totalFee = document.getElementById("totalfee");
	
	let set = document.getElementById("set");
	
	let deliFee = document.getElementById("delifee");
	let html = "<fmt:formatNumber value='3000' type='currency'/>";
	let html2 = "<fmt:formatNumber value='0' type='currency'/>";
	let advance = document.getElementById("advance");
	let later = document.getElementById("later");
	
	for(b=0;b<bookPriceLength;b++){
		//console.log(bookPrice[b].value);
		//console.log(bTotal+=Number(bookPrice[b].value));
		bTotal+=Number(bookPrice[b].value);
	}
	 //console.log(bTotal);
	
	for(e=0;e<eBookPriceLength;e++){
		//console.log(eBookPrice[e].value);
		//console.log(eTotal+=Number(eBookPrice[e].value));
		eTotal+=Number(eBookPrice[e].value);
	}
	 //console.log(eTotal);
	 
	for(g=0;g<giftPriceLength;g++){
		//console.log(giftPrice[g].value);
		//console.log(gTotal+=Number(giftPrice[g].value));
		gTotal+=Number(giftPrice[g].value);
	}
	 //console.log(gTotal);
	 let total = bTotal+eTotal+gTotal;
	 //console.log(total);
	 op.value=total;
	 //console.log(op.value);
	 //console.log(typeof(`${'${total}'}`));
	 originPrice.value=total;
	 originPrice.innerText="₩"+total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	 
	 let total3000 = total+3000;
	 
	 deliFee.innerText = html;
	 totalFee.innerText = "₩"+total3000.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	 advance.addEventListener('click', ()=>{
		 deliFee.innerText = html;
		 totalFee.innerText = "₩"+total3000.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	 })
	 later.addEventListener('click', ()=>{
		 deliFee.innerText = html2;
		 totalFee.innerText = "₩"+total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	 }) 
	 console.log(deliFee);
	 
	
	 
</script>
<%-- <script src="${path}/resources/js/shopingList/shopingListBuy.js"></script>  --%>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"/>
