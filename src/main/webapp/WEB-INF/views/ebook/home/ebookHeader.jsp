<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${param.title}</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/ebookHeader.css">
	<script defer src="https://kit.fontawesome.com/5af64d5c05.js" crossorigin="anonymous"></script>
	<script defer src="${path}/resources/js/ebook/home/ebookHeader.js"></script>
</head>
<body>
	<div class="wrapper">
		<nav class="portal-navbar">
		
		</nav>
		
		<header>
			<div class="header-logo">
				<a href="${path}/ebook/pageEbook.do"><img src="${path}/resources/images/ebook/moonbook_ebook_logo.png"></a>
			</div>
			
			<div class="header-searchbar">
				<input type="text">
			</div>
			
			<ul class="header-icons">
				<li>
					<a href="javascript:openEbookWizard();"><i class="fas fa-book-open"></i>e북 마법사</a>
				</li>
				<li>
					<a href="${path}/ebook/pageShoppingBasket.do"><i class="fas fa-cart-plus"></i>장바구니</a>
				</li>
			</ul>
		</header>
		
		<nav class="navbar">
			<ul class="navbar-menu">
				<li><i class="fas fa-bars"></i></li>
				<li><a href="${path}/ebook/pageEbook.do">일반</a></li>
				<li><a href="${path}/ebook/pageBookstallJuvenile.do">아동</a></li>
				<li><a href="${path}/ebook/pageBookstallElementary.do">초등</a></li>
				<li><a href="${path}/ebook/pageBookstallMiddle.do">중등</a></li>
				<li><a href="${path}/ebook/pageBookstallNotes.do">우리들의 노트</a></li>
			</ul>
			
			<ul class="navbar-thema">
				<li><a href="${path}/ebook/pageBookstallSearch.do">베스트</a></li>
				<li><a href="${path}/ebook/pageBookstallSearch.do">신간</a></li>
				<li><a href="${path}/ebook/pageBookstallSearch.do">무료</a></li>
			</ul>
		</nav>