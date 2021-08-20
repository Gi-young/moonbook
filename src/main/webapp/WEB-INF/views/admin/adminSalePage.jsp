<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/adminSalePage.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<div class="admin-container">
	<div class="admin-box1">
		<div class="admin-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="admin-box2">
			<div class="admin-box4">
					<div class="admin-search3">
				<form class="admin-search" action="">
						<table class="adminHowTable">
							<tr>
								<th>정렬방법</th>
								<td>
									<input class="howASCSearch" type="radio" name="searchHow12" id="day" value="Day" checked><label for="day" style="margin-left:7px; margin-right:5px;">일별</label>
									<input type="Date" name="searchSaleDate1">
								</td>
								<td>
									
									<input class="howDESCSearch2" type="radio" name="searchHow12" id="days" value="Day2"><label for="days" style="margin-left:7px; margin-right:5px;">기간별</label>
									<input type="Date" name="searchSaleDate2" class="saleDate1"><p>~</p><input type="Date" name="searchSaleDate3" class="saleDate2">
								</td>
								<td><input type="button" value="조회하기" onclick="orderSaleList(1,10);"></td>
							</tr>
							<tr>
								<th>검색하기</th>
								<td class="admin-search2">
								<select name="type51">
									<option value="orderMemberId" selected>주문한 ID</option>
									<option value="orderNo" >주문번호</option>
									<option value="orderStatus" >주문접수중</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text" name="searchSaleT"> 
								</td>
								<td class="search-box">
									<img alt="검색하기"
									src="${path }/resources/img/admin/search.png" onclick="searchSale(1,10);">
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="saleT-container">
						<p class="saleTFont">총 <span class="turnRed">${totalContents }</span>개의 데이터가 있습니다.</p>
						<p class="saleTFont2">※ 결제날짜가 최신순으로 자동정렬 됩니다.</p>
						<p class="saleTFont">※ 판매내역은 수정이 불가능 합니다.</p>
						<%-- <form action="${path }/admin/memberUpdate.do" name="admemberT" id="admemberT" method="post"> --%>
						<table class="saleT">
							
							<tr>
								<th>상품 판매번호</th>
								<th>수량</th>
								<th>배송비</th>
								<th>주문한 ID</th>
								<th>사용된 쿠폰번호</th>
								<th>결제 상태</th>
								<th>적립된 포인트</th>
								<th>총 결제가격</th>
								<th>결제 날짜</th>
							</tr>
							
							
							<c:forEach var="e" items="${list }">
							<tr>
									<td><input type="text" value="${e.orderNo }" name="orderNo" readonly></td>
									<td><input type="text" value="${e.orderCount }" name="orderCount" readonly></td>
									<td><input type="text" value="${e.orderDeliveryfee }" name="orderDeliveryfee"></td>
									<td><input type="text" value="${e.orderMemberId }" name="orderMemberId" readonly></td>
									<td><input type="text" value="${e.orderCouponNo }" name="orderPrice" readonly></td>
									<td><input type="text" value="${e.orderStatus }" name="orderPaymentId" readonly></td>
									<td><input type="text" value="${e.orderPoint }" name="orderPaidat"></td>
									<td><input type="text" value="${e.orderTotalprice }" name="orderPaidMethod"></td>
									<td><input type="text" value="${e.orderDate }" name="orderStatus"></td>
									
								
							</tr>
							</c:forEach>
							

						</table>
						<!-- </form> -->
						
						<div id="pagebar-container12">
			        		${pageBar }
			        	</div> 
			        
					</div>
		</div>
	</div>
</div>


<script>


function searchSale(cPage,numPerpage){
	let type51 =document.getElementsByName("type51")[0].value;
	let search=document.getElementsByName("searchSaleT")[0].value;
	
	$.ajax({
		url: "${path}/admin/searchTextSaleList.do",
		data:{
			type51 :type51,
			search:search,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data=>{
		document.querySelectorAll(".saleT td").forEach((v,i) => {
				v.remove();
			});
			console.dir( data);
			
			let table=document.querySelector(".saleT");
			for(let i=0;i<data.length;i++){
				let tr=document.createElement("tr");
				for(let j=0;j<9;j++){
					let td=document.createElement("td");
					/* td.style.border="1px solid black";
					td.style.height="27px"; */
					
					if(j == 0) td.innerHTML = "<input type='text' value='" + data[i].orderNo + "'>";
					if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].orderCount + "'>";
					if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].orderDeliveryfee + "'>";
					if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].orderMemberId + "'>";
					if(j == 4) td.innerHTML = "<input type='text' value='" + data[i].orderCouponNo + "'>";
					if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].orderStatus + "'>";
					if(j == 6) td.innerHTML = "<input type='text' value='" + data[i].orderPoint + "'>";
					if(j == 7) td.innerHTML = "<input type='text' value='" + data[i].orderTotalprice + "'>";
					if(j == 8) {
						let regiDate = new Date(data[i].orderDate);
						
						let regiMonth;
						if((regiDate.getMonth()+1)<10){
							regiMonth = ("0"+(regiDate.getMonth()+1));
						}else{ 
							regiMonth = (regiDate.getMonth()+1);
						}	
						
						td.innerHTML = "<input type='text' value='"+regiDate.getFullYear() + "-" + 
						regiMonth
						+ "-" + regiDate.getDate()+ "'>";
					}
					tr.appendChild(td);
				}
				table.appendChild(tr);
				
			}
			
		}
		
	});
	$.ajax({
		url: "${path}/admin/getPageBarSearchTextSaleList.do",
		data: {
			type51 :type51,
			search:search,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data => {
			$("#pagebar-container12").html(data[0]);
			$(".turnRed").html(data[1]);
			
		}
	});
	
} 

function orderSaleList(cPage,numPerpage){
	/* let type1 = document.getElementsByName("type1")[0].value; */
	let searchSaleDate1=document.getElementsByName("searchSaleDate1")[0].value;
	let searchSaleDate2=document.getElementsByName("searchSaleDate2")[0].value;
	let searchSaleDate3=document.getElementsByName("searchSaleDate3")[0].value;
	
	let type="";
	let order2="";
	document.getElementsByName("searchHow12").forEach((v,i) => {
		if (v.checked) {
			/* order = v.previousSibling.value; */
			type =v.value;
		}
	}); 
	
	$.ajax({
		url: "${path}/admin/orderSaleList.do",
		data: {
			type: type,
			searchSaleDate1 : searchSaleDate1,
			searchSaleDate2 : searchSaleDate2,
			searchSaleDate3 : searchSaleDate3,
			cPage : cPage,
			numPerpage : numPerpage
		},
		success: data => {
			document.querySelectorAll(".saleT td").forEach((v,i) => {
				v.remove();
			});
			console.dir( data);
			
			let table=document.querySelector(".saleT");
			for(let i=0;i<data.length;i++){
				let tr=document.createElement("tr");
				for(let j=0;j<9;j++){
					let td=document.createElement("td");
					/* td.style.border="1px solid black";
					td.style.height="27px"; */
					
					if(j == 0) td.innerHTML = "<input type='text' value='" + data[i].orderNo + "'>";
					if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].orderCount + "'>";
					if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].orderDeliveryfee + "'>";
					if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].orderMemberId + "'>";
					if(j == 4) td.innerHTML = "<input type='text' value='" + data[i].orderCouponNo + "'>";
					if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].orderStatus + "'>";
					if(j == 6) td.innerHTML = "<input type='text' value='" + data[i].orderPoint + "'>";
					if(j == 7) td.innerHTML = "<input type='text' value='" + data[i].orderTotalprice + "'>";
					if(j == 8) {
						let regiDate = new Date(data[i].orderDate);
						
						let regiMonth;
						if((regiDate.getMonth()+1)<10){
							regiMonth = ("0"+(regiDate.getMonth()+1));
						}else{ 
							regiMonth = (regiDate.getMonth()+1);
						}	
						
						td.innerHTML = "<input type='text' value='"+regiDate.getFullYear() + "-" + 
						regiMonth
						+ "-" + regiDate.getDate()+ "'>";
					}
					tr.appendChild(td);
				}
				table.appendChild(tr);
				
			}
		}
	});
	$.ajax({
		url: "${path}/admin/getPageBarorderSaleList.do",
		data: {
			type: type,
			searchSaleDate1 : searchSaleDate1,
			searchSaleDate2 : searchSaleDate2,
			searchSaleDate3 : searchSaleDate3,
			cPage : cPage,
			numPerpage : numPerpage
		},
		success: data => {
			$("#pagebar-container12").html(data[0]);
			$(".turnRed").html(data[1]);
			
		}
	});
	
}




</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>