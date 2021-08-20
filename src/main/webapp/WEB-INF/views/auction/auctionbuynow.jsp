<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${param.title}</title>
	<link rel="icon" href="${path}/resources/images/ebook/favicon.png" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionbuynow.css">
</head>
<body>
	<div id="container">
	<c:forEach items="${auction.auctionbid }" var="bid" varStatus="vs">
			
				
							
							<input type="hidden" value="${bid.bidNo }" class="hiddenbidNo">
							<input type="hidden" value="${bid.bidId }" class="hiddenbidId">
							<input type="hidden" value="${bid.bidPrice }" class="hiddenbidPrice">
						 	
				
		</c:forEach>
		<form id="buyNowFrm" action="${path }/auction/auctionbuynowEnd" onsubmit="return check();">
			<div>
				<h2>경매정보</h2>
				<input type="hidden" value="${auction.auctionNo }" name="auctionNo">
				<input type="hidden" value="${ auction.auctionName }" name="auctionName">
				
				<div>
					<span>판매자 아이디 : </span>
					<input type="text" value="${auction.memberId }" readonly="readonly" id="seller">
				</div>
				
				<div>
					<span>즉시 구매가 : </span>
					<fmt:formatNumber value="${auction.buyNow }" type="currency"/>
				</div>
				
				<input type="hidden" value="${auction.buyNow }" readonly="readonly" name="bidPrice">
			</div>
		
			<div>
				<h2>바로 구매</h2>
				<div>
					<span>구매자 아이디 : </span>
					<input type="text" value="${member.memberId }" readonly="readonly" name="bidId" id="bidid">
				</div>
				
				<div>
					<span>내 경매 포인트 : </span>
					<fmt:formatNumber value="${member.memberPoint }" type="currency"/>
				</div>
				
				<input type="hidden" value="${loginMember.memberPoint }" readonly="readonly" id="point">
			</div>
			
			<input type="submit" value="구매하기">
		</form>
		<form action="${path }/auction/auctionbuynowNeedEnd" id="buyNowFrm2" style="display:none" onsubmit="return check3();">
				<div>
					<h2>경매정보</h2>
					<input type="hidden" value="${auction.auctionNo }" name="auctionNo">
					<input type="hidden" value="${ auction.auctionName }" name="auctionName">
					
					<div>
						<span>판매자 아이디 : </span>
						<input type="text" value="${auction.memberId }" readonly="readonly" id="seller">
					</div>
					<div>
						<span>즉시 구매가 : </span>
						<fmt:formatNumber value="${auction.buyNow }" type="currency"/>
					</div>
				</div>
				<div>
				<h2>바로 구매</h2>
				<div>
					<span>구매자 아이디 : </span>
					<input type="text" value="${member.memberId }" readonly="readonly" name="bidId" id="bidid">
				</div>
				
				<div>
					<span>내 경매 포인트 : </span>
					<fmt:formatNumber value="${member.memberPoint }" type="currency"/>
				</div>
				<div>
						<c:forEach items="${auction.auctionbid }" var="bid" varStatus="vs">
							<c:if test="${member.memberId eq bid.bidId}">
							<div>
									<span>내 입찰 기록</span>							
									<span id="bididtext">${bid.bidId }님</span>
									<span id="bidpricetext">${bid.bidPrice}원 입찰 중</span>
							</div>	
							<div>
								<span>필요 포인트:<fmt:formatNumber value="${auction.buyNow-bid.bidPrice }" type="currency"/></span>
								<input type="hidden" value="${auction.buyNow-bid.bidPrice }" id="needPoint" name="bidPrice">
								
							</div>
							</c:if>		
						</c:forEach>
				</div>
				<input type="hidden" value="" name="bidNo">
				<input type="submit" value="구매하기">
			</div>
		</form>
	</div>
	
	<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
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
		
		let check2=true;
		
		$(".hiddenbidId").each((i,v)=>{		
			if($(v).val()==$("#bidid").val()){
				let bidNo=$(v).prev().val()			
				$("input[name=bidNo]").val(bidNo);	
				alert("입찰기록이 있습니다.")
				$("#buyNowFrm2").show();
				$("#buyNowFrm").hide();
	
				check2=false;
				return false;
			}		
		});
		const check3=()=>{
				if(confirm($("#needPoint").val()+"원 사용하여 구매하시겠습니까?")){
					return true;
				}
				return false;
			
		}
	</script>

</body>
</html>