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
									<input class="howASCSearch" type="radio" name="searchHow4" id="day" value="" checked><label for="day">일별</label>
									<input type="Date" name="">
								</td>
								<td>
									
									<input class="howDESCSearch2" type="radio" name="searchHow4" id="days" value=""><label for="days">기간별</label>
									<input type="Date" name=""><p>~</p><input type="Date" name="">
								</td>
								<td><input type="button" value="조회하기" onclick="orderList();"></td>
							</tr>
							<tr>
								<th>검색하기</th>
								<td class="admin-search2">
								<select name="type2">
									<option value="MEMBER_ID" selected>판매</option>
									<option value="MEMBER_NAME" >환불</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text" name="searchHow3"> 
								</td>
								<td class="search-box">
									<img alt="검색하기"
									src="${path }/resources/img/admin/search.png" onclick="searchMT();">
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="saleT-container">
						<p class="saleTFont">총 <span class="turnRed">${totalContents }</span>개의 데이터가 있습니다.</p>
						<!-- <p class="saleTFont2">※ 전화번호, 주소, 회원 포인트, 회원 등급만 수정 가능합니다.</p> -->
						<%-- <form action="${path }/admin/memberUpdate.do" name="admemberT" id="admemberT" method="post"> --%>
						<table class="saleT">
							
							<tr>
								<th>주문번호</th>
								<th>수량</th>
								<th>가격</th>
								<th>배송비</th>
								<th>결제 ID</th>
								<th>결제 날짜</th>
								<th>결제 방법</th>
								<th>주문 상태</th>
								<th>적립된 포인트</th>
								<th>주문자 아이디</th>
								<th>책 번호</th>
								<th>상품 번호</th>
							</tr>
							
							
							<c:forEach var="e" items="${list }">
							<tr>
									<td><input type="text" value="${e.orderNo }" name="orderNo" readonly></td>
									<td><input type="text" value="${e.orderCount }" name="orderCount" readonly></td>
									<td><input type="text" value="${e.orderPrice }" name="orderPrice" readonly></td>
									<td><input type="text" value="${e.orderDeliverFee }" name="orderDeliverFee"></td>
									<td><input type="text" value="${e.orderPaymentId }" name="orderPaymentId" readonly></td>
									<td><input type="text" value="${e.orderPaidat }" name="orderPaidat"></td>
									<td><input type="text" value="${e.orderPaidMethod }" name="orderPaidMethod"></td>
									<td><input type="text" value="${e.orderStatus }" name="orderStatus"></td>
									<td><input type="text" value="${e.orderPoint }" name="orderPoint" readonly></td>
									<td><input type="text" value="${e.orderMemberId }" name="orderMemberId" readonly></td>
									<td>
										<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="changeMemberV(event);" class="updateCheck updateImg">
									</td>
									
									<td>
										
											<input type="hidden" value="${e.memberId }" name="memberId" readonly>
											<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg" onclick="adMemberDelete(event)">
											
									
										</td>
								
							</tr>
							</c:forEach>
							

						</table>
						<!-- </form> -->
						
						<div id="pagebar-container">
			        		${pageBar }
			        	</div> 
			        
					</div>
		</div>
	</div>
</div>


<script>
function adMemberDelete(event){
	let memberId=$(event.target).prev().val();
	
	location.assign('${path}/admin/memberDelete.do?memberId='+memberId);
	
}


function changeMemberV(event){
	let memberId=event.target.parentElement.parentElement.children[1].children[0].value;
	let memberPhone=event.target.parentElement.parentElement.children[3].children[0].value;
	let memberAddress=event.target.parentElement.parentElement.children[5].children[0].value;
	let memberPoint=event.target.parentElement.parentElement.children[6].children[0].value;
	let memberGradeNo=event.target.parentElement.parentElement.children[7].children[0].value;
	console.dir(memberPhone);
	console.log("${path}/admin/memberUpdate.do?memberPhone="+memberPhone+"&memberAddress="+memberAddress+"&memberPoint="+memberPoint+"&memberGradeNo="+memberGradeNo+"&memberId="+memberId);
	location.assign("${path}/admin/memberUpdate.do?memberPhone="+memberPhone+"&memberAddress="+memberAddress+"&memberPoint="+memberPoint+"&memberGradeNo="+memberGradeNo+"&memberId="+memberId);
	
} 

const searchMT =()=>{
	let type2 =document.getElementsByName("type2")[0].value;
	let search=document.getElementsByName("searchHow3")[0].value;
	
	$.ajax({
		url: "${path}/admin/searchTextMemberList.do",
		data:{
			type2 :type2,
			search:search
		},
		success: data=>{
		document.querySelectorAll(".memberT td").forEach((v,i) => {
				v.remove();
			});
			console.dir( data);
			
			let table=document.querySelector(".memberT");
			for(let i=0;i<data.length;i++){
				let tr=document.createElement("tr");
				for(let j=0;j<12;j++){
					let td=document.createElement("td");
					td.style.border="1px solid black";
					td.style.height="27px";
					if(j == 0) {
						let regiDate = new Date(data[i].memberRegiDate);
						
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
					if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].memberId + "'>";
					if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].memberName + "'>";
					if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].memberPhone + "'>";
					if(j == 4) td.innerHTML = "<input type='text' value='" + data[i].memberGender + "'>";
					if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].memberAddress + "'>";
					if(j == 6) td.innerHTML = "<input type='text' value='" + data[i].memberPoint + "'>";
					if(j == 7) td.innerHTML = "<input type='text' value='" + data[i].memberGradeNo + "'>";
					if(j == 8) td.innerHTML = "<input type='text' value='" + data[i].memberTotalSale + "'>";
					if(j == 9) td.innerHTML = "<input type='text' value='" + data[i].memberVisit + "'>";
					if(j == 10) td.innerHTML = '<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="changeMemberV(event);" class="updateCheck updateImg">'
					if(j == 11) td.innerHTML = '<input type="hidden" value="'+ data[i].memberId +'" name="memberId" readonly>'+'<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg">';
					
					tr.appendChild(td);
				}
				table.appendChild(tr);
				
			}
			document.querySelectorAll(".memberT td>img.updateImg").forEach((v, i) => {
				v.addEventListener("click", function() {changeMember(event)});
			});
			document.querySelectorAll(".memberT td>img.deleteImg").forEach((v, i) => {
				v.addEventListener("click", function() {adMemberDelete(event)});
			});
		}
		
	});
} 

const orderList = () => {
	let type1 = document.getElementsByName("type1")[0].value;
	let order="";
	document.getElementsByName("searchHow2").forEach((v,i) => {
		if (v.checked) {
			order = v.value;
		}
	});
	
	$.ajax({
		url: "${path}/admin/orderedMemberList.do",
		data: {
			type1: type1,
			order: order==="" ? "asc":order
		},
		success: data => {
			document.querySelectorAll(".memberT td").forEach((v,i) => {
				v.remove();
			});
			let table=document.querySelector(".memberT");
			for(let i=0;i<data.length;i++){
				let tr=document.createElement("tr");
				for(let j=0;j<12;j++){
					let td=document.createElement("td");
					td.style.border="1px solid black";
					td.style.height="27px";
					if(j == 0) {
						let regiDate = new Date(data[i].memberRegiDate);
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
					if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].memberId + "'>";
					if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].memberName + "'>";
					if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].memberPhone + "'>";
					if(j == 4) td.innerHTML = "<input type='text' value='" + data[i].memberGender + "'>";
					if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].memberAddress + "'>";
					if(j == 6) td.innerHTML = "<input type='text' value='" + data[i].memberPoint + "'>";
					if(j == 7) td.innerHTML = "<input type='text' value='" + data[i].memberGradeNo + "'>";
					if(j == 8) td.innerHTML = "<input type='text' value='" + data[i].memberTotalSale + "'>";
					if(j == 9) td.innerHTML = "<input type='text' value='" + data[i].memberVisit + "'>";
					if(j == 10) td.innerHTML = '<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="changeMemberV(event);" class="updateCheck updateImg">'
					if(j == 11) td.innerHTML = '<input type="hidden" value="'+ data[i].memberId +'" name="memberId" readonly>'+'<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg">';
					
					tr.appendChild(td);
				}
				table.appendChild(tr);
				
			}
			document.querySelectorAll(".memberT td>img.updateImg").forEach((v, i) => {
				v.addEventListener("click", function() {changeMember(event)});
			});
			document.querySelectorAll(".memberT td>img.deleteImg").forEach((v, i) => {
				v.addEventListener("click", function() {adMemberDelete(event)});
			});
		}
	});
	
	
}




</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>