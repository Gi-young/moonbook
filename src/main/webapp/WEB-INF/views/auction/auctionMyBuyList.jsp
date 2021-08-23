<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>  

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value=""/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionMyBuyList.css">

	<div id="wrap">
        <div id="container">
        	<div style="margin-bottom:30px;">
				<table id="auction_mylist_table" style="width: 100%;">
				    <tr>
				        <th>총 건</th>
				        <th>진행 중</th>
				        <th>낙찰</th>
				        <th>유찰</th>
				        <th>마감</th>
				    </tr>
				    <tr>
				        <td>${totaldata } 건</td>
				        <td>${Y } </td>
				        <td>${S }</td>
				        <td>${N==null?"0":N} </td>
				        <td>${B==null?"0":B} </td>
				
				    </tr>
				
				</table>
        	</div>	
			<div>
				<table style="width: 100%;  text-align: center;" id="buylertable">
					<tr style="    font-weight: bold; font-size: 19px;    ">
						<th>경매번호</th>
						<th>경매이름</th>
						<th>경매 시작일</th>
						<th>경매 종료일</th>
						<th>입찰 금액</th>
						<th>경매 상태</th>
					</tr>	
					<c:forEach items="${auction }" var="a">
						<tr class="buylisttr">
							<td>${a.auctionNo }</td>
							<td><a href="${path }/auction/acutionview?auctionNo=${a.auctionNo}">${a.auctionName }</a></td>
							<td>${a.startDate }</td>
							<td>${a.endDate }</td>
							<td>${a.auctionbid[0].bidPrice }</td>
							<td>
							<c:if test="${a.auctionState eq 'S' && a.state eq '낙찰'}">				
									<p style="color:blue">낙찰</p>
									<c:if test="${a.buylerState eq 'N'}">
									<button onclick="openAuctionBPage(${a.auctionNo},'${a.memberId }');">배송 확인하기</button>	
									</c:if>
									<c:if test="${a.buylerState eq 'Y'}">
									<p style="color:blue;">배송 확인</p>	
									</c:if>
																						
							</c:if>
							<c:if test="${a.auctionState eq 'S' && a.state eq '유찰'}">				
									<p style="color:red">유찰</p>
									<c:forEach items="${a.auctionbid }" var="bid">
							
									<c:if test="${bid.bidId eq member.memberId && bid.bidCheck eq 'N'}">
										<span>${bid.bidPrice }</span>
										<button onclick="location.replace('${path}/auction/auctionbidCollect?memberId=${member.memberId }&bidNo=${bid.bidNo }&memberPoint=${bid.bidPrice }')">포인트 돌려받기</button>
									</c:if>
									<c:if test="${bid.bidId eq member.memberId && bid.bidCheck eq 'Y'}">
										<span>${bid.bidPrice }</span>
										<p style="color:blue;">회수완료</p>
									</c:if>
									</c:forEach>														
							</c:if>
							<c:if test="${a.auctionState eq 'Y'}">				
									<span style="color:blue">진행중</span>																
							</c:if>
							<c:if test="${a.auctionState eq 'B'}">				
									<span style="color:sliver">마감</span>																
							</c:if>
						
							</td>
						</tr>		
					</c:forEach>	
				</table>
			</div>
			<div class="pageBar">${pageBar }</div>
        </div>
    </div>
    <script>
	function openAuctionBPage(auctionNo,bidId) {
		console.log(bidId)
		let windowHeight = window.screen.height;
		let windowWidth = window.screen.width;
		let width = 500;
		let height = 600;
		
		status = "left = " + (windowWidth - width) / 2 + ", top = " + (windowHeight - height) / 2 + ", width = " + width + ", height = " + height;
		
		window.open('${path}/auction/auctionBpage?auctionNo=' + auctionNo+'&bidId='+bidId,'auctionBpage', status);
	}
    </script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value=""/>
</jsp:include>