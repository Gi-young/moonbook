<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>  

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value=""/>
</jsp:include>

	<link ref="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionMySellList.css">

	<div id="wrap">
		<div id="container">
			<div style="margin-bottom:30px;">
				<table id="auction_mylist_table" style="width: 100%;">
				    <tr>
				        <th>총 건</th>
				        <th>진행 중</th>
				        <th>낙찰</th>
				        <th>유찰</th>
				    </tr>
				    <tr>
				        <td>${totaldata } 건</td>
				        <td>${Y } </td>
				        <td>${S }</td>
				        <td>${N==null?"0":N} </td>
				
				    </tr>
				
				</table>
        	</div>
      
			<div>
				<table id="auction_mylist_table2">
					<tr style="    font-weight: bold; font-size: 19px;    ">
						<th>경매번호</th>
						<th>경매이름</th>
						<th>경매 시작일</th>
						<th>경매 종료일</th>
						<th>입찰 금액</th>
						<th>경매 상태</th>
					</tr>	
					<c:forEach items="${auction }" var="a">
						<tr>
							<td>${a.auctionNo }</td>
							<td>${a.auctionName }</td>
							<td>${a.startDate }</td>
							<td>${a.endDate }</td>
							<td>${a.auctionbid[0].bidPrice }</td>
							<td>					      
							<c:choose>
							<c:when test="${a.auctionState eq 'Y' }">
								진행중
							</c:when>
							<c:when test="${a.auctionState eq 'N' }">
								유찰
							</c:when>
							<c:when test="${a.auctionState eq 'S' }">
								<span>낙찰</span>
								<c:if test="${a.sellerState eq 'N' }">
								<button onclick="open('${path}/auction/auctionSpage?auctionNo=${a.auctionNo }&bidId=${a.auctionbid[0].bidId }','auctionbid','width=500,height=600')">배송 확인하기</button>
								</c:if>
								<c:if test="${a.sellerState eq 'Y' }">
								<span style="color:blue;"> 배송 완료</span>
								</c:if>
								<p>낙찰자 아이디 ${a.auctionbid[0].bidId }</p>
								<p>낙찰 가격 : ${a.auctionbid[0].bidPrice }</p>
						</c:when>
						</c:choose></td>
						</tr>		
					</c:forEach>	
				</table>
			</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value=""/>
</jsp:include>