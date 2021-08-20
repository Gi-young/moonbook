<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%-- <c:set var="FmtTotalPrice" value="${(book.price*0.9)*sellStock+3000 }" /> --%>

<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<link rel="stylesheet" href="${path }/resources/css/order/layout.css">
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<%-- <jsp:include page="/WEB-INF/views/sellpart/stickymenu/stickybook.jsp">
<jsp:param name="" value=""/>
</jsp:include> --%>
<div class="wrap">
	<div class="orderHead">
		<h1 class="">주문/결제</h1>
	</div>
	<div class="container margin_bottom3em">
		<form action="#">
			<div class="orderInfoBox">
				<div class="infoTitle">
					<h3>배송 정보</h3>
				</div>
				<div class="tbl_box">
					<table class="tbl_deli">
						<tr class="tbl_first">
							<th>주문하신 분</th>
							<td><input type="text" name="memberName" value="${loginMember.memberName }" readOnly></td>
							<td><input type="hidden" name="memberId" value="${loginMember.memberId }" readOnly></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" name="memberEmail" value="${loginMember.memberEmail }" readOnly></td>
						</tr>
						<tr>
							<th>보내는 분</th>
							<td><input type="radio" id="oldAddress" name="memberAddress" checked><label
								for="oldAddress">기존주소</label> 
								<input type="radio"	id="newAddress" name="memberAddress"><label for="newAddress">새주소</label><br><br>							
							<input type="text" name="" id="deliAddress" value="${loginMember.memberAddress }"></td>
							<!-- <td><input type="hidden" name="" id="deliAddressMy2" value="보내는 분의 주소를 입력해 주세요" ></td> -->
						</tr>
						<tr>
							<th>보내는 분 연락처</th>
							<td><input type="text" name="memberPhone" value="${loginMember.memberPhone }" readOnly></td>
						</tr>
						<tr>
							<th>받는 분</th>
							<td><input type="radio" id="sender" name="senderSender" checked><label
								for="sender">나에게 보내기</label> 
								<input type="radio" id="other" name="senderSender"><label for="other">다른사람에게 보내기</label><br><br>
								<input type="text" name="" id="deliAddressSender" value="${loginMember.memberAddress }"></td>
						</tr>
						
						
						<tr>
							<th>받는 분 연락처</th>
							<td><input type="checkbox" id="phone" name="samePhone" checked><label
								for="phone">주문자와 동일</label><br><br>
								<input type="text" id="senderPhone" value="${loginMember.memberPhone }"> </td>
						</tr>
						<tr class="tbl_last">
							<th>주문시 요청사항</th>
							<td><textarea cols="46" rows="3" name="" placeholder="주문시 요청사항을 입력하세요." style="resize:none;"></textarea></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="orderInfoBox">
				<div class="infoTitle">
					<h3>배송 방법 선택</h3>
				</div>
				<div class="tbl_box">
					<table class="tbl_deli">
						<tr class="tbl_first">
							<th rowspan="2" class="tbl_row2">배송방법</th>
							<td><input type="radio" id="pre" name="deliMethod" checked><label
								for="pre">선불</label> <input type="radio" id="after" name="deliMethod">
								<label for="after">착불</label></td>
						</tr>
						<tr>
							<td id="preMsg">배송비는 <fmt:formatNumber value="3000" type="currency"/>입니다.</td>
							<td id="afterMsg" style="display:none">착불. 배송비 <fmt:formatNumber value="0" type="currency"/></td>
						</tr>
						<tr class="tbl_last">
							<th>배송요청사항</th>
							<td><textarea cols="46" rows="3" name="" placeholder="배송시 요청사항을 입력하세요." style="resize:none;"></textarea></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="orderInfoBox">
				<div class="infoTitle">
					<h3>주문 상품 정보</h3>
				</div>
				<div class="tbl_box">
					<table class="tbl_order">
						<tr class="tbl_first">
							<th colspan="2">상품정보</th>
							<th>상품금액</th>
							<th>주문 가능 수량</th>
							<th>주문 수량</th>
							<th>결제금액</th>
						</tr>
						<tr>
							<td><img src="${gift.gift_img }"></td>
							<td>${gift.gift_title }</td>
							<td><fmt:formatNumber value="${gift.gift_price }" type="currency"/></td>
							<td>${gift.gift_count } 개</td>
							<td>${quan } 개</td>
							
							<td><fmt:formatNumber value="${(gift.gift_price)*quan }" type="currency"/></td>
							
						</tr>

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
						<c:choose>
							<c:when test="${couponNo == 0}">
								<td>상품 금액</td>
								<td><fmt:formatNumber value="${(gift.gift_price)*quan }" type="currency"/></td>
							</c:when>	
							<c:otherwise>
								<td>쿠폰 적용 금액</td>
								<td><fmt:formatNumber value="${(gift.gift_price)*quan-couponAmount }" type="currency"/></td>
							</c:otherwise>
						</c:choose>	
							<td>+</td>
							<td>배송비</td>
							<td id="delifee"><fmt:formatNumber value="3000" type="currency"/></td>
							<td>=</td>
						<c:choose>
							<c:when test="${couponNo == 0}">
								<td>총 </td>
								<td id="totalfee"><fmt:formatNumber value="${(gift.gift_price)*quan+3000 }" type="currency"/></td>
							</c:when> 
							<c:otherwise>
								<td>총 </td>
								<td id="totalfee"><fmt:formatNumber value="${(gift.gift_price)*quan+(3000-couponAmount) }" type="currency"/></td>
							</c:otherwise>
						</c:choose>
						</tr>
					</table>
				</div>
			</div>
		</form>
			<div class="btnCenter">
				<button class="btnPay">결제하기</button>
			</div>
	</div>
</div>
<div id=divhidden>
</div>
<%-- <input type="hidden" id="totalPrice" value="${(book.price*0.9)*sellStock+3000 }"> --%>
<input type="hidden" id="loginMember" value="${loginMember.memberId}">
<input type="hidden" id="sellStock" value="${gift.gift_count}"> 
<!-- 주문가능수량 -->
<input type="hidden" id="stock" value="${quan }">
<!-- 주문수량 -->
<c:choose>
	<c:when test="${couponNo == 0 }">
		<input type="hidden" id="originPrice" value="${(gift.gift_price) }">
	</c:when>
	<c:otherwise>
		<input type="hidden" id="originPrice" value="${(gift.gift_price)-couponAmount }">
	</c:otherwise>
</c:choose>
<input type="hidden" id="contextPath" value="${path }">
<input type="hidden" id="deliveryFee" value="3000">
<input type="hidden" id="giftNo" value="${gift.gift_no }">
<input type="hidden" id="deliveryFee" value="">
<input type="hidden" id="couponNo" value="${couponNo }">
<input type="hidden" id="couponAmount" value="${couponAmount }">
<script>
let couponAm = document.getElementById("couponAmount").value;

let html = "<fmt:formatNumber value='3000' type='currency'/>";
let html2 = "<fmt:formatNumber value='0' type='currency'/>";

let divHidden = document.getElementById("divhidden");

let deliFee = document.getElementById("deliveryFee");
var tp = document.createElement("input");
tp.setAttribute("type","hidden");
tp.setAttribute("id","totalPrice2");
if(couponAm != 0){
	tp.value="<fmt:formatNumber value='${(gift.gift_price)*quan+(3000-couponAmount) }' type='currency'/>";

}else{
	tp.value="<fmt:formatNumber value='${(gift.gift_price)*quan+3000 }' type='currency'/>";	
	console.log(tp.value);
}

divHidden.appendChild(tp);

$("input[id=pre]").click(e=>{
	//tp.value="";
	var tp = document.createElement("input");
	tp.setAttribute("type","hidden");
	tp.setAttribute("id","totalPrice2");
	
	if(couponAm != 0){
		tp.value="<fmt:formatNumber value='${(gift.gift_price)*quan+(3000-couponAmount)}' type='currency'/>";
		
	}else{		
		tp.value="<fmt:formatNumber value='${(gift.gift_price)*quan+3000 }' type='currency'/>";
	}	
	
	divHidden.appendChild(tp);
	
	document.getElementById("totalPrice2").remove();
	document.getElementById("delifee").innerHTML=html;
	document.getElementById("totalfee").innerHTML=tp.value;	
	


	deliFee.value=3000;
});

$("input[id=after]").click(e=>{
	console.log();
	
	var tp = document.createElement("input");
	tp.setAttribute("type","hidden");
	tp.setAttribute("id","totalPrice2");
	if(couponAm != 0){
		tp.value="<fmt:formatNumber value='${(gift.gift_price)*quan-couponAmount}' type='currency'/>";
	}else{		
		tp.value="<fmt:formatNumber value='${(gift.gift_price)*quan }' type='currency'/>";
	}	
	document.getElementById("delifee").innerHTML=html2;
	document.getElementById("totalfee").innerHTML=tp.value;

	divHidden.appendChild(tp);
	

	deliFee.value=0;
});


	$("input[id=phone]").change(e=>{	
	console.log(e.target);
	if ($("input:checkbox[id='phone']").is(":checked")){
		$("#senderPhone").attr("value","${loginMember.memberPhone}");

		}else{
			$("#senderPhone").attr("value","");
			$("#senderPhone").attr("placeholder","연락처를 입력하세요");
			$("#senderPhone").focus();
			
		}
	})
$("input[name=senderSender]").change(e=>{
	console.log(e.target);
	let targetId = e.target.id;
	if(targetId == "sender"){
		$("#deliAddressSender").attr("value","${loginMember.memberAddress }");
	}else{
		$("#deliAddressSender").attr("value","");
		$("#deliAddressSender").attr("placeholder","주소를 입력하세요");
		$("#deliAddressSender").focus();
	}
	
	
	
	
})
$("input[name=memberAddress]").change(e=>{
	console.log(e.target);
	let targetId = e.target.id;

	if(targetId == "oldAddress"){
		$("#deliAddress").attr("value","${loginMember.memberAddress}");
		/* $("#oldAddress").attr("readonly",""); */
		
	}else{ 
			$("#deliAddress").attr("value","");
			$("#deliAddress").attr("placeholder","주소를 입력하세요");
			$("#deliAddress").focus();
	}
		
})

$("input[name=deliMethod]").change(e=>{

	let targetId = e.target.id;

	if(targetId == "pre"){
		$("#preMsg").css("display", "block");
		$("#afterMsg").css("display", "none");
	}else{
		$("#preMsg").css("display", "none");
		$("#afterMsg").css("display", "block");		
	}
})
</script>

<script>
let couponAm2 = document.getElementById("couponAmount").value;

let divHidden2 = document.getElementById("divhidden");


var tp2 = document.createElement("input");
tp2.setAttribute("type","hidden");
tp2.setAttribute("id","totalPrice");
if(couponAm2 != 0){
	tp2.value="${(gift.gift_price)*quan+(3000-couponAmount) }";

}else{
	tp2.value="${(gift.gift_price)*quan+3000 }";	
	console.log(tp2.value);
}
divHidden2.appendChild(tp2);

$("input[id=pre]").click(e=>{
	
	document.getElementById("totalPrice").remove();
	var tp2 = document.createElement("input");
	tp2.setAttribute("type","hidden");
	tp2.setAttribute("id","totalPrice");
	if(couponAm2 != 0){
		tp2.value="${(gift.gift_price)*quan+(3000-couponAmount)}";
		
	}else{		
		tp2.value="${(gift.gift_price)*quan+3000 }";
	}
	divHidden2.appendChild(tp2);
})
	

$("input[id=after]").click(e=>{
		
	document.getElementById("totalPrice").remove();
	var tp2 = document.createElement("input");
	tp2.setAttribute("type","hidden");
	tp2.setAttribute("id","totalPrice");
	if(couponAm2 != 0){
		tp2.value="${(gift.gift_price)*quan-couponAmount}";
	
	}else{		
		tp2.value="${(gift.gift_price)*quan }";
	}
	divHidden2.appendChild(tp2);
	
})
		
</script>



<%System.out.println("test : " + session.getAttribute("loginMember")); %>



<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="${path}/resources/js/gift/gift_buy.js"></script> 

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>