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
	<jsp:param name="title" value="쿠폰함 - 문곰책방" />
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
		<div class="myroom_contents">
			<jsp:include page="/WEB-INF/views/common/myroomHead.jsp">
				<jsp:param value="" name="" />
			</jsp:include>
			<table class="tbl_nextGrade">
				<tr>
					<c:forEach var="mg" items="${allMembergrade }">
						<c:if test="${membergrade.membergradeNo >= mg.membergradeNo}">
							<th><img
								src="${path }/resources/images/${mg.membergradeImg }"></th>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="mg" items="${allMembergrade }" varStatus="status">
						<c:if test="${membergrade.membergradeNo >= mg.membergradeNo}">
							<td>
								<ul>
									<c:forEach var="c" items="${coupon }">
										<c:if
											test="${c.couponlistMembergradeNo == mg.membergradeNo && c.couponCanuse == 'Y'}">
											<li class="padding10"><img
												src="${path }/resources/upload/admin/${c.couponImg}">
												<div class="padding10">${c.couponlistName }</div></li>
										</c:if>
									</c:forEach>
								</ul>
							</td>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<div class="content_middle padding10 bold margin_top2e">
				<h3>사용한 쿠폰내역</h3>
			</div>
			<table class="tbl_nextGrade" id="tbl">
				<tr>
					<th>주문번호</th>
					<th>사용한쿠폰</th>
					<th>사용날짜</th>
				</tr>
				<c:forEach var="useC" items="${uc }">
					<c:if test="${useC.couponCanuse == 'N' }">
						<tr>
							<td class="fs8"><a href="${path }/member/myroom/orderDetail.do?orderNo=${useC.orderNo}">${useC.getOrderNo() }</a></td>
							<td class="fs11">${useC.couponlistName }</td>
							<td><fmt:formatDate value="${useC.orderDate }"
									pattern="yyyy.MM.dd" /></td>
						</tr>
					</c:if>
				</c:forEach>

			</table>
			<div id="pageBar">${pageBar }</div>
		</div>
	</div>
</div>
<script>
	function fn_paging2(pageNo) {
		var param = new Objec();
		param.pageNo = pageNo;
		$.ajax({
			url : "${path}/member/myroom/usedCoupon.do",
			type : 'POST',
			dataType : 'json',
			data : param,
			success : function(data) {
				var trlength = $("#tbl tr").length;
				for (var t = 1; t < trlength; t++) {
					$("#tbl tr")[1].remove();
				}

				for (var i = 0; i < data.list.length; i++) {
					if (data.list[i].couponCanuse == 'N') {

						$("#tbl").append(
								'<tr><td class="fs8"><a href="${path}/member/myroom/orderDetail.do?orderNo="'+data.list[i].orderNo+'>' + data.list[i].orderNo
										+ '</a></td><td class="fs11">'
										+ data.list[i].couponlistName
										+ '</td><td>' + data.list[i].orderDate
										+ '</td></tr>');
					}
				}
				$("#pageBar").children().remove();
				$("#pageBar").append(data.pageBar);
			}, 
			error:error=>{
				console.log(error);
			}
		})
	}
</script>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>