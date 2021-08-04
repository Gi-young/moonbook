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
							<th>주문자</th>
							<td><input type="text" name="memberName"></td>
							<td><input type="hidden" name="memberId" value="${loginMemberId }"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" name="memberEmail"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" name="memberPhone"></td>
						</tr>
						<tr>
							<th>배송지</th>
							<td><input type="radio" id="oldAddress" name="memberAddress" checked><label
								for="oldAddress">기존주소</label> <input type="radio"
								id="newAddress" name="memberAddress"><label for="newAddress">새주소</label></td>
						</tr>
						<tr>
							<th>받는 분</th>
							<td><input type="text" name="" id="deliName"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" name="" id="deliAddress"></td>
						</tr>
						<tr>
							<th>배송 연락처</th>
							<td><input> <input type="radio" id="phone" name=""><label
								for="phone">주문자와 동일</label></td>
						</tr>
						<tr class="tbl_last">
							<th>주문 요청사항</th>
							<td><input type="text" name=""></td>
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
							<td><input></td>
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
							<th>결제금액</th>
							<th>배송비</th>
						</tr>
						<tr>
							<td>상품이미지</td>
							<td><div>카테고리</div>
								<div>상품이름</div></td>
							<td>30000원</td>
							<td>1개</td>
							<td>30000원</td>
							<td rowspan="99" class="tbl_row2">3000원</td>
						</tr>
						<tr>
							<td>상품이미지</td>
							<td><div>카테고리</div>
								<div>상품이름</div></td>
							<td>30000원</td>
							<td>1개</td>
							<td>30000원</td>
						</tr>
						<tr class="tbl_last">
							<td>상품이미지</td>
							<td><div>카테고리</div>
								<div>상품이름</div></td>
							<td>30000원</td>
							<td>1개</td>
							<td>30000원</td>
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
							<td>총 결제 금액</td>
							<td>+</td>
							<td>배송비</td>
							<td>=</td>
							<td>최종 결제 금액</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="btnCenter">
				<button class="btnPay">결제하기</button>
			</div>
		</form>
	</div>
</div>
<script>
$("input[name=memberAddress]").change(e=>{
	console.log(e.target);
	let targetId = e.target.id;
	if(targetId == "newAddress"){
		$("#deliName").val("");
		$("#deliAddress").val("");
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
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>