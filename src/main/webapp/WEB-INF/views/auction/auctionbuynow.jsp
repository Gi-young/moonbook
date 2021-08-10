<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  
  <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<form action="${path }/auction/auctionbuynowEnd" onsubmit="return check();">
${auction }
<div>
	<div>
	<h2>경매정보</h2>
	<input type="hidden" value="${auction.auctionNo }" name="auctionNo">
	<input type="hidden" value="${ auction.auctionName }" name="auctionName">
	<span>판매자 아이디</span>	<input type="text" value="${auction.memberId }" readonly="readonly" id="seller"> <br>
	<span>즉시 구매가</span><fmt:formatNumber value="${auction.buyNow }" type="currency"/> <br>
	<input type="hidden" value="${auction.buyNow }" readonly="readonly" name="bidPrice">
	</div>

	<div>
	<h2>바로 구매</h2>
	<span>구매자 아이디</span>	<input type="text" value="${member.memberId }" readonly="readonly" name="bidId" id="bidid"><br>
	<span>내 경매 포인트</span>	<fmt:formatNumber value="${member.memberPoint }" type="currency"/>
	<input type="hidden" value="${loginMember.memberPoint }" readonly="readonly" id="point"> <br>
	
	</div>
	<input type="submit" value="구매하기">
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
	 }else if(paseInt($("#point").val())<paseInt($("#bid").val())){
		 alert("포인트가 부족합니다")
		 return false;
	 }
 }

</script>