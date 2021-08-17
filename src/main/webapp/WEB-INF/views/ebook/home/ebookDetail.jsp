<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>e북 상세</title>
	<link rel="icon" href="${path}/resources/images/ebook/favicon.png" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/ebookDetail.css">
</head>
<body>
	<section>
		<div class="cover-img-box">
			<img src="${ebookDatabind.image}">
		</div>
		
		<div>
			<h4><c:out value="${ebookDatabind.title}"/></h4>
			
			<p><c:out value="${ebookDatabind.author}"/></p>
			
			<p><c:out value="${ebookDatabind.price}"/>원</p>
		</div>
		
		<div>
			<p><c:out value="${ebookDatabind.isbn}"/></p>
			
			<p><c:out value="${ebookDatabind.pubdate}"/></p>
			
			<p><c:out value="${ebookDatabind.publisher}"/></p>
			
			<p><c:out value="${ebookDatabind.description}"/></p>
			
			<a href="${ebookDatabind.link}">상세보기 페이지로 이동</a>
		</div>
		
		
		<input type="hidden" id="bindNo" value="${ebookDatabind.bindNo}">
	</section>
		
	<div class="under-controller-box">
		<div onclick="loveOrUnlove();">
			<i class="fas fa-heart" id="checkLoved"></i>&nbsp;
			<span id="loveNumber"></span>
		</div>
		
		<div>
			장바구니&nbsp;
			<i class="fas fa-shopping-basket"></i>
		</div>
		
		<div onclick="buyNow();">바로구매</div>
	</div>
	
	<input type="hidden" id="contextPath" value="${path}">
	<input type="hidden" id="loginMemberId" value="${sessionScope.loginMember.memberId}">

	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://kit.fontawesome.com/5af64d5c05.js" crossorigin="anonymous"></script>
	<script src="${path}/resources/js/ebook/home/ebookDetail.js"></script>
</body>