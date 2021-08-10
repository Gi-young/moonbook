<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<link rel="stylesheet" href="${path }/resources/css/myroom/layout.css">
<link rel="stylesheet" href="${path }/resources/css/memberGrade.css">
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="마이페이지 - KH문고" />
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="title" value="구매내역 - KH문고" />
		</jsp:include>
		<jsp:include page="/WEB-INF/views/common/myroomHead.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
		<div class="myroom_contents">
			<div class="content_title">
				<div class="bold">구매 내역 |</div>
				<div class="dateBox">
					<span> <input type="date" id="startDay">
					</span> - <span> <input type="date" id="endDay">
					</span>
					<button class="btn">조회</button>
				</div>
			</div>
			<div class="optionBox">
				<select class="selectBox">
					<option>---진행상황---</option>
				</select>
			</div>
			<div class="content_title">
				<div class="payCate" id="book">
					<a href="#"> 도서 </a>
				</div>
				<span class="padding10"> | </span>
				<div id="ebook">
					<a href="#"> e-Book </a>
				</div>
				<span class="padding10"> | </span>
				<div id="gift">
					<a href="#"> 기프트 </a>
				</div>
			</div>
			<div class="tbl_wrap">
				<table class="tbl_order">
					<tr>
						<th class="orderTh">상품</th>
						<th>결제금액</th>
						<th>결제날짜</th>
						<th>진행상황</th>
					</tr>
					<tr>
						<td><div class="flex">
								<div id="img">(대표)상품이미지</div>
								<div id="name">(대표)상품명</div>
							</div></td>
						<td id="price"><fmt:formatNumber value="${list[0].paidAmount }"
								type="currency" /></td>
						<td id="date">날짜</td>
						<td id="state">거래 완료</td>
					</tr>
				</table>
			</div>
			<div>${pageBar }</div>
		</div>
	</div>
</div>
<script>
	var date = new Date();
	
	var formattedDate = date.getFullYear()
			+ "-"
			+ (date.getMonth() + 1 < 9 ? ("0" + (date.getMonth() + 1)) : (date
					.getMonth() + 1)) + "-"
			+ (date.getDate() < 10 ? ("0" + date.getDate()) : date.getDate());
	$("#endDay").val(formattedDate);
	
	var formattedDate = (date.getFullYear() - 1)
			+ "-"
			+ (date.getMonth() + 1 < 9 ? ("0" + (date.getMonth() + 1)) : (date
					.getMonth() + 1)) + "-"
			+ (date.getDate() < 10 ? ("0" + date.getDate()) : date.getDate());
	$("#startDay").val(formattedDate);
	
	$("#ebook").click(e=>{
		$("#ebook").addClass("payCate");
		$("#book").removeClass("payCate");
		$("#gift").removeClass("payCate");
		$.ajax({
			type:'GET',
			data:{
				searchType:'ebook',
				startDate:$("#startDay").val(),
				finishDate:$("#finishDay").val()
			},
			url: '/member/myroom/payList.do',
			datatype:'json',
			success:function(payList){
				for(int i = 0; i < 5; i++){
					$("#img").val(${list[i]})
				}
			}
		})
	});
	
	$("#book").click(e=>{
		$("#book").addClass("payCate");
		$("#ebook").removeClass("payCate");
		$("#gift").removeClass("payCate");
		/* $.ajax({
			data:{
				searchType:'',
				startDate:$("#startDay").val(),
				finishDate:$("#finishDay").val()
			},
			url: '/member/myroom/payList.do',
		}) */
	});
	
	$("#gift").click(e=>{
		$("#gift").addClass("payCate");
		$("#ebook").removeClass("payCate");
		$("#book").removeClass("payCate");
		/* $.ajax({
			data:{
				searchType:'gift',
				startDate:$("#startDay").val(),
				finishDate:$("#finishDay").val()
			},
			url: '/member/myroom/payList.do',
		}) */
	});
</script>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>