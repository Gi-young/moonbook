<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
 
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auction.css">
	<div id="wrap">
		<div id="container">
	        <div class="auction_main line">
	            <div class="auction_main_left line">배너</div>
	            <div class="auction_main_right line">
	            	<h2>정보란</h2>
	            	<c:choose>
		            	<c:when test="${sessionScope.loginMember!=null }">
			                <p><span>${member.memberName}</span>님 환영합니다.</p>
			                <c:if test="${member.memberId!='admin' }">
			               	 <p class="memberbidpoint">경매포인트<span><fmt:formatNumber value="${member.memberPoint }" type="currency"/></span> </p>
				                <div class="btn_coll">
				                <button onclick="location.assign('${path}/auction/auctionpay.do')">포인트 충전하기</button>
				                <button onclick="location.assign('${path}/auction/auctionwrite.do')">물픔 등록하기</button>
				                <button onclick="location.assign('${path}/auction/auctionmyselllist.do?memberId=${member.memberId} ')">내 판매 목록 확인</button>
				   			    <button onclick="location.assign('${path}/auction/auctionmybuylist.do?bidId=${member.memberId} ')">내 구매 목록 확인</button>	
				    		    </div> 
			                </c:if>
			                <c:if test="${member.memberId=='admin' }">
			                 <div class="btn_coll">
			             	  <button onclick="location.assign('${path}/auction/auctionAdmin')">경매 관리 하기</button>
			             	  </div>
			                </c:if>
		    		    </c:when>
		    		    <c:otherwise>
			    		    <div class="btn_coll">
			    		    	<p style="font-size:12px">로그인후 이용가능합니다.</p>
			    		    	<button onclick="location.assign('${path}/member/loginPage.do')">로그인</button>
		    		    	</div>
		    		    </c:otherwise>
	              	</c:choose>
	            </div>
	        </div>
	        
	        <div class="acution_category">
	            <div class="acution_category_left">
	                <div>
	                    <a href="">도서</a>
	                    <div>
	       			      <c:forEach items="${auctioncate }" var="a">
		                    	<c:if test="${a.auctioncateName=='도서' }">
		                    		 <a href="${path }/auction/auctionlist?auctioncateFrist=${a.auctioncateFirst}&auctioncateName=${a.auctioncateName}">${a.auctioncateFirst }</a>
		     					</c:if>
		                   </c:forEach>
	                    </div>                   
	                </div>
	
	                <div>
	                    <a href="">문구</a>
	                    <div>
	       			      <c:forEach items="${auctioncate }" var="a">
		                    	<c:if test="${a.auctioncateName=='문구' }">
		                    		 <a href="${path }/auction/auctionlist?auctioncateFrist=${a.auctioncateFirst}&auctioncateName=${a.auctioncateName}">${a.auctioncateFirst }</a>
		     					</c:if>
		                   </c:forEach>
	                    </div>                   
	                </div>
	
	                <div>
	                    <a href="">기타</a>
	                    <div>
	                       <c:forEach items="${auctioncate }" var="a">
		                    	<c:if test="${a.auctioncateName=='기타' }">
		                    		 <a href="${path }/auction/auctionlist?auctioncateFrist=${a.auctioncateFirst}&auctioncateName=${a.auctioncateName}">${a.auctioncateFirst }</a>
		     					</c:if>
		                   </c:forEach>
	                    </div>                   
	                </div>
	            </div>
	        </div>
	        
	
	        <!--입찰자가 많은 순-->
	        <div class="auction_main_po">
	            <h2 class="auction_main_title">마감 임박 매물</h2>
	          
	            <%int num=0; %>
	            <c:forEach var="t" items="${timelist }">
		            <div style="display: flex;" class="line">
		                <div class="auction_main_po_img">
		                    <a href="${path }/auction/acutionview?auctionNo=${t.auctionNo}">
		                    <img src="${path }/resources/auction/images/${t.auctionImg[0]}" alt="#">
		                    </a>
		                </div>
		                <div class="auction_main_po_center">
		                  	<a href="${path }/auction/acutionview?auctionNo=${t.auctionNo}">
		                   		 <strong>${t.auctionName} </strong>
		                    </a>
		                
							<input type="hidden" value="${t.endDate }" name="timestemp">
		                    <p class="countdown">마감까지 남은 시간 : <span id="countdown<%=num++ %>" style="font-size:20px"></span></p>
		                    <p>경매시작 가격 : <span>${t.startPrice }</span></p>
		                    <p>입찰 인원 수: <span>${t.auctionbid.size()}</span></p>
		                    <p class="">바로 구매 : <span>${t.buyNow }</span></p>   
		                </div>
		                <div class="auction_main_po_right">
		                    <div class="btn1" onclick="openAuctionBid(${t.auctionNo});">입찰하기</div>
							<div class="btn1" onclick="openAuctionBuyNow(${t.auctionNo});">바로구매</div> 
		                </div>
		            </div>
	            </c:forEach>
	
	        </div>
	
	        <!--마감 직전 경매물품-->
	   
	        <div class="auction_main_de">
				<h2 class="auction_main_title">인기 매물</h2>
	           
				<c:forEach var="t" items="${poplist }">
					<div style="display: flex;" class="line">
					    <div class="auction_main_po_img">
					        <img src="${path }/resources/auction/images/${t.auctionImg[0]}" alt="#">
					    </div>
					    <div class="auction_main_po_center">
					        <strong>${t.auctionName} </strong>
					  
							<input type="hidden" value="${t.endDate }" name="timestemp">
					        <p class="countdown">마감까지 남은 시간 : <span id="countdown<%=num++ %>" style="font-size:20px"></span></p>
					        <p>경매시작 가격 : <span>${t.startPrice }</span></p>
					        <p>입찰 인원 수: <span>${t.count}</span></p>
					        <p class="">바로 구매 : <span>${t.buyNow }</span></p>   
					    </div>
					    <div class="auction_main_po_right">
					        <div class="btn1" onclick="openAuctionBid(${t.auctionNo});">입찰하기</div>
					        <div class="btn1" onclick="openAuctionBuyNow(${t.auctionNo});">바로구매</div> 
					    </div>
					</div>
				</c:forEach>
	        </div>
		</div>
	</div>

    <script>
		$(function(){
		    $(".acution_category_left>div").hover((e)=>{
		        $(e.target).next('div').show();
		    },(e)=>{
		        if($(".acution_category_left>div>div").not().hover()){
		            $(".acution_category_left>div>div").hide();
		        }
		    })
		})
   
		function CountDownTimer(dt, id) {
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

		$("input[name=timestemp]").each((i,v)=>{
			 CountDownTimer($(v).val(), 'countdown'+i);
		})
		
		function openAuctionBid(auctionNo) {
			let windowHeight = window.screen.height;
			let windowWidth = window.screen.width;
			let width = 500;
			let height = 600;
			
			status = "left = " + (windowWidth - width) / 2 + ", top = " + (windowHeight - height) / 2 + ", width = " + width + ", height = " + height;
			
			window.open('${path}/auction/actionbid.do?auctionNo=' + auctionNo,'auctionbid', status);
		}
		
		function openAuctionBuyNow(auctionNo) {
			let windowHeight = window.screen.height;
			let windowWidth = window.screen.width;
			let width = 500;
			let height = 600;
			
			status = "left = " + (windowWidth - width) / 2 + ", top = " + (windowHeight - height) / 2 + ", width = " + width + ", height = " + height;
			
			window.open('${path}/auction/actionbuyNow.do?auctionNo=' + auctionNo,'auctionbuynow', status);
		}
    </script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value=""/>
</jsp:include>