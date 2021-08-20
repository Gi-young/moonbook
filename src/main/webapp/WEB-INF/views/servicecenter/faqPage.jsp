<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/service/faqPage.css">

<div class="service-container">
	<div class="service-box1">
		<div class="service-box3">
			<jsp:include page="/WEB-INF/views/common/serviceSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="service-box2">
			<div class="service-box4">
					<div class="service-search3">
				<form class="service-search" action="">
						<table class="faqSearchTable">
							
							<tr>
								<th>FAQ 검색</th>
								<td class="search-box">
									<select name="type30">
										<option value="주문결제">주문결제</option>
										<option value="배송수령안내">배송수령안내</option>
										<option value="반품교환환불">반품교환환불</option>
										<option value="중고장터">중고장터</option>
										<option value="ebook">ebook</option>
										<option value="기타">기타</option>
									</select>
								</td>
								<td class="search-box">
									<input type="text" name="searchFaq"> 
									
								</td>
								<td class="search-box">
									<img alt="검색하기"
									src="${path }/resources/img/admin/search.png" onclick="searchFaqList();">
								</td>
							</tr>
							<tr>
								<th>FAQ 질문하기</th>
								<td class="search-box">
									<select name="type31">
										<option value="주문결제">주문결제</option>
										<option value="배송수령안내">배송수령일안내</option>
										<option value="반품교환환불">반품교환환불</option>
										<option value="중고장터">중고장터</option>
										<option value="ebook">ebook</option>
										<option value="기타">기타</option>
									</select>
								</td>
								<td class="search-box">
									<input type="text" name="askFaq"> 
								</td>
								<td class="search-box">
									<input type="button" value="등록" onclick="inputFaq()" class="adminBtn">
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="FAQlist-container">
						<p class="faqFont">※ FAQ 질문 / 답변</p>
						
						<div class="faqList-box1">
						<ul class="faqsideMenu">
						<c:forEach var="c" items="${list}" varStatus="vs">
							<li class="sub-faqmenu${vs.index} faqclassName">[${c.faqcgNum.faqcgName}] ${c.faqAsked}<span class="faqOx1"><c:if test="${c.faqStatus==0}">(접수대기)</c:if></span><span class="faqOx2"><c:if test="${c.faqStatus==1}">(답변완료)</c:if></span></li>
							<ul class="sub_faqcontent${vs.index} faqclassName2">
							<li class="last_li">
								<c:forEach var="a" items="${c.faqAnswer.split('.-')}" varStatus="vs">
									<c:if test="${!vs.last}">
										${a}<br>
									</c:if>
									<c:if test="${vs.last}">
										${a}
									</c:if>
								</c:forEach>
							
								
							</li>
							</ul>
							</c:forEach> 
							
							
						
						
						</ul>
						
						
						</div>
						
						
						<div id="pagebar-container">
			        		${pageBar }
			        	</div> 
			        </div>
		</div>
	</div>
</div>

<!-- 다음에는 슬라이드 토글줄때 for문 말고 next.val로 가져오자.. -->

<script>
/* window.onload = function () {
	for(let i=0; i<${list.size()}; i++) {
		$('.sub_faqcontent' + i).css("display","none");
	} 
	for(let j=0; j<${list.size()}; j++){
		$('.sub-faqmenu' + j).css("display","flex");
		$('.sub-faqmenu' + j).css("border","1px solid black");
		$('.sub-faqmenu' + j).css("width","710px");
		$('.sub-faqmenu' + j).css("height","40px");
		$('.sub-faqmenu' + j).css("justify-content","center");
		$('.sub-faqmenu' + j).css("align-items","center");
		$('.sub-faqmenu' + j).css("font-weight","bold");
		$('.sub-faqmenu' + j).css("color","#582810");
	}  
} */

for(let i=0; i<${list.size()}; i++) {
	$('.sub-faqmenu' + i).click(function() {
		
		$('.sub_faqcontent' + i).slideToggle('slow');
		$('.sub_faqcontent' + i).css("display","block");
		
	});
}


function inputFaq(){
	let type31=document.getElementsByName("type31")[0].value;
	let askFaq=document.getElementsByName("askFaq")[0].value;
	
	location.assign("${path}/service/inputAskFaq.do?type31="+type31+"&askFaq="+askFaq);
}

function searchFaqList(){
	let type30=document.getElementsByName("type30")[0].value;
	let searchFaq=document.getElementsByName("searchFaq")[0].value;
	
	$.ajax({
		url: "${path}/service/searchFaq.do",
		data: {
			type30:type30,
			searchFaq:searchFaq
			
		},
		success: data => {
			console.log(data);
			document.querySelectorAll(".faqsideMenu li").forEach((v,i) => {
				v.remove();
			});
			document.querySelectorAll(".faqsideMenu li ul").forEach((v,i) => {
				v.remove();
			});
			document.querySelectorAll(".faqsideMenu li ul li").forEach((v,i) => {
				v.remove();
			});
			
			let checkOx;
			let checkOx2;
			let totalUl=document.querySelector(".faqsideMenu");
			for(let i=0;i<data.length;i++){
				let li=document.createElement("li");
				li.classList.add('sub-faqmenu'+i);
				li.classList.add('faqclassName');
				
				if(data[i].faqStatus==1){
					checkOx="<span class='faqOx2'>" +'(답변완료)'+"</span>";
				}else if(data[i].faqStatus==0){
					checkOx="<span class='faqOx1'>" + '(접수대기)'+"</span>";
				}
				li.innerHTML ="[" + data[i].faqcgNum.faqcgName + "] " + data[i].faqAsked+checkOx;
				
				let faqsplit;
				
				faqsplit=data[i].faqAnswer.split(/.-/).join('<br>');
				
				console.log(faqsplit);
				
					let innerUl=document.createElement("ul");
					innerUl.classList.add('sub_faqcontent'+i);
					innerUl.classList.add('faqclassName2');
					if(data[i].faqAnswer!=null){
						innerUl.innerHTML = "<li class='last_li'>"+faqsplit+"</li>";
					}
					
				totalUl.appendChild(li);
				totalUl.appendChild(innerUl);
				
			}
			for(let i=0; i<${list.size()}; i++) {
				$('.sub-faqmenu' + i).click(function() {
					
					$('.sub_faqcontent' + i).slideToggle('slow');
					$('.sub_faqcontent' + i).css("display","block");
					
				});
			}
			
			
			
		}
	});
		
} 


/* $('.sub-menu1').click(function() {
	$('.sub_content1').slideToggle('slow');

});
$('.sub-menu2').click(function() {
	$('.sub_content2').slideToggle('slow');

});
$('.sub-menu3').click(function() {
	$('.sub_content3').slideToggle('slow');

});
$('.sub-menu4').click(function() {
	$('.sub_content4').slideToggle('slow');

});
$('.sub-menu5').click(function() {
	$('.sub_content5').slideToggle('slow');

});
$('.sub-menu6').click(function() {
	$('.sub_content6').slideToggle('slow');

});
$('.sub-menu7').click(function() {
	$('.sub_content7').slideToggle('slow');

});
$('.sub-menu8').click(function() {
	$('.sub_content8').slideToggle('slow');

}); */
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>