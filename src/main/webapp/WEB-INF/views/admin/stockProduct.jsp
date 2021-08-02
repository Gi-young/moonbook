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
<link rel="stylesheet" href="${path}/resources/css/admin/stockProduct.css">


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
									<input class="howASCSearch" type="radio" name="HowStockT" id="stockBookT" value="stockBookT" checked><label for="stockBookT">book</label>
									<input class="howDESCSearch2" type="radio" name="HowStockT" id="stockGiftT" value="stockGiftT"><label for="stockGiftT">gift</label>
								</td>
								<td>
								
									<span>재고 </span> <input type="number" style="width:60px; height:27px;"><span> 이상 </span><input type="number" style="width:60px; height:27px;"><span> 미만 </span>
								
								</td>
								<td>
								<input type="button" value="조회하기" onclick="orderList();">
								</td>
							</tr>
							<tr>
								<th>검색하기</th>
								<td class="admin-search2">
								<select name="type2">
									<option value="" selected>제품명</option>
									<option value="" >번호</option>
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
			<div class="stockT-container">
						<p class="memberTFont">총 <span class="turnRed">${totalContents }</span>개의 책이 있습니다.</p>
						<p class="memberTFont2">※ 책 제목, 가격, 출판사, 카테고리코드만 수정 가능합니다.</p>
						<%-- <form action="${path }/admin/memberUpdate.do" name="admemberT" id="admemberT" method="post"> --%>
						<table class="stockT">
							
							<tr>
								<th>책 번호</th>
								<th>책 제목</th>
								<th>저자</th>
								<th>가격</th>
								<th>ISBN</th>
								<th>출판사</th>
								<th>카테고리 코드</th>
								<th>재고</th>
								<th>판매량</th>
								<th>eBook판매량</th>
								<th>수정하기</th>
								<th>삭제하기</th>
							</tr>
							
							
							<c:forEach var="e" items="${list }">
							<tr>
									<td><input type="text" value="${e.bindNo }" name="bindNo" readonly></td>
									<td><input type="text" value="${e.title }" name="title" ></td>
									<td><input type="text" value="${e.author }" name="author" readonly></td>
									<td><input type="text" value="${e.price }" name="price"></td>
									<td><input type="text" value="${e.isbn }" name="isbn" readonly></td>
									<td><input type="text" value="${e.publisher }" name="publisher"></td>
									<td><input type="text" value="${e.categoryCode }" name="categoryCode"></td>
									<td><input type="text" value="${e.stock }" name="stock" readonly></td>
									<td><input type="text" value="${e.salesVolume }" name="salesVolume" readonly></td>
									<td><input type="text" value="${e.ebookSalesVolume }" name="ebookSalesVolume" readonly></td>
									<td>
										<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="changeMemberV(event);" class="updateCheck updateImg">
									</td>
									
									<td>
										
											<input type="hidden" value="${e.bindNo }" name="bindNo" readonly>
											
											<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg" onclick="adMemberDelete(event);">
											
									
										</td>
								
							</tr>
							</c:forEach>
							

						</table>
						<!-- </form> -->
						
						<div id="pagebar-container">
			        		${pageBar }
			        	</div> 
			        
					</div>
					<div class="stockT-container2" style="display:none;">
						<p class="memberTFont">총 <span class="turnRed">${totalContents2 }</span>개의 상품이 있습니다.</p>
						<p class="memberTFont2">※ 상품명, 상품소개, 가격, 제조사, 제조국, AS/상담여부, 수입여부, 판매여부  수정 가능합니다.</p>
						<%-- <form action="${path }/admin/memberUpdate.do" name="admemberT" id="admemberT" method="post"> --%>
						<table class="stockT2">
							
							<tr>
								<th>상품 번호</th>
								<th>상품명</th>
								<th>상품소개</th>
								<th>가격</th>
								<th>제조사</th>
								<th>제조국</th>
								<th>AS/상담여부</th>
								<th>수입여부</th>
								<th>재고</th>
								<th>판매여부</th>
								<th>카테고리코드</th>
								<th>수정하기</th>
								<th>삭제하기</th>
							</tr>
							
							
							<c:forEach var="g" items="${list2 }">
							<tr>
									<td><input type="text" value="${g.gift_no }" name="gift_no" readonly></td>
									<td><input type="text" value="${g.gift_title }" name="gift_title" ></td>
									<td><input type="text" value="${g.gift_content }" name="gift_content" ></td>
									<td><input type="text" value="${g.gift_price }" name="author" readonly></td>
									<td><input type="text" value="${g.gift_maker }" name="gift_price"></td>
									<td><input type="text" value="${g.gift_made }" name="gift_made" readonly></td>
									<td><input type="text" value="${g.gift_as }" name="gift_as" readonly></td>
									<td><input type="text" value="${g.gift_import }" name="gift_import"></td>
									<td><input type="text" value="${g.gift_count }" name="gift_count"></td>
									<td><input type="text" value="${g.gift_for_sale }" name="gift_for_sale" readonly></td>
									<td><input type="text" value="${g.gift_giftcate_code}" name="gift_giftcate_code" readonly></td>
									<td>
										<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="changeMemberV(event);" class="updateCheck updateImg">
									</td>
									
									<td>
										
											<input type="hidden" value="${g.gift_no }" name="gift_no" readonly>
											
											<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg" onclick="adMemberDelete(event);">
											
									
										</td>
								
							</tr>
							</c:forEach>
							

						</table>
						<!-- </form> -->
						
						<div id="pagebar-container">
			        		${pageBar2 }
			        	</div> 
			        
					</div>
		</div>
	</div>
</div>


<script>
$("input[name=HowStockT]").click(e=>{
	$("input[name=HowStockT]").each((i,v)=>{
		if(v.checked){
			if(v.value=="stockBookT"){
				$(".stockT-container").css("display","block");
				$(".stockT-container2").css("display","none");
			}else{
				$(".stockT-container").css("display","none");
				$(".stockT-container2").css("display","block");
			}
		}
	})
})
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