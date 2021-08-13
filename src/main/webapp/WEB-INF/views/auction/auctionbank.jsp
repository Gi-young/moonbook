<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  


<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionbank.css">
 <div id="wrap">
	    <div id="container">
	    	<div></div>
		    	<div class="btn_coll">		    	
					<button onclick="deposit();">선금 충전하기</button>
					<button onclick="withdraw();">출금 신청하기</button>			
				</div>
			
			<h2>내 입출금 기록</h2> 
		
	  	  	<table id="auction_mylist_table">
	  	  		<tr>
	  	  			<th>거래번호</th>
	  	  			<th>입/출금</th>
	  	  			<th>신청일자</th>
	  	  			<th>신청 계좌번호</th>
	  	  			<th>은행명</th>
	  	  			<th>입/출금 금액</th>	
	  	  			<th>처리 상태</th>
	  	  		</tr>
	  	  		<c:forEach items="${auctionbank }" var="b">
	  	  		<tr>
	  	  			<td>${b.transactionNo }</td>
	  	  			<td>${b.transactionName }</td>
	  	  			<td>${b.transactionTime }</td>
	  	  			<td>${b.transactionNumber }</td>
	  	  			<td>${b.bankinfo.bankName }</td>
	  	  			<td>${b.transactionPrice }</td>	  	  			
	  	  			<td>${b.transactionState eq 'Y'?"처리":"미처리"}</td>
	  	  				  	  			
	  	  		</tr>  	  		
	  	  		</c:forEach>
	  	  	</table>
	  	  	<div class="pageBar">
	  	  		${pageBar }
	  	  	</div>
	  	 </div>
  </div>
  <script>
	function withdraw() {
		let windowHeight = window.screen.height;
		let windowWidth = window.screen.width;
		let width = 600;
		let height = 700;
		
		status = "left = " + (windowWidth - width) / 2 + ", top = " + (windowHeight - height) / 2 + ", width = " + width + ", height = " + height;
		
		window.open("${path}/auction/auctionpayout.do", "deposit", status);
	}
	function deposit() {
		let windowHeight = window.screen.height;
		let windowWidth = window.screen.width;
		let width = 600;
		let height = 700;
		
		status = "left = " + (windowWidth - width) / 2 + ", top = " + (windowHeight - height) / 2 + ", width = " + width + ", height = " + height;
		
		window.open("${path}/auction/auctionpay.do", "deposit", status);
	}
  </script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>