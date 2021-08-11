<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입찰하기</title>
	<link rel="icon" href="${path}/resources/images/ebook/favicon.png" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionbid.css">
</head>
<body>
	<div class="container">
		<form action="${path }/auction/auctionbidEnd" onsubmit="return check();">
			<div>
				<div>
					<h2>경매정보</h2>
					<input type="hidden" value="${auction.auctionNo }" name="auctionNo">
					<input type="hidden" value="${ auction.auctionName }" name="auctionName">
					<span>판매자 아이디</span>	<input type="text" value="${auction.memberId }" readonly="readonly" id="seller"> <br>
				
					<span>시작 금액</span>	<fmt:formatNumber value="${auction.startPrice }" type="currency"/> <br>
					<input type="hidden" value="${auction.startPrice }" readonly="readonly" id="startPrice">
					<span>즉시 구매가</span><fmt:formatNumber value="${auction.buyNow }" type="currency"/> <br>
					<input type="hidden" value="${auction.buyNow }" readonly="readonly" id="buynow">
				</div>
				
				<div>
					<h2>입찰 기록</h2>
					<table>			
						<c:forEach items="${auction.auctionbid }" var="bid" varStatus="vs">
							<c:if test="${vs.first }">
								<input type="hidden" value="${bid.bidId }" id="bidid2">
								<tr style="font-size: 20px; font-weight: bold;">
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
							
							<input type="hidden" value="${bid.bidNo }" class="hiddenbidNo">
							<input type="hidden" value="${bid.bidId }" class="hiddenbidId">
							<input type="hidden" value="${bid.bidPrice }" class="hiddenbidPrice">
						 	
						 	<tr>
								<td>${bid.bidId }</td>
								<td>${bid.bidPrice }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<div id="bidshow">
					<h2>입찰서</h2>
					<span>구매자 아이디</span>	<input type="text" value="${member.memberId }" readonly="readonly" name="bidId" id="bidid"><br>
					<span>내 경매 포인트</span>	<fmt:formatNumber value="${member.memberPoint }" type="currency"/>
					<input type="hidden" value="${member.memberPoint }" readonly="readonly" id="point"> <br>
					<span>입찰 금액</span>		<input type="number" value="${auction.startPrice }" step="${auction.priceUnit }" id="bid" name="bidPrice"><br>	
					<input type="submit" value="입찰하기">
				</div>
			
				<br>
			
			</div>
		</form>
		
		<form id="addbid" action="${path }/auction/auctionAddbidEnd">
			<h2>추가 입찰서</h2>
			<span>구매자 아이디</span>	<input type="text" value="${member.memberId }" readonly="readonly" name="bidId" id="bidid"><br>
			<span>내 경매 포인트</span>	<fmt:formatNumber value="${member.memberPoint }" type="currency"/> <br>
			<input type="number" value="0" name="bidPrice"> <br>
			<input type="hidden" value="" name="bidNo">
			<input type="submit" value="추가입찰하기">
		</form>
	</div>
	
	<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script>
		// gi-young
		let sockAuction = new SockJS("http://localhost:9090" + "${path}" + "/auction");
		
		sockAuction.onopen = (e) => {
			console.log(e);
		}
		
		sockAuction.onmessage = (i) => {
			console.log(i);
		}
		
		sockAuction.onclose = (e) => {
			console.log(e);
		}
	
		console.log($("#point").val())
		console.log($("#bid").val())
		
		let check2=true;
	
		$(".hiddenbidId").each((i,v)=>{
			console.log($(v).val());
			
			if($(v).val()==$("#bidid").val()){
				alert("입찰 기록이있습니다.")
				
				let bidNo=$(v).prev().val()
				
				$("input[name=bidNo]").val(bidNo);
				
				check2=false;
				return false;
			}		
		});
	
		const check=()=>{
			if($("#bidid").val()==$("#seller").val()){
				alert("자신이 올린 물품입니다.")
				return false; 
			}
			
			if(parseInt($("#bid").val())>parseInt($("#buynow").val())){
				alert("즉시 구매가 보다 높습니다.")
				return false;
			}
		
			if($("#bidid").val()==$("#bidid2").val()){
				alert("이미 최고 입찰자입니다.")
				return false;
			}else if(parseInt($("#point").val())<parseInt($("#bid").val())){
				alert("포인트가 부족합니다")
				return false;
			}else if(parseInt($("#point").val())<parseInt($("#startPrice").val())){
				alert("시작금액보단 높게 설정해야합니다.")
				return false;
			}else if(check2==false){
				alert("입찰기록이있습니다.")
				let flag=confirm("추가 입찰 하시겠습니까?")	
				if(flag){
					 $("#addbid").show();
					 $("#bidshow").hide();
				 }
				return false;		 
			}
		}
		 
		// gi-young
		function sendMessage() {
		 sockAuction.send("bid," + "${loginMember.memberId}" + "," + "${auction.auctionNo}" + "," + $("#bid").val());
		}
	</script>
	
</body>