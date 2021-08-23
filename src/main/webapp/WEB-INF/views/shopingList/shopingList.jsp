<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<link rel="stylesheet" href="${path }/resources/css/order/layout.css">
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<style>
.giftPrice{
	width:125px;
}
.shopListHeader{
	font-weight: 800;
	font-size: 22px;
	margin-top: 20px;
}
</style>

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>

<section id="content">
<div class="wrap">
<h2 class="shopListHeader">${loginMember.memberName }님의 주문 정보</h2>	

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
				 <tr> 				 		
					<td><img src="${b.image }" alt="${b.title }"/></td>
					<td>${b.title }</td>
					<td><fmt:formatNumber value="${b.price }"  type="number"/></td>
					<td>${b.stock}</td>
					<td>${bList[status.index].getShopingListCount() }</td>
					<td class="bookPrice">
						<c:choose>
						   <c:when test="${b.stock >= bList[status.index].getShopingListCount() }">
							 <fmt:formatNumber value="${b.price*bList[status.index].getShopingListCount() }"  type="number"/>
						   	 <input type="hidden" class="bookNo" value="${b.bindNo }" name="bookNo${status.index }">
						     <input type="hidden" class="bookCount" value="${bList[status.index].getShopingListCount() }" name="bookCount${status.index }">
						   </c:when>
						   <c:otherwise>
						     <p>재고부족</p>
						   </c:otherwise>
						</c:choose>
						<button class="deleteBook" onclick="deleteBook(${b.bindNo });">삭제</button>
					</td>
				 	<c:choose>
				 	  <c:when test="${b.stock >= bList[status.index].getShopingListCount() }">
				 		<input type="hidden" value="${b.price*bList[status.index].getShopingListCount() }" class="bookP">			
				 	  </c:when>	
				 	  <c:otherwise>
				 	  	<input type="hidden" value="0" class="bookP">
				 	  </c:otherwise>
				 	</c:choose>
				 </tr> 
				</c:forEach> 			 
<%-- <td><img src="${s.image }"></td>
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
			
					<input type="hidden" class="eBookNo" value="${e.bindNo }" name="eBookNo${status.index }">				
				
					<td><img src="${e.image }" alt="${e.title }"/></td>
					<td>${e.title }</td>
					<td><fmt:formatNumber value="${e.price }"  type="number"/></td>
					<td>${e.stock }</td>
					<td>1</td>
					<td class="eBookPrice">
						<fmt:formatNumber value="${e.price }"  type="number"/>
						<button class="deleteEbook" onclick="deleteEbook(${e.bindNo});">삭제</button>
					</td>								
				 	<input type="hidden" value="${e.price }" class="eBookP">
				 	
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
			<c:forEach var="g" items="${gift }" varStatus="status">
				<tr>						
					<td><img src="${g.gift_img }"/></td>
					<td>${g.gift_title }</td>
					<td><fmt:formatNumber value="${g.gift_price }"  type="number"/></td>
					<td>${g.gift_count }</td>
					<td>${gList[status.index].getShopingListCount() }</td>					
					<td class="giftPrice">
						<c:choose>
						  <c:when test="${g.gift_count >= gList[status.index].getShopingListCount() }">
							<fmt:formatNumber value="${g.gift_price*gList[status.index].getShopingListCount()  }"  type="number"/>
						   	   	<input type="hidden" class="giftNo" value="${g.gift_no }">
							
							<input type="hidden" class="giftCount" value="${gList[status.index].getShopingListCount() }">
						  </c:when>
						  <c:otherwise>
						    <p>재고부족</p>
						  </c:otherwise>
						</c:choose>
						<button class="deleteGift" onclick="deleteGift(${g.gift_no});">삭제</button>
					</td>
					<c:choose>
						<c:when test="${g.gift_count >= gList[status.index].getShopingListCount() }">
							<input type="hidden" value="${g.gift_price*gList[status.index].getShopingListCount()  }" class="giftP">
						</c:when>
						<c:otherwise>
							<input type="hidden" value="0" class="giftP">
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach> 
			</table>
		</div>
	</div>
	
	<div class="orderInfoBox margin_bottom3em">
				<div class="infoTitle" style="display: flex; align-items: flex-end; margin-top: 1.3em; justify-content: space-between;">								  								   
					<h3>결제 정보</h3>
					<div class="deliFeeChoice">
						<!-- <input type="button" value="내 쿠폰" name="coupon" id="coupon" onclick="openWindow()"> -->
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
						</tr>
					</table>
				</div>
			</div>
				<div class="btnCenter">
					<button class="btnPay">결제하기</button>
				</div>

		</div>
</section>
<!-- 주문자 -->
<input type="hidden" value="${loginMember.memberId }" id="loginMemberId">
<input type="hidden" id="contextPath" value="${path }">
<input type="hidden" id="originPrice" value="">
<input type="hidden" id="deliveryFee" value="">
<input type="hidden" id="totalPrice" value="">
<input type="hidden" id="op" value="">

<script>
let dBook = document.getElementsByClassName("deleteBook");
let bookNo = document.getElementsByClassName("bookNo");

let dEbook = document.getElementsByClassName("deleteEbook");
let eBookNo = document.getElementsByClassName("eBookNo");

let dGift = document.getElementsByClassName("deleteGift");
let giftNo = document.getElementsByClassName("giftNo");

let loginMember = document.getElementById("loginMemberId").value;
let contextPath = document.getElementById("contextPath").value;

function deleteBook(bookNo){

	$.ajax({
			url: contextPath + "/shopingList/deleteBook.do",
			type: "POST",
			data: {
				bookNo: bookNo,
				memberId: loginMember
			},
			success: data =>{
				alert("삭제되었습니다.");
				window.location.reload();
			}		
		})
	}

function deleteEbook(eBookNo){

	$.ajax({
			url: contextPath + "/shopingList/deleteEbook.do",
			type: "POST",
			data: {
				eBookNo: eBookNo,
				memberId: loginMember
			},
			success: data =>{
				alert("삭제되었습니다.");
				window.location.reload();
			}		
		})
	}

function deleteGift(giftNo){

	$.ajax({
			url: contextPath + "/shopingList/deleteGift.do",
			type: "POST",
			data: {
				giftNo: giftNo,
				memberId: loginMember
			},
			success: data =>{
				alert("삭제되었습니다.");
				window.location.reload();
			}		
		})
	}	
</script>

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
	let totalPrice = document.getElementById("totalPrice");
	let deliveryFee = document.getElementById("deliveryFee");
	
	let set = document.getElementById("set");
	
	let deliFee = document.getElementById("delifee");
	let html = "<fmt:formatNumber value='3000' type='currency'/>";
	let html2 = "<fmt:formatNumber value='0' type='currency'/>";
	let advance = document.getElementById("advance");
	let later = document.getElementById("later");
	
	for(b=0;b<bookPriceLength;b++){
		bTotal+=Number(bookPrice[b].value);
	}
	for(e=0;e<eBookPriceLength;e++){	
		eTotal+=Number(eBookPrice[e].value);
	} 
	for(g=0;g<giftPriceLength;g++){
		gTotal+=Number(giftPrice[g].value);
	}
	
	 let total = bTotal+eTotal+gTotal;
	 
	 op.value=total;
	 
	 originPrice.value=total;
	 originPrice.innerText="₩"+total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	 
	 let total3000 = total+3000;
	 
	 deliFee.innerText = html;
	 totalFee.innerText = "₩"+total3000.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	 totalPrice.value = total3000;
	 deliveryFee.value = Number(3000);
	 
	 advance.addEventListener('click', ()=>{
		 deliFee.innerText = html;
		 totalFee.innerText = "₩"+total3000.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		 totalPrice.value = total3000;
		 deliveryFee.value = Number(3000);
	 })
	 
	 later.addEventListener('click', ()=>{
		 deliFee.innerText = html2;
		 totalFee.innerText = "₩"+total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		 totalPrice.value = total;
		 deliveryFee.value = Number(0);
	 }) 
	 
	  function openWindow(){
    	let memberId=document.getElementById("loginMemberId").value;
    	console.log(memberId);
    	window.name="쿠폰함";
    	window.open("<c:url value='/gift/myCoupon.do?memberId="+memberId+"'/>",'myCoupon','width=800, height=700, location=no, status=no, scrollbars=yes');
    }
	 
</script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="${path}/resources/js/shopingList/shopingListBuy.js"></script>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"/>
