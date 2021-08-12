<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/giftAnalysis.css">
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
								<select name="type18">
									<option value="cost" selected>매출</option>
									<option value="profit" >이익</option>
									<option value="salesVolume" >판매량</option>
								</select>
								</td>
								<td>
									<input class="howASCSearch" type="radio" name="searchBook9" id="asc" value="ASC" checked><label for="asc">오름차순</label>
									<input class="howDESCSearch2" type="radio" name="searchBook9" id="desc" value="DESC"><label for="desc">내림차순</label>
								</td>
								<td><input type="button" value="조회하기" onclick="orderBookAList(1,10);"></td>
							</tr>
							<tr>
								<th>검색하기</th>
								<td class="admin-search2">
								<select name="type19">
									<option value="BIND_NO" selected>책 번호</option>
									<option value="TITLE" >책 제목</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text" name="searchbookA1"> 
								</td>
								<td class="search-box">
									<img alt="검색하기"
									src="${path }/resources/img/admin/search.png" onclick="searchbookA(1,10);">
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="bookAnalysisT-container">

				<p class="memberTFont">
					총 <span class="turnRed1">${totalContents }</span>개의 책이 있습니다.
				</p>
				<p class="memberTFont2">총 매출액은 <span class="turnRed2">${totalCost }</span>원 입니다.</p>
				
				<%-- <form action="${path }/admin/memberUpdate.do" name="admemberT" id="admemberT" method="post"> --%>
				<table class="bookAnalysisT">

					<tr>
						<th>상품 번호</th>
						<th>상품명</th>
						<th>가격</th>
						<th>입고가</th>
						<th>이익</th>
						<th>판매량</th>
						<th>매출</th>
					</tr>


					<c:forEach var="e" items="${list }">
						<tr>
							<td><input type="text" value="${e.gift_no }" name="gift_no"
								readonly></td>
							<td><input type="text" value="${e.gift_title }" name="gift_title"></td>
							
							<td><input type="text" value="${e.gift_price }" name="gift_price"></td>
							<td><input type="text" value="${e.gift_rowPrice}"></td>
							<td><input type="text" value="${e.gift_price - e.gift_rowPrice}"
								 readonly></td>
							<td><input type="text" value="${e.gift_salesVolume }"
								name="gift_salesVolume" readonly></td>
							<td><input type="text" value="${(e.gift_price - e.gift_rowPrice)*e.gift_salesVolume }"
								 readonly></td>
						</tr>
					</c:forEach>
					
				</table>
				
				<!-- </form> -->


				<div id="pagebar-container13">
			        ${pageBar }
				</div>

				</div>
		</div>
	</div>
</div>


<script>


function searchbookA(cPage,numPerpage){
	let type19 =document.getElementsByName("type19")[0].value;
	let search=document.getElementsByName("searchbookA1")[0].value;
	
	$.ajax({
		url: "${path}/admin/searchTextbookAList.do",
		data:{
			type19 :type19,
			search:search,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data=>{
			document.querySelectorAll(".bookAnalysisT td").forEach((v,i) => {
				v.remove();
			});
			let table=document.querySelector(".bookAnalysisT");
			for(let i=0;i<data.length;i++){
				let tr=document.createElement("tr");
				for(let j=0;j<7;j++){
					let td=document.createElement("td");
					/* td.style.border="1px solid black"; */
					td.style.height="27px";
					
					if(j == 0) td.innerHTML = "<input type='text' value='" + data[i].bindNo + "'>";
					if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].title + "'>";
					if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].price + "'>";
					if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].primeCost + "'>";
					if(j == 4) td.innerHTML = "<input type='text' value='" + (data[i].price - data[i].primeCost) + "'>";
					if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].salesVolume + "'>";
					if(j == 6) td.innerHTML = "<input type='text' value='" + (data[i].price - data[i].primeCost)*data[i].salesVolume + "'>";
					
					tr.appendChild(td);
				}
				table.appendChild(tr);
				
			}
			document.querySelectorAll(".bookAnalysisT td>img.updateImg").forEach((v, i) => {
				v.addEventListener("click", function() {changeMember(event)});
			});
			document.querySelectorAll(".bookAnalysisT td>img.deleteImg").forEach((v, i) => {
				v.addEventListener("click", function() {adMemberDelete(event)});
			});
		}
		
	});
	$.ajax({
		url: "${path}/admin/getPageBarsearchTextbookAList.do",
		data: {
			type19 :type19,
			search:search,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data => {
			$("#pagebar-container13").html(data[0]);
			$(".turnRed1").html(data[1]);
			$(".turnRed2").html(data[2]);
			
		}
	});
} 

function orderBookAList(cPage,numPerpage){
	let type18 = document.getElementsByName("type18")[0].value;
	let order="";
	document.getElementsByName("searchBook9").forEach((v,i) => {
		if (v.checked) {
			order = v.value;
		}
	});
	
	$.ajax({
		url: "${path}/admin/orderBookAList.do",
		data: {
			type18: type18,
			order: order==="" ? "asc":order,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data => {
			document.querySelectorAll(".bookAnalysisT td").forEach((v,i) => {
				v.remove();
			});
			let table=document.querySelector(".bookAnalysisT");
			for(let i=0;i<data.length;i++){
				let tr=document.createElement("tr");
				for(let j=0;j<7;j++){
					let td=document.createElement("td");
					/* td.style.border="1px solid black"; */
					td.style.height="27px";
					
					if(j == 0) td.innerHTML = "<input type='text' value='" + data[i].bindNo + "'>";
					if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].title + "'>";
					if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].price + "'>";
					if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].primeCost + "'>";
					if(j == 4) td.innerHTML = "<input type='text' value='" + (data[i].price - data[i].primeCost) + "'>";
					if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].salesVolume + "'>";
					if(j == 6) td.innerHTML = "<input type='text' value='" + (data[i].price - data[i].primeCost)*data[i].salesVolume + "'>";
					
					tr.appendChild(td);
				}
				table.appendChild(tr);
				
			}
			document.querySelectorAll(".bookAnalysisT td>img.updateImg").forEach((v, i) => {
				v.addEventListener("click", function() {changeMember(event)});
			});
			document.querySelectorAll(".bookAnalysisT td>img.deleteImg").forEach((v, i) => {
				v.addEventListener("click", function() {adMemberDelete(event)});
			});
		}
	});
	$.ajax({
		url: "${path}/admin/getPageBarorderBookAList.do",
		data: {
			type18: type18,
			order: order==="" ? "asc":order,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data => {
			$("#pagebar-container13").html(data[0]);
			$(".turnRed1").html(data[1]);
			
			
		}
	});
	
	
}




</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>