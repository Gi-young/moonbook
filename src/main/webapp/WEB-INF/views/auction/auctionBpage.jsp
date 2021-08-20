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
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionBpage.css">
</head>
<body>
	<div id="container">
		<div id="page">
			<h2>판매자 정보</h2>
			<div>
				<span>전화번호: ${member.memberPhone }</span><br>
				<span>주소: ${member.memberAddress }</span>		
			</div>
			<div>
				<span>판매자로부터 물품을 받으셨습니까?</span> <br>
				<span id="warring">*사용자간의 거래 문제는 고객센터로 문의 바랍니다.</span><br>
				<span id="warring">*구매자 판매자 모두 배송확인을 한후 관리자 확인후에 포인트가 정산됩니다.</span>
			</div>
				<button onclick="location.replace('${path}/auction/auctionBuySell?auctionNo=${auction.auctionNo }&state=buyler_state')">배송 확인</button>
		</div>
	</div>
</body>
</html>

