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
<link rel="stylesheet" href="${path}/resources/css/admin/adminAuctionCate.css">
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
								<th>경매 종류 추가</th>
								<td class="admin-search2">
								<select name="type2">
									<option value="COUPONLIST_NO" selected>도서</option>
									<option value="COUPONLIST_NAME" >문구</option>
									<option value="COUPONLIST_NAME" >기타</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text" name="searchHow3"> 
								</td>
								<td class="search-box">
									<button>추가</button> 
								</td>
							</tr>
							<tr>
								<th>경매 종류 추가</th>
								<td class="admin-search2">
								<select name="type2">
									<option value="COUPONLIST_NO" selected>도서</option>
									<option value="COUPONLIST_NAME" >문구</option>
									<option value="COUPONLIST_NAME" >기타</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text" name="searchHow3"> 
								</td>
								<td class="search-box">
									<button>추가</button> 
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="memberT-container">
				<div class="auction_box1">
					<ul class="auction_cate2" >
						<li>도서</li>
					</ul>
					<ul class="auction_cate1" >
						<c:forEach var="e" items="${list }">
							<c:if test="${e.auctioncateName eq '도서'}">
								<li>${e.auctioncateFirst}</li>
							</c:if> 
						</c:forEach>
					</ul>
				</div>
				<div class="auction_box1">
					<ul class="auction_cate2" >
						<li>문구</li>
					</ul>
					<ul class="auction_cate1">
						<li>test1</li>
						<li>test1</li>
						<li>test1</li>
						<li>test1</li>
						
					</ul>
				</div>
				
				<div class="auction_box1">
					<ul class="auction_cate2" >
						<li>기타</li>
					</ul>
					<ul class="auction_cate1">
						<li>test1</li>
						<li>test1</li>
						<li>test1</li>
						<li>test1</li>
						
					</ul>
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

function searchMT(cPage,numPerpage){
	let type2 =document.getElementsByName("type2")[0].value;
	let search=document.getElementsByName("searchHow3")[0].value;
	
	$.ajax({
		url: "${path}/admin/searchTextMemberList.do",
		data:{
			type2 :type2,
			search:search,
			cPage: cPage,
			numPerpage: numPerpage
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
	$.ajax({
		url: "${path}/admin/getPageBarSearchTextMemberList.do",
		data: {
			type2 :type2,
			search:search,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data => {
			$("#pagebar-container3").html(data[0]);
			$(".turnRed").html(data[1]);
			
		}
	});
} 

function orderList(cPage,numPerpage){
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
			order: order==="" ? "asc":order,
			cPage: cPage,
			numPerpage: numPerpage
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
	$.ajax({
		url: "${path}/admin/getPageBarOrderedMemberList.do",
		data: {
			type1: type1,
			order: order==="" ? "asc":order,
			cPage: cPage,
			numPerpage: numPerpage
		},
		success: data => {
			$("#pagebar-container3").html(data[0]);
			$(".turnRed").html(data[1]);
			
		}
	});
	
	
}




</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>