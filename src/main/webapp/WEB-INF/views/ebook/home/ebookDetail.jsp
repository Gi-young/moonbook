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

	<div class="color-band"></div>
	<div class="inner-color-band"></div>
	
	<section>
		<div class="cover-img-box">
			<img src="${ebookDatabind.image}">
		</div>
		
		<div class="main-info">
			<p class="title"><c:out value="${ebookDatabind.title}"/></p>
			
			<p class="plain"><b>작가 :</b> <c:out value="${ebookDatabind.author}"/></p>
			
			<p class="plain"><b>가격 :</b> <span class="price"><c:out value="${ebookDatabind.price}"/></span>원</p>
		</div>
		
		<div class="sub-info">
			<p><b>ISBN :</b> <c:out value="${ebookDatabind.isbn}"/></p>
			
			<p><b>출판일 :</b> <c:out value="${ebookDatabind.pubdate}"/></p>
			
			<p><b>출판사 :</b> <c:out value="${ebookDatabind.publisher}"/></p>
			
			<p><b>일련번호 :</b> <c:out value="${ebookDatabind.bindNo}"/></p>
			
			<p class="description">&emsp;<c:out value="${ebookDatabind.description}"/>&nbsp;
				<a onclick="openNaverDetailPage(event,'${ebookDatabind.link}');">더보기</a>
			</p>
		</div>
		
		<input type="hidden" id="bindNo" value="${ebookDatabind.bindNo}">
	</section>
		
	<div class="under-controller-box">
		<div onclick="loveOrUnlove();">
			<i class="fas fa-heart" id="checkLoved"></i>&nbsp;
			<span id="loveNumber"></span>
		</div>
		
		<div onclick="putInShoppingBasket();">
			장바구니&nbsp;
			<i class="fas fa-shopping-basket" id="checkShopped"></i>
		</div>
		
		<div onclick="buyNow();">바로구매</div>
	</div>
	
	<input type="hidden" id="contextPath" value="${path}">
	<input type="hidden" id="loginMemberId" value="${sessionScope.loginMember.memberId}">

	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://kit.fontawesome.com/5af64d5c05.js" crossorigin="anonymous"></script>
	<script src="${path}/resources/js/ebook/home/ebookDetail.js"></script>
</body>