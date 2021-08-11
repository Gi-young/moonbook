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
<link rel="stylesheet" href="${path}/resources/css/admin/searchCoupon.css">
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
							<!-- <tr>
								<th>정렬방법</th>
								<td>
								<select name="type1">
									<option value="MEMBER_TOTAL_SALE" selected>총 매출</option>
									<option value="MEMBER_POINT" >회원포인트</option>
									<option value="MEMBER_VISIT" >방문횟수</option>
								</select>
								</td>
								<td>
									<input class="howASCSearch" type="radio" name="searchHow2" id="asc" value="ASC" checked><label for="asc">오름차순</label>
									<input class="howDESCSearch2" type="radio" name="searchHow2" id="desc" value="DESC"><label for="desc">내림차순</label>
								</td>
								<td><input type="button" value="조회하기" onclick="orderList(1,10);"></td>
							</tr> -->
							<tr>
								<th>검색하기</th>
								<td class="admin-search2">
								<select name="type15">
									<option value="COUPONLIST_NO" selected>쿠폰번호</option>
									<option value="COUPONLIST_NAME" >쿠폰이름</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text" name="searchCoupon10"> 
								</td>
								<td class="search-box">
									<img alt="검색하기"
									src="${path }/resources/img/admin/search.png" onclick="searchCouponL(1,10);">
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="couponT-container">
						<p class="memberTFont">총 <span class="turnRed">${totalContents }</span>개의 쿠폰이 있습니다.</p>
						<p class="memberTFont2">※ 회원등급번호, 할인금액, 발급 여부, 사용가능 일수, 쿠폰 이름만 수정 가능합니다.</p>
						<%-- <form action="${path }/admin/memberUpdate.do" name="admemberT" id="admemberT" method="post"> --%>
						<table class="couponT">
							
							<tr>
								<th>쿠폰리스트번호</th>
								<th>회원 등급번호</th>
								<th>할인금액</th>
								<th>발급 가능여부</th>
								<th>사용가능 일수</th>
								<th>쿠폰 이름</th>
								<th>쿠폰 이미지</th>
								<th>수정하기</th>
								<th>삭제하기</th>
							</tr>
							
							
							<c:forEach var="e" items="${list }">
							<tr>
									<td><input type="text" value="${e.couponlistNo }" name="couponlistNo" readonly></td>
									<td><input type="text" value="${e.couponlistMembergradeNo }" name="couponlistMembergradeNo" ></td>
									<td><input type="text" value="${e.couponlistAmount }" name="couponlistAmount" ></td>
									<td><input type="text" value="${e.couponlistForuse }" name="couponlistForuse"></td>
									<td><input type="text" value="${e.couponlistInvalid }" name="couponlistInvalid" ></td>
									<td><input type="text" value="${e.couponlistName }" name="couponlistName"></td>
									<td><input type="text" value="${e.couponImg }" name="couponImg " readonly></td>
									<td>
										<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="changeCouponV(event);" class="updateCheck updateImg">
									</td>
									
									<td>
										
											<input type="hidden" value="${e.couponlistNo}" name="couponlistNo" readonly>
											
											<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg" onclick="adCouponDelete(event);">
											
									
										</td>
								
							</tr>
							</c:forEach>
							

						</table>
						<!-- </form> -->
						
						<div id="pagebar-container10">
			        		${pageBar }
			        	</div> 
			        
					</div>
		</div>
	</div>
</div>


<script>
function adCouponDelete(event){
	let couponlistNo=$(event.target).prev().val();
	
	location.assign('${path}/admin/adCouponDelete.do?couponlistNo='+couponlistNo);
	
}


function changeCouponV(event){
	let couponlistNo=event.target.parentElement.parentElement.children[0].children[0].value;
	let couponlistMembergradeNo=event.target.parentElement.parentElement.children[1].children[0].value;
	let couponlistAmount=event.target.parentElement.parentElement.children[2].children[0].value;
	let couponlistForuse=event.target.parentElement.parentElement.children[3].children[0].value;
	let couponlistInvalid=event.target.parentElement.parentElement.children[4].children[0].value;
	let couponlistName=event.target.parentElement.parentElement.children[5].children[0].value;
	
	location.assign("${path}/admin/updateCouponlist.do?couponlistNo="+couponlistNo+"&couponlistMembergradeNo="+couponlistMembergradeNo+"&couponlistAmount="+couponlistAmount+"&couponlistForuse="+couponlistForuse+"&couponlistInvalid="+couponlistInvalid+"&couponlistName="+couponlistName);
	
} 

function searchCouponL(cPage,numPerpage){
	let type15 =document.getElementsByName("type15")[0].value;
	let search=document.getElementsByName("searchCoupon10")[0].value;
	
	$.ajax({
		url: "${path}/admin/searchCouponL.do",
		data:{
			type15 :type15,
			search:search,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data=>{
		document.querySelectorAll(".couponT td").forEach((v,i) => {
				v.remove();
			});
			console.dir( data);
			
			let table=document.querySelector(".couponT");
			for(let i=0;i<data.length;i++){
				let tr=document.createElement("tr");
				for(let j=0;j<9;j++){
					let td=document.createElement("td");
					td.style.border="1px solid black";
					td.style.height="27px";
					
					if(j == 0) td.innerHTML = "<input type='text' value='" + data[i].couponlistNo + "'>";
					if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].couponlistMembergradeNo + "'>";
					if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].couponlistAmount + "'>";
					if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].couponlistForuse + "'>";
					if(j == 4) td.innerHTML = "<input type='text' value='" + data[i].couponlistInvalid + "'>";
					if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].couponlistName + "'>";
					if(j == 6) td.innerHTML = "<input type='text' value='" + data[i].couponImg + "'>";
					if(j == 7) td.innerHTML = '<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="changeMemberV(event);" class="updateCheck updateImg">'
					if(j == 8) td.innerHTML = '<input type="hidden" value="'+ data[i].couponlistNo+'" name="couponlistNo" readonly>'+'<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg">';
					
					tr.appendChild(td);
				}
				table.appendChild(tr);
				
			}
			document.querySelectorAll(".couponT td>img.updateImg").forEach((v, i) => {
				v.addEventListener("click", function() {changeCouponV(event)});
			});
			document.querySelectorAll(".couponT td>img.deleteImg").forEach((v, i) => {
				v.addEventListener("click", function() {adCouponDelete(event)});
			});
		}
		
	});
	$.ajax({
		url: "${path}/admin/getPageBarSearchCouponList.do",
		data: {
			type15 :type15,
			search:search,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data => {
			$("#pagebar-container10").html(data[0]);
			$(".turnRed").html(data[1]);
			
		}
	});
} 






</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>