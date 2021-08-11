<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>  

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionview.css"></link>

	<c:set var="a" value="${auction}"/>
	
	<div id="wrap">
		<div id="container">
	        <div class="auction_cate">
	            <p><span>${a.auctioncate[0].auctioncateName }</span> > <span>${a.auctioncate[0].auctioncateFirst }</span> > <span>${a.auctionName }</span></p>
	        </div>
	
	        <div class="bid-info">
	            <div class="auctionview_left line">
	                <img src="${path }/resources/auction/images/${a.auctionImg[0]}" alt="">
	            </div>
	            
	            <div class="auctionview_right">
	                <div>
	                    <h2>경매 정보</h2>
	                    <p>경매 시작일: <span>${a.startDate } </span></p>
	                    <p>경매 종료일: <span>${a.endDate } </span></p>
	                    <input type="hidden" value="${a.endDate }" name="timestemp">
		                <p class="countdown">마감까지 남은 시간: &nbsp;<span id="countdown"></span></p>
	                    <p>판매자 id: <span>${a.memberId }</span></p> 
	                </div>
	                <div>
	                    <h2>가격 정보</h2>
	                    <p>경매 시작가: <span>${a.startPrice } </span></p>
	                    <p>응찰 단위: <span>${a.priceUnit } </span></p>
	                    <p>즉시 구매가격: <span class="auction_buy_now">10000 </span>원</p>
	                </div>
	                
	                <div>
	                <h2>입찰 정보</h2>
	                <c:if test="${a.auctionbid.size()!=0 }">
	                <p>입찰자수: <span>${a.auctionbid.size() } </span> 명</p>
	                <p>최고 입찰자: <span>${a.auctionbid[0].bidId }</span></p>
	                <p>현재 최고가: <span>${a.auctionbid[0].bidPrice}</span></p>
	                <!-- <div>입찰 기록</div> -->
	                </c:if>
	                <c:if test="${a.auctionbid.size()==0 }">
	                <p>아직 입찰 내역이 없습니다.</p>
	                </c:if>
	                </div>
	
	                <div class="auctionview_btn">
	                    <a href="">입찰하기</a>
	                    <a href="">즉시 구매</a>
	                </div>
	            </div>
	        </div>
	
	        <div id="auctionview_main">
	            <h2>물품 이미지</h2>
	            <div class="auctionview_img">
	            	<c:forEach items="${auction.auctionImg }" var="img">
	            		<img src="${path }/resources/auction/images/${img}" alt="">
	            	</c:forEach>
	            </div>
	            
	            <div>
	                <h2>물품 설명</h2>
	                <p>
	                    ${a.auctionEx }
	                </p>
	            </div>
	
	            <div>
	                <h2>물품 상태</h2>
	                <p>
	                    ${a.auctionQuality }
	                </p>
	            </div>
	
	            <div>
	                <h2>물품 크기/무게</h2>
	                <p>
	                    ${a.auctionSize }
	                </p>
	            </div>
	            
				<div>
	                <h2>입찰 기록</h2>
	                <div class="bidTableBox">
		                <c:if test="${a.auctionbid.size()!=0 }">
		                	<table id="bidLog">
			                	<tr>
			                		<th>입찰 번호</th>
			                		<th>입찰자 아이디</th>
			                		<th>입찰 가격</th>
			                	</tr>
								<c:forEach items="${a.auctionbid }" var="bid">
									<tr>
										<td>${bid.bidNo }</td>
										<td>${bid.bidId }</td>
										<td>${bid.bidPrice }</td>				
									</tr>
								</c:forEach>
							</table>
						</c:if>
				 
						<c:if test="${a.auctionbid.size()==0 }">
							<p>아직 입찰자가 없습니다.</p>
						</c:if>
					</div>
	            </div>
	        </div>
	    </div>
    </div>
    
   <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
   <script>
	   // gi-young
	   let sockAuction = new SockJS("http://localhost:9090" + "${path}" + "/auction");
	   
	   sockAuction.onopen = (e) => {
		   console.log(e);
	   }
	   
	   sockAuction.onmessage = (i) => {
		   console.log(i);
		   
		   let messageArr = i.data.split(",");
		   
		   if (messageArr[0] === "bid") {
			   let bidLog = document.getElementById("bidLog");
			   
			   let tr = document.createElement("tr");
			   let td = document.createElement("td");
			   td.innerText = messageArr[1] + ", " + messageArr[3];
			   
			   tr.appendChild(td);
			   bidLog.appendChild(tr);
		   }
	   }
	   
	   sockAuction.onclose = (e) => {
		   console.log(e);
	   }
	   
	   function CountDownTimer(dt, id)
	   {
	   var end = new Date(dt);
	
	   var _second = 1000;
	   var _minute = _second * 60;
	   var _hour = _minute * 60;
	   var _day = _hour * 24;
	   var timer;
	
	   function showRemaining() {
	   var now = new Date();
	   var distance = end - now;
	   if (distance < 0) {
	
	   clearInterval(timer);
	   document.getElementById(id).innerHTML = '종료되었습니다!';
	
	   return;
	   }
	   var days = Math.floor(distance / _day);
	   var hours = Math.floor((distance % _day) / _hour);
	   var minutes = Math.floor((distance % _hour) / _minute);
	   var seconds = Math.floor((distance % _minute) / _second);
	
	   document.getElementById(id).innerHTML = days + '일 ';
	   document.getElementById(id).innerHTML += hours + '시간 ';
	   document.getElementById(id).innerHTML += minutes + '분 ';
	   document.getElementById(id).innerHTML += seconds + '초';
	   }
	
	   timer = setInterval(showRemaining, 1000);
	   }
	   CountDownTimer('${auction.endDate}','countdown')
	</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value=""/>
</jsp:include>