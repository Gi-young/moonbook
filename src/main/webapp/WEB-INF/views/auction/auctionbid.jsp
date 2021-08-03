<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  
  <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<form action="${path }/auction/auctionbidEnd" onsubmit="return check();">
${auction }
<div>
	<div>
	<h2>경매정보</h2>
	<input type="hidden" value="${auction.auctionNo }" name="auctionNo">
	<input type="hidden" value="${ auction.auctionName }" name="auctionName">
	<span>판매자 아이디</span>	<input type="text" value="${auction.memberId }" readonly="readonly" id="seller"> <br>

	<span>시작 금액</span>	<fmt:formatNumber value="${auction.startPrice }" type="currency"/> <br>
	<input type="hidden" value="${auction.startPrice }" readonly="readonly" >
	<span>즉시 구매가</span><fmt:formatNumber value="${auction.buyNow }" type="currency"/> <br>
	<input type="hidden" value="${auction.buyNow }" readonly="readonly" >
	</div>
		<div>
		<h2>입찰 기록</h2>
	<table>		
	
			
	 <c:forEach items="${auction.auctionbid }" var="bid" varStatus="vs">
	 <c:if test="${vs.first }">
	 	<input type="hidden" value="${bid.bidId }" id="bidid2">
	 	<tr style="font-size: 20px;
    font-weight: bold;">
			<td>${bid.bidId }님</td>
			<td>${bid.bidPrice }</td>
			<td>최고입찰자</td>
		</tr>
		<tr>
			<th colspan="2">입찰기록</th>
		</tr>
			<tr>
					<th>아이디</th>
					<th>입찰 금액</th>
			</tr>
	  </c:if>
	 	<tr>
			<td>${bid.bidId }</td>
			<td>${bid.bidPrice }</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	<div>
	<h2>입찰서</h2>
	<span>구매자 아이디</span>	<input type="text" value="${loginMember.memberId }" readonly="readonly" name="bidId" id="bidid"><br>
	<span>내 경매 포인트</span>	<fmt:formatNumber value="${loginMember.memberPoint }" type="currency"/>
	<input type="hidden" value="${loginMember.memberPoint }" readonly="readonly" id="point"> <br>
	<span>입찰 금액</span>		<input type="number" value="${auction.startPrice }" step="${auction.priceUnit }" id="bid" name="bidPrice"><br>
	</div>
	<input type="submit" value="입찰하기">
	<br>

	
</div>
</form>

<script>
console.log($("#point").val())
console.log($("#bid").val())
 const check=()=>{
	 if($("#bidid").val()==$("#seller").val()){
		 alert("자신이 올린 물품입니다.")
		 return false;
	 }

	 
	 if($("#bidid").val()==$("#bidid2").val()){
		 alert("이미 최고 입찰자입니다.")
		 return false;
	 }else if($("#point").val()<$("#bid").val()){
		 alert("포인트가 부족합니다")
		 return false;
	 }
 }

</script>