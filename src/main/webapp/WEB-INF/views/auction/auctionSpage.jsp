<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${param.title}</title>
	<link rel="icon" href="${path}/resources/images/ebook/favicon.png" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionSpage.css">
</head>
<body>

	<div>
		<p>입찰자 전화번호 :${member.memberPhone } </p>
		<p>입찰자 주소 : ${member.memberAddress }</p>	
	</div>
	<c:if test="${auction.buylerState=='N' }">
		<button onclick="location.replace('${path}/auction/auctionBuySell?auctionNo=${auction.auctionNo }&state=seller_state')">배송 확인</button>
	</c:if>
	<c:if test="${auction.buylerState=='Y' }">
		<p>배송 완료에 체크하셨습니다.</p>
	</c:if>
	<p>구매자 판매자 모두 배송확인을 완료후 관리자 체크까지 해야 경매 포인트가 전송됩니다.</p>
	<p>경매 간 문제는 고객센터로 문의 바랍니다.</p>
	
</body>
</html>