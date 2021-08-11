<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>  

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionAdmin.css">
	<link rel="stylesheet" href="${path }/resources/css/pageBar.css">

	<div id="wrap">
		<div id="container">
		
		<div style="padding:10px;" id="formdiv">
			<form action="">
				<div>
				<label>리스트 개수 설정</label>
					<input type="radio" value="1" name="numPerpage">1개씩 보기
					<input type="radio" value="5" name="numPerpage">5개씩 보기
					<input type="radio" value="10" name="numPerpage">10개씩 보기
					<input type="radio" value="15" name="numPerpage">15개씩 보기
			
				</div>
					<div>
					<label>경매 상태</label>
						<input type="radio" value="Y" name="auctionState">진행
						<input type="radio" value="S" name="auctionState"> 낙찰
						<input type="radio" value="N" name="auctionState"> 유찰
						<input type="radio" value="B" name="auctionState"> 마감					
					</div>
				<div>
					<label>배송 확인 물품 </label>	
						<input type="radio" value="buysell" name="buysellState"> 전부
						<input type="radio" value="buy" name="buysellState"> 구매자
						<input type="radio" value="sell" name="buysellState"> 판매자			
				</div>
					<div>
					
						<label>경매 내림차순 설정 </label>	
							<input type="radio" value="END_DATE-START_DATE" name="order">  남은시간
							<input type="radio" value="start_date" name="order">	 시작일
							<input type="radio" value="end_date" name="order">  종료일
					</div>
				<div>
					<div style="text-align:right;">
						<select name="type">
							 <option value="auction_name">상품명</option>
							 <option value="member_id">판매자ID</option>			 
						</select>
					 <input type="text" name="keyword"> 
					 <input type="submit" value="검색하기">			
					</div>
				</div>
			</form>
		</div>
		
		<div style="font-size:20px;"> 총 검색 결과<span style="color:red;"> ${totaldata } </span> 건</div>
			<div style="overflow-x: scroll;">
				<table id="table2">
					<tr style="background-color: beige;">
						<th>경매 번호</th>
						<th>물품 이름</th>
						<th>물품 카테고리</th>
						<th>판매자 ID</th>
						<th>경매 시작일</th>
						<th>경매 종료일</th>
						<th>경매 상태</th>
						<th>판매자 확인</th>
						<th>구매자 확인</th>
						<th>정산하기</th>
					</tr>
					
					<c:forEach items="${auction }" var="a">
						<tr class="table_tr">
							<td>${a.auctionNo }</td>
							<td>${a.auctionName }</td>
							<td>${a.auctioncate[0].auctioncateName }/${a.auctioncate[0].auctioncateFirst }</td>
							<td>${a.memberId }</td>
							<td>${a.startDate }</td>
							<td>${a.endDate }</td>
							<td>
							<c:if test="${a.auctionState eq 'Y'}">
								<span style="color:green;">진행중</span>
							</c:if>
							<c:if test="${a.auctionState eq 'S'}">
								<span style="color:blue;">낙찰</span>
								<span style="color:bule; font-size:12px;">구매자:${a.auctionbid[0].bidId }</span>
							</c:if>
							<c:if test="${a.auctionState eq 'N'}">
								<span style="color:red;">유찰</span>
							</c:if>
							<c:if test="${a.auctionState eq 'B'}">
								<span>마감</span>
							</c:if>
							</td>
							<td>
							<c:if test="${a.sellerState eq 'Y'}">
								<span style="color:blue;">배송확인</span>
							</c:if>
							<c:if test="${a.sellerState eq 'N'}">
								<span style="color:red;">배송 미 확인</span>
							</c:if>
							</td>
							<td>
							<c:if test="${a.buylerState eq 'Y'}">
								<span style="color:blue;">배송확인</span>
							</c:if>
							<c:if test="${a.buylerState eq 'N'}">
								<span style="color:red;">배송 미 확인</span>
							</c:if>
										
							</td>
							<td>
							<c:if test="${a.buylerState eq 'Y' && a.sellerState eq 'Y' && a.auctionState eq 'S'}">
								<button onclick="location.replace('${path}/auction/auctionAdminCal?memberId=${a.memberId }&memberPoint=${a.auctionbid[0].bidPrice }&auctionNo=${a.auctionNo }')">경매 포인트 정산하기</button>
							</c:if>
							<c:if test="${a.auctionState eq 'B'}">
								<span>정산 완료</span>
							</c:if>
							</td>			
						</tr>
						<c:if test="${a.auctionbid.size() == 0 }">
							<tr class="bidlogcheck">
								<th colspan="10" style="color:red;">입찰 기록이 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${a.auctionbid.size() != 0 }">
						<tr class="bidlogcheck">
							<th colspan="10">입찰 기록</th>
						</tr>
						<tr>
							<th colspan="5">입찰자 ID</th>
							<th colspan="5">입찰 가격</th>
						</tr>	
				
						<c:forEach items="${a.auctionbid }" var="bid" varStatus="vs">		
						<tr>
							<td colspan="5">${bid.bidId }</td>
							<td colspan="5">${bid.bidPrice }</td>
						</tr>
					
							<c:if test="${vs.last }">
							<tr style="height:50px;">
							</tr>
							</c:if>
							</c:forEach>		
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value=""/>
</jsp:include>