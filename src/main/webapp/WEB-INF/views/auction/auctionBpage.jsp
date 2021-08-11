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
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/acutionBpage.css">
</head>
<body>

	<div>
		<p>판매자 정보</p>
		<p>전화번호: ${member.memberPhone }</p>		
	</div>
	<div>
		<p>판매자로부터 물품을 받으셨습니까?</p><br>
		<button onclick="location.replace('${path}/auction/auctionBuySell?auctionNo=${auction.auctionNo }&state=buyler_state')">배송 확인</button>
	</div>
	
</body>
</html>

