<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>KH문고 eBook</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/ebookHeader.css">
	<script src="https://kit.fontawesome.com/5af64d5c05.js" crossorigin="anonymous"></script>
</head>
<body>
	
	<nav class="navbar">
		<div class="navbar_upper">
			<div class="navbar_logo">
				<a href=""><img src="${path}/resources/images/ebook/khbook_logo.png"></a>
			</div>
			
			<div class="navbar_search">
				<input type="text">
			</div>
			
			<ul class="navbar_icons">
				<li><a href="javascript:openEbookReader();"><i class="fas fa-book-open"></i></a></li>
				<li><a href=""><i class="fas fa-cart-plus"></i></a></li>
			</ul>
		</div>
		
		<div class="navbar_under">
			<ul class="navbar_menu">
				<li><i class="fas fa-bars"></i></li>
				<li><a href="">일반</a></li>
				<li><a href="">소설</a></li>
				<li><a href="">프로그래밍</a></li>
				<li><a href="">자기계발</a></li>
				<li><a href="">역사</a></li>
			</ul>
			
			<ul class="navbar_thema">
				<li><a href="">베스트</a></li>
				<li><a href="">신간</a></li>
				<li><a href="">무료</a></li>
				<li><a href="">추천</a></li>
				<li><a href="">대여</a></li>
			</ul>
		</div>
	</nav>