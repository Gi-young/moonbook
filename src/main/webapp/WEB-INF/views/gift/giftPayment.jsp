<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<link rel="stylesheet" href="${path }/resources/css/order/layout.css">
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
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
							<td id="preMsg">배송비는 3000원입니다.</td>
							<td id="afterMsg" style="display:none">착불. 배송비 0원</td>
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
							<th>수량</th>
							<th>주문 가능 수량</th>
							<th>결제금액</th>
							<th>배송비</th>
						</tr>
						<tr>
							<td><img src="${gift.gift_img}" style="width: 82px; height: 82px;"></td>
							<td>${gift.gift_title }</td>
							<td><fmt:formatNumber value="${gift.gift_price }" type="currency"/></td>
							<td>${quan } 개</td>
							<input type="hidden" value="${quan }" name="sellStock" id="sellStock">
							<td>${gift.gift_count } 개</td>
							<td><fmt:formatNumber value="${gift.gift_price*quan }" type="currency"/></td>
							<td rowspan="99" class="tbl_row2"><fmt:formatNumber value="3000" type="currency"/>원</td>
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
							<td>도서 금액</td>
							<td><fmt:formatNumber value="${gift.gift_price*quan }" type="currency"/>원</td>
							<td>+</td>
							<td>배송비</td>
							<%-- <fmt:formatNumber value="" type="currency"/> --%>
 							<td><fmt:formatNumber value="3000" type="currency"/>원</td>
							<td>=</td>
							<td>총 </td>				
							<td><fmt:formatNumber value="${(gift.gift_price*quan)+3000 }" type="currency" />원</td>
							<input type="hidden" value="${(gift.gift_price*quan)+3000 }" name="totalPrice" id="totalPrice">
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
<script>
/* 	let samePhone = $("input:checkbox[name=samePhone]");
	if(!$(samePhone) == true) {
		$("#senderPhone").attr("value","${loginMember.memberPhone}");
	}else{
		$("#senderPhone").attr("value","연락처를 입력하세요");
	} */
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
	/*if(targetId == "newAddress"){
		$("#deliName").val("");
		$("#deliAddress").val("");*/
		
	/* if(targetId == "deliAddressMy"){
		$("#deliAddressMy").attr("type","text");
		$("#deliAddressMy2").attr("type","hidden");
	}	else{
		$("#deliAddressMy").attr("type","hidden");
		$("#deliAddressMy2").attr("type","text");
	} */
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
	console.log(e.target.id);
	let targetId = e.target.id;
	console.log(typeof(targetId));
	if(targetId == "pre"){
		$("#preMsg").css("display", "block");
		$("#afterMsg").css("display", "none");
	}else{
		$("#preMsg").css("display", "none");
		$("#afterMsg").css("display", "block");		
	}
})
</script>


<input type="hidden" id="loginMember" value="${loginMember.memberId}">
<input type="hidden" id="sellStock" value="${sellStock}">
<input type="hidden" id="bookPrice09" value="${(book.price * 0.9) }">
<input type="hidden" id="totalPrice" value="${(book.price*0.9)*sellStock+3000 }">
<input type="hidden" id="deliveryFee" value="3000">


<%System.out.println("test : " + session.getAttribute("loginMember")); %>

<input type="hidden" id="contextPath" value="${path }">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="${path}/resources/js/gift/gift_buy.js"></script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>