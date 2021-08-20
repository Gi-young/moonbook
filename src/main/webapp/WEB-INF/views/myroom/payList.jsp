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
		<div class="myroom_contents" id="contents">
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
					<a href="${path}/member/myroom/payList.do"> 도서 </a>
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
				<table class="tbl_order" id="tbl">
					<tr>
						<th class="orderTh">상품</th>
						<th>결제금액</th>
						<th>결제날짜</th>
						<th>진행상황</th>
					</tr>
					<c:forEach var="bl" items="${list }" varStatus="status">
						<tr>
							<td><div class="flex">
									<div id="img">
										<img src="${bl.getBookOrderList().get(0).getImage()}">
									</div>
									<a href="#" class="margin_top15p">
										<div id="name">${bl.getBookOrderList().get(0).getTitle()}<c:if
												test="${bl.getBookOrderList().size() > 1 }">, 외 ${bl.getBookOrderList().size() }건</c:if>
										</div>
									</a>
								</div></td>
							<td id="price" style="width: 12%"><fmt:formatNumber
									value="${bl.paidAmount }" type="currency" /></td>
							<td id="date" class="fs11">${date.get(i) }</td>
							<td id="state" class="fs11">${bl.orderStatus }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="padding10" id="pageBar">
				<div id="oldPageBar">${pageBar }</div>
			</div>
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
		var param = new Object();
		param.searchType='ebook';
		param.startDate=$("#startDate").val();
		param.finishDate=$("#finishDate").val();
		$("#ebook").addClass("payCate");
		$("#book").removeClass("payCate");
		$("#gift").removeClass("payCate");
		$.ajax({
			url: '${path}/member/myroom/ebookPayList.do',
			type:'POST',
			dataType:'json',
			data:param,
			success:function(data){
				var trlength = $("#tbl tr").length;
				for(var t = 1; t < trlength; t++){
					$("#tbl tr")[t].remove();
				}
				
				for(var i = 0; i < data.list.length; i++){
					 $("#tbl").append('<tr><td><div class="flex"><div id="img"><img src="'+ data.list[i].bookOrderList[0].image+
							 '"/></div><a href="#" class="margin_top15p"><div id="name">'+data.list[i].bookOrderList[0].title+'<c:if test="'
							 +data.list.length+'>1">, 외'+ data.list.length+'건</c:if></div></a></div></td><td style="width:12%">'
							 +data.list[i].paidAmount+'</td><td id="date" class="fs11">'+data.date[i]+'</td><td id="state" class="fs11">'
							 +data.list[i].orderStatus+'</td>');
				}
				$("#pageBar").children().remove();
				$("#pageBar").append(data.pageBar);
			},
			error:error=>{
				console.log(error);
			}
		})
	});
	
	$("#gift").click(e=>{
		var param = new Object();
		$("#gift").addClass("payCate");
		$("#ebook").removeClass("payCate");
		$("#book").removeClass("payCate");
		param.searchType='gift';
		param.startDate=$("#startDate").val();
		param.finishDate=$("#finishDate").val();
		$.ajax({
			url: '${path}/member/myroom/giftPayList.do',
			type:'POST',
			dataType:'json',
			data:param,
			success:function(data){
				var trlength = $("#tbl tr").length;
				for(var t = 1; t < trlength; t++){
					$("#tbl tr")[1].remove();
				}
				
				for(var i = 0; i < data.list.length; i++){
					 $("#tbl").append('<tr><td><div class="flex"><div id="img"><img style="width:79px;height:122px;" src="'+ data.list[i].giftOrderList[0].gift_img+
							 '"/></div><a href="#" class="margin_top15p"><div id="name">'+data.list[i].giftOrderList[0].gift_title+'<c:if test="'
							 +data.list.length+'>1">, 외'+ data.list.length+'건</c:if></div></a></div></td><td style="width:12%">'
							 +data.list[i].paidAmount+'</td><td id="date" class="fs11">'+data.date[i]+'</td><td id="state" class="fs11">'
							 +data.list[i].orderStatus+'</td>');
				}				
				console.log($("#pageBar").children());
				$("#pageBar").children().remove();
				$("#pageBar").append(data.pageBar);
			},
			error:error=>{
				console.log(error);
			}
		})
	});
</script>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>