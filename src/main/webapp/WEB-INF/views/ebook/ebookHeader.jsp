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
	<div class="wrapper">
		<nav class="portal-navbar">
		
		</nav>
		
		<header>
			<div class="header-logo">
				<a href=""><img src="${path}/resources/images/ebook/khbook_logo.png"></a>
			</div>
			
			<div class="header-searchbar">
				<input type="text">
			</div>
			
			<ul class="header-icons">
				<li><a href="javascript:openEbookReader();"><i class="fas fa-book-open"></i></a></li>
				<li><a href=""><i class="fas fa-cart-plus"></i></a></li>
			</ul>
		</header>
		
		<nav class="navbar">
			<ul class="navbar-menu">
				<li><i class="fas fa-bars"></i></li>
				<li><a href="">일반</a></li>
				<li><a href="">초등 저학년</a></li>
				<li><a href="">초등 고학년</a></li>
				<li><a href="">중학생</a></li>
				<li><a href="">우리들의 노트</a></li>
			</ul>
			
			<ul class="navbar-thema">
				<li><a href="">베스트</a></li>
				<li><a href="">신간</a></li>
				<li><a href="">무료</a></li>
			</ul>
		</nav>