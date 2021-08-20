<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/usedboard/usedboardMyPayment.css">
<center>
	<section id="content">
		<div id="main_in">
			<br>
			<p id="titi" style="font-size: 35px; color: black;">판매내역</p>
			<br>
			<c:if test="${loginMember!=null }">
				<a
					href="${path }/usedboard/usedboardList.do?memberId=${loginMember.memberId}"
					style="font-size: 20px; color: #964b00">내 중고게시판</a>
				<a style="font-size: 20px; color: #964b00;">/</a>
				<a
					href="${path }/usedboard/usedboardMyPayment.do?memberId=${loginMember.memberId}"
					style="font-size: 20px; color: #964b00;">내 중고구매목록</a>
				<a style="font-size: 20px; color: #964b00;">/</a>
				<a href="${path }/usedboard/usedboardList.do"
					style="font-size: 20px; color: #964b00;">중고게시판</a>
			</c:if>
			<table class="list-table">
				<tr>
					<th width="150">구매자</th>
					<th width="200">배송지</th>
					<th width="200">제목</th>
					<th width="150">결제일</th>
					<th width="150">가격</th>
					<th width="150">주문취소</th>
					<th width="150">배송확인</th>
				</tr>
				<c:if test="${list.isEmpty()}">
					<tr>
						<td style="text-align: center;" colspan="7">판매내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="b" items="${list }">
					<tr>
						<td>${b.member_Id }</td>
						<td>${b.address }</td>
						<td width="300"><a
							href="${path }/usedboard/usedboardView.do?no=${b.usedboardPayment_BoardNo}">${b.usedboardPayment_Title }</a></td>
						<td>${b.usedboardPayment_Date }</td>
						<td>￦${b.usedboardPayment_Price }</td>
						<td><c:if test="${b.usedboardPayment_State=='1' }">
								<c:if test="${b.usedboardPayment_Cancel=='n' }">
									<button
										onclick="location.assign('${path}/usedboard/cancelPayment.do?impUid=${b.imp_uid }&memberId=${b.member_Id }&no=${b.usedboardPayment_BoardNo }&state=1');">환불하기</button>
								</c:if>
								<c:if test="${b.usedboardPayment_Cancel!='n' }">
										환불완료
									</c:if>
							</c:if>
							<c:if test="${b.usedboardPayment_State!='1' }">
								환불불가
							</c:if>
							</td>
							
						<td>
							<c:if test="${b.usedboardPayment_Cancel!='n' }">
								<span> 환불완료 </span>

							</c:if>
							<c:if test="${b.usedboardPayment_Cancel=='n' }">
								<c:if test="${b.usedboardPayment_State == '1' }">
									<button
										onclick="confirmDelivery(event,'${b.usedboardPayment_BoardNo }','${loginMember.memberId }');">배송확인</button>
							</c:if> 
								<c:if test="${b.usedboardPayment_State != '1' }">
									<span> 배송확인완료 </span>
								</c:if>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<div class="pageBar">${pageBar }</div>
		</div>
	</section>
</center>
<script>
	function confirmDelivery(event, usedboardNo, memberId) {
		event.preventDefault();
		location.assign('${path}/usedboard/usedboardPay1.do?no=' + usedboardNo + '&memberId=' + memberId);
	}
</script>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"></jsp:include>