<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet"
	href="${path}/resources/css/admin/stockProduct.css">
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

								<td><input class="howASCSearch" type="radio"
									name="HowStockT" id="stockBookT" value="stockBookT" checked><label
									for="stockBookT" >book</label> <input class="howDESCSearch2"
									type="radio" name="HowStockT" id="stockGiftT"
									value="stockGiftT" ><label for="stockGiftT">gift</label>
								</td>
								<td><span>재고 </span> <input type="number"
									style="width: 60px; height: 27px;" min="0" name="stockNum1"><span>
										이상 </span><input type="number" style="width: 60px; height: 27px;"
									min="1" name="stockNum2"><span> 미만 </span></td>
								<td><input type="button" value="조회하기"
									onclick="orderList3(1,10);"></td>
							</tr>
							<tr>
								<th>검색하기</th>
								<td class="admin-search2"><select name="type4">
										<option value="title" selected>제품명</option>
										<option value="no">번호</option>

								</select></td>
								<td class="search-box"><input type="text" name="searchHow5">
								</td>
								<td class="search-box"><img alt="검색하기"
									src="${path }/resources/img/admin/search.png"
									onclick="searchStockT();"></td>
							</tr>
						</table>


					</form>
				</div>
			</div>
			<div class="stockT-container">
				<p class="memberTFont">
					총 <span class="turnRed1">${totalContents }</span>개의 책이 있습니다.
				</p>
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
							<td><input type="text" value="${e.bindNo }" name="bindNo"
								readonly></td>
							<td><input type="text" value="${e.title }" name="title"></td>
							<td><input type="text" value="${e.author }" name="author"
								readonly></td>
							<td><input type="text" value="${e.price }" name="price"></td>
							<td><input type="text" value="${e.isbn }" name="isbn"
								readonly></td>
							<td><input type="text" value="${e.publisher }"
								name="publisher"></td>
							<td><input type="text" value="${e.categoryCode }"
								name="categoryCode"></td>
							<td><input type="text" value="${e.stock }" name="stock"
								readonly></td>
							<td><input type="text" value="${e.salesVolume }"
								name="salesVolume" readonly></td>
							<td><input type="text" value="${e.ebookSalesVolume }"
								name="ebookSalesVolume" readonly></td>
							<td><img alt="수정하기"
								src="${path }/resources/img/admin/checkgreen.png"
								onclick="changeStockV(event);" class="updateCheck updateImg">
							</td>

							<td><input type="hidden" value="${e.bindNo }" name="bindNo"
								readonly> <img
								src="${path }/resources/img/admin/delete2.png" alt=""
								class="updateCheck deleteImg" onclick="adStockDelete(event);">


							</td>

						</tr>
					</c:forEach>


				</table>
				<!-- </form> -->

				<div id="pagebar-container1">
			        ${pageBar }
				</div>

			</div>
			<div class="stockT-container2" style="display:none;">
				<p class="memberTFont">
					총 <span class="turnRed2">${totalContents2 }</span>개의 상품이 있습니다.
				</p>
				<p class="memberTFont2">※ 상품명, 상품소개, 가격, AS/상담여부,카테고리코드 수정
					가능합니다.</p>
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
							<td><input type="text" value="${g.gift_no }" name="gift_no"
								readonly></td>
							<td><input type="text" value="${g.gift_title }"
								name="gift_title"></td>
							<td><input type="text" value="${g.gift_content }"
								name="gift_content"></td>
							<td><input type="text" value="${g.gift_price }"
								name="gift_price"></td>
							<td><input type="text" value="${g.gift_maker }"
								name="gift_maker" readonly></td>
							<td><input type="text" value="${g.gift_made }"
								name="gift_made" readonly></td>
							<td><input type="text" value="${g.gift_as }" name="gift_as"></td>
							<td><input type="text" value="${g.gift_import }"
								name="gift_import" readonly></td>
							<td><input type="text" value="${g.gift_count }"
								name="gift_count" readonly></td>
							<td><input type="text" value="${g.gift_for_sale }"
								name="gift_for_sale" readonly></td>
							<td><input type="text" value="${g.gift_giftcate_code}"
								name="gift_giftcate_code"></td>
							<td><img alt="수정하기"
								src="${path }/resources/img/admin/checkgreen.png"
								onclick="changeStockV2(event);" class="updateCheck updateImg">
							</td>

							<td><input type="hidden" value="${g.gift_no }"
								name="gift_no" readonly> <img
								src="${path }/resources/img/admin/delete2.png" alt=""
								class="updateCheck deleteImg" onclick="adStockDelete2(event);">


							</td>

						</tr>
					</c:forEach>


				</table>
				<!-- </form> -->

				<div id="pagebar-container2">
			        ${pageBar2 }
				</div>

			</div>
		</div>
	</div>
</div>


<script>

window.onload = function () {
	let stockParam = "${stockParam}";
	
	console.log("test : " + stockParam);
	
	if (stockParam != null && stockParam != "") {
		
		if(stockParam=="book"){
			$("#stockBookT").attr("checked","checked");
			$(".stockT-container").css("display","block");
			$(".stockT-container2").css("display","none");
			
		}else if(stockParam=="gift"){
			$("#stockGiftT").attr("checked","checked");
			$(".stockT-container").css("display","none");
			$(".stockT-container2").css("display","block");
			
		}
	}
	
}  

/* $("input[name=HowStockT]").click(e=>{
	$("input[name=HowStockT]").each((i,v)=>{
		if(v.checked){
			if(v.value == "stockBookT") location.assign("${path}/admin/stockProductPage.do?stockParam="+"book");
			else location.assign("${path}/admin/stockProductPage.do?stockParam="+"gift");
			
		}
	});
}); */

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
/* $("#pagebar-container1 li,#pagebar-container1 a").click(e=>{ 
	$("#stockBookT").attr("checked","checked");
	$(".stockT-container").css("display","block");
	$(".stockT-container2").css("display","none");
})
$("#pagebar-container2 li,#pagebar-container1 a").click(e=>{ 
	$("#stockGiftT").attr("checked","checked");
	$(".stockT-container").css("display","none");
	$(".stockT-container2").css("display","block");
}) */

function adStockDelete(event){
	let bindNo=event.target.parentElement.parentElement.children[0].children[0].value;
	
	$.ajax({
		url:"${path}/admin/stockTDelete.do",
		data: {
			bindNo:bindNo,
		},
		success: data=>{
			if(data){
				alert("book 삭제가 정상적으로 성공 하였습니다");
				
			}else if(!data){
				alert("book 삭제 실패 하였습니다");
				
			}
			location.assign("${path}/admin/stockProductPage.do");
		}
	})
}

function adStockDelete2(event){
	let gift_no=event.target.parentElement.parentElement.children[0].children[0].value;
	
	$.ajax({
		url:"${path}/admin/stockTDelete2.do",
		data: {
			gift_no:gift_no,
		},
		success: data=>{
			if(data){
				alert("gift 삭제가 정상적으로 성공 하였습니다");
				
			}else if(!data){
				alert("gift 삭제 실패 하였습니다");
				
			}
			location.assign("${path}/admin/stockProductPage.do");
		}
	})
}


function changeStockV(event){
	let bindNo=event.target.parentElement.parentElement.children[0].children[0].value;
	let title=event.target.parentElement.parentElement.children[1].children[0].value;
	let price=event.target.parentElement.parentElement.children[3].children[0].value;
	let publisher=event.target.parentElement.parentElement.children[5].children[0].value;
	let categoryCode=event.target.parentElement.parentElement.children[6].children[0].value;

	$.ajax({
		url:"${path}/admin/stockTUpdate.do",
		data: {
			bindNo:bindNo,
			title:title,
			price:price,
			publisher:publisher,
			categoryCode:categoryCode
		},
		success: data=>{
			if(data){
				alert("book 수정이 정상적으로 성공 하였습니다");
				
			}else if(!data){
				alert("book 수정 실패 하였습니다");
				
			}
			location.assign("${path}/admin/stockProductPage.do");
		}
	})
} 

function changeStockV2(event){
	let gift_no=event.target.parentElement.parentElement.children[0].children[0].value;
	let gift_title=event.target.parentElement.parentElement.children[1].children[0].value;
	let gift_content=event.target.parentElement.parentElement.children[2].children[0].value;
	let gift_price=event.target.parentElement.parentElement.children[3].children[0].value;
	let gift_as=event.target.parentElement.parentElement.children[6].children[0].value;
	let gift_giftcate_code=event.target.parentElement.parentElement.children[10].children[0].value;
	
	$.ajax({
		url:"${path}/admin/stockTUpdate2.do",
		data: {
			gift_no : gift_no,
			gift_title : gift_title,
			gift_content : gift_content,
			gift_price : gift_price,
			gift_as : gift_as,
			gift_giftcate_code : gift_giftcate_code
		},
		success: data=>{
			if(data){
				alert("gift 수정이 정상적으로 성공 하였습니다");
				
			}else if(!data){
				alert("gift 수정 실패 하였습니다");
				
			}
			location.assign("${path}/admin/stockProductPage.do");
		}
	})
}

const searchStockT =()=>{
	let typeT = "";
	let type4 =document.getElementsByName("type4")[0].value;
	let search5=document.getElementsByName("searchHow5")[0].value;
	document.getElementsByName("HowStockT").forEach((v,i) => {
		if (v.checked) {
			typeT = v.value;
		}
	});
	
	if(typeT === "stockBookT"){
		$.ajax({
			url: "${path}/admin/searchTextStockList.do",
			data: {
				type4 :type4,
				search5:search5
				
			},
			success: data=>{
				document.querySelectorAll(".stockT td").forEach((v,i) => {
					v.remove();
				});
				
				console.dir( data);
				
				let table=document.querySelector(".stockT");
				for(let i=0;i<data.length;i++){
					let tr=document.createElement("tr");
					for(let j=0;j<12;j++){
						let td=document.createElement("td");
						td.style.border="1px solid black";
						td.style.height="27px";
						if(j == 0) td.innerHTML = "<input type='text' value='" + data[i].bindNo+"'>";
						if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].title + "'>";
						if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].author + "'>";
						if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].price + "'>";
						if(j == 4) td.innerHTML = "<input type='text' value='" + data[i].isbn + "'>";
						if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].publisher + "'>";
						if(j == 6) td.innerHTML = "<input type='text' value='" + data[i].categoryCode + "'>";
						if(j == 7) td.innerHTML = "<input type='text' value='" + data[i].stock + "'>";
						if(j == 8) td.innerHTML = "<input type='text' value='" + data[i].salesVolume + "'>";
						if(j == 9) td.innerHTML = "<input type='text' value='" + data[i].ebookSalesVolume + "'>";
						if(j == 10) td.innerHTML = '<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="" class="updateCheck updateImg">'
						if(j == 11) td.innerHTML = '<input type="hidden" value="'+ data[i].bindNo +'" name="bindNo" readonly>'+'<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg">';
						
						tr.appendChild(td);
					}
					table.appendChild(tr);
					
				}
				document.querySelectorAll(".stockT td>img.updateImg").forEach((v, i) => {
					v.addEventListener("click", function() {changeStockV(event)});
				});
				document.querySelectorAll(".stockT td>img.deleteImg").forEach((v, i) => {
					v.addEventListener("click", function() {adStockDelete(event)});
				});
			}
			
		});
	}else if(typeT === "stockGiftT"){
		$.ajax({
			url: "${path}/admin/searchTextStockList3.do",
			data: {
				type4 :type4,
				search5:search5
			},
			success: data=>{
				
				document.querySelectorAll(".stockT2 td").forEach((v,i) => {
					v.remove();
				});
				console.dir( data);
				
				let table=document.querySelector(".stockT2");
				for(let i=0;i<data.length;i++){
					let tr=document.createElement("tr");
					for(let j=0;j<13;j++){
						let td=document.createElement("td");
						td.style.border="1px solid black";
						td.style.height="27px";
						if(j == 0) td.innerHTML = "<input type='text' value='" + data[i].gift_no+"'>";
						if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].gift_title + "'>";
						if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].gift_content + "'>";
						if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].price + "'>";
						if(j == 4) td.innerHTML = "<input type='text' value='" + data[i].isbn + "'>";
						if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].publisher + "'>";
						if(j == 6) td.innerHTML = "<input type='text' value='" + data[i].categoryCode + "'>";
						if(j == 7) td.innerHTML = "<input type='text' value='" + data[i].stock + "'>";
						if(j == 8) td.innerHTML = "<input type='text' value='" + data[i].salesVolume + "'>";
						if(j == 9) td.innerHTML = "<input type='text' value='" + data[i].ebookSalesVolume + "'>";
						if(j == 10) td.innerHTML = '<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="" class="updateCheck updateImg">'
						if(j == 11) td.innerHTML = '<input type="hidden" value="'+ data[i].gift_no +'" name="bindNo" readonly>'+'<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg">';
						
						tr.appendChild(td);
					}
					table.appendChild(tr);
					
				}
				document.querySelectorAll(".stockT2 td>img.updateImg").forEach((v, i) => {
					v.addEventListener("click", function() {changeStockV2(event)});
				});
				document.querySelectorAll(".stockT2 td>img.deleteImg").forEach((v, i) => {
					v.addEventListener("click", function() {adStockDelete2(event)});
				});
			}
			
		});
	}
	
}

function orderList3(cPage, numPerpage) {
	console.log("test");
	let typeT = "";
	let stockNum1= document.getElementsByName("stockNum1")[0].value;
	let stockNum2= document.getElementsByName("stockNum2")[0].value;
	document.getElementsByName("HowStockT").forEach((v,i) => {
		if (v.checked) {
			typeT = v.value;
		}
	});
	
	if(typeT === "stockBookT"){
		console.log("book");
		console.log(typeT);
		
		$.ajax({
			url: "${path}/admin/orderStockList.do",
			data: {
				typeT: typeT,
				stockNum1: stockNum1,
				stockNum2: stockNum2,
				cPage: cPage,
				numPerpage: numPerpage
			},
			success: data => {
				document.querySelectorAll(".stockT td").forEach((v,i) => {
					v.remove();
				});
				
				let table=document.querySelector(".stockT");
				for(let i=0;i<data.length;i++){
					let tr=document.createElement("tr");
					for(let j=0;j<12;j++){
						let td=document.createElement("td");
						td.style.border="1px solid black";
						td.style.height="27px";
						if(j == 0) td.innerHTML = "<input type='text' value='" + data[i].bindNo+"'>";
						if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].title + "'>";
						if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].author + "'>";
						if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].price + "'>";
						if(j == 4) td.innerHTML = "<input type='text' value='" + data[i].isbn + "'>";
						if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].publisher + "'>";
						if(j == 6) td.innerHTML = "<input type='text' value='" + data[i].categoryCode + "'>";
						if(j == 7) td.innerHTML = "<input type='text' value='" + data[i].stock + "'>";
						if(j == 8) td.innerHTML = "<input type='text' value='" + data[i].salesVolume + "'>";
						if(j == 9) td.innerHTML = "<input type='text' value='" + data[i].ebookSalesVolume + "'>";
						if(j == 10) td.innerHTML = '<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="" class="updateCheck updateImg">'
						if(j == 11) td.innerHTML = '<input type="hidden" value="'+ data[i].bindNo +'" name="bindNo" readonly>'+'<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg">';
						
						tr.appendChild(td);
					}
					table.appendChild(tr);
					
				}
				document.querySelectorAll(".stockT td>img.updateImg").forEach((v, i) => {
					v.addEventListener("click", function() {changeStockV(event)});
				});
				document.querySelectorAll(".stockT td>img.deleteImg").forEach((v, i) => {
					v.addEventListener("click", function() {adStockDelete(event)});
				});
			}
		});
		
		$.ajax({
			url: "${path}/admin/getPageBarOrderList.do",
			data: {
				typeT: typeT,
				stockNum1: stockNum1,
				stockNum2: stockNum2,
				cPage: cPage,
				numPerpage: numPerpage
			},
			success: data => {
				console.log("success");
				console.log(data);
				$("#pagebar-container1").html(data[0]);
				$(".turnRed1").html(data[1]);
				
			}
		});
	}else if(typeT === "stockGiftT"){
		console.log("gift");
		console.log(typeT);
		
		$.ajax({
			url: "${path}/admin/orderStockList3.do",
			data: {
				typeT: typeT,
				stockNum1: stockNum1,
				stockNum2: stockNum2,
				cPage: cPage,
				numPerpage: numPerpage
			},
			success: data => {
				
				console.log("gift success");
				
				console.log(data);
				
				document.querySelectorAll(".stockT2 td").forEach((v,i) => {
					v.remove();
				});
				
				let table=document.querySelector(".stockT2");
				for(let i=0;i<data.length;i++){
					
					
					let tr=document.createElement("tr");
					for(let j=0;j<13;j++){
						
						console.log("td test");
						
						let td=document.createElement("td");
						td.style.border="1px solid black";
						td.style.height="27px";
						if(j == 0) td.innerHTML = "<input type='text' value='" + data[i].gift_no+"'>";
						if(j == 1) td.innerHTML = "<input type='text' value='" + data[i].gift_title + "'>";
						if(j == 2) td.innerHTML = "<input type='text' value='" + data[i].gift_content + "'>";
						if(j == 3) td.innerHTML = "<input type='text' value='" + data[i].gift_price + "'>";
						if(j == 4) td.innerHTML = "<input type='text' value='" + data[i].gift_maker + "'>";
						if(j == 5) td.innerHTML = "<input type='text' value='" + data[i].gift_made + "'>";
						if(j == 6) td.innerHTML = "<input type='text' value='" + data[i].gift_as + "'>";
						if(j == 7) td.innerHTML = "<input type='text' value='" + data[i].gift_import + "'>";
						if(j == 8) td.innerHTML = "<input type='text' value='" + data[i].gift_count + "'>";
						if(j == 9) td.innerHTML = "<input type='text' value='" + data[i].gift_for_sale + "'>";
						if(j == 10) td.innerHTML = "<input type='text' value='" + data[i].gift_giftcate_code + "'>";
						if(j == 11) td.innerHTML = '<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="" class="updateCheck updateImg">'
						if(j == 12) td.innerHTML = '<input type="hidden" value="'+ data[i].gift_no +'" name="bindNo" readonly>'+'<img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck deleteImg">';
						
						tr.appendChild(td);
					}
					table.appendChild(tr);
					
				}
				document.querySelectorAll(".stockT2 td>img.updateImg").forEach((v, i) => {
					v.addEventListener("click", function() {changeStockV2(event)});
				});
				document.querySelectorAll(".stockT2 td>img.deleteImg").forEach((v, i) => {
					v.addEventListener("click", function() {adStockDelete2(event)});
				});
			}
		});
		$.ajax({
			url: "${path}/admin/getPageBarOrderList3.do",
			data: {
				typeT: typeT,
				stockNum1: stockNum1,
				stockNum2: stockNum2,
				cPage: cPage,
				numPerpage: numPerpage
			},
			success: data => {
				console.log("success");
				console.log(data);
				$("#pagebar-container2").html(data[0]);
				$(".turnRed2").html(data[1]);
			}
		});
	}
	
}




</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>
