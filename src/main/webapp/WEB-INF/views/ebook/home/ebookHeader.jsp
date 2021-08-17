<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${param.title}</title>
	<link rel="icon" href="${path}/resources/images/ebook/favicon.png" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/ebookHeader.css">
</head>
<body>
	<div class="wrap">
		<div class="wrapper">
			<header class="flex">
				<div class="boundary-box">
					<div class="header-logo">
						<a href="${path}/ebook/ebookHome.do"><img src="${path}/resources/images/ebook/moonbook_ebook_logo.png"></a>
					</div>
					
					<ul class="header-icons">
						<li>
							<a href="javascript:openEbookWizard();"><i class="fas fa-book-open"></i><b>e북 마법사</b></a>
						</li>
						<li>
							<a href="${path}/shopingList/shopingList.do"><i class="fas fa-cart-plus"></i><b>장바구니</b></a>
						</li>
					</ul>
				</div>
			</header>
			
			<nav class="portal-navbar">
				<div class="portal-boundary-box">
					<ul class="portal">
						<li>도서 ▼</li>
						<li>기프트 ▼</li>
						<li>중고</li>
						<li>경매</li>
					</ul>
					
					<ul class="management">
						<c:if test="${sessionScope.loginMember == null}">
							<li onclick="login();">로그인</li>
						</c:if>
						<c:if test="${sessionScope.loginMember != null}">
							<li><c:out value="${sessionScope.loginMember.memberId}"/>님, 환영합니다</li>
							<li onclick="logout();">로그아웃</li>
						</c:if>
						<li>고객센터</li>
					</ul>
				</div>
			</nav>
			
			<nav class="navbar">
				<div class="navbar-boundary-box">
					<ul class="navbar-menu">
						<li><i class="fas fa-bars" id="hamburger"></i></li>
						<li><a href="${path}/ebook/pageEbook.do">일반</a></li>
						<li><a href="${path}/ebook/pageEbook.do?currentFocus=child">아동</a></li>
						<li><a href="${path}/ebook/pageEbook.do?currentFocus=elementary">초등</a></li>
						<li><a href="${path}/ebook/pageEbook.do?currentFocus=middle">중등</a></li>
						<li><a href="${path}/ebook/pageEbook.do?currentFocus=ebook">구현된 e북</a></li>
					</ul>
					
					<div id="hiddenMenu">
						<div class="child">
							<h4>아동</h4>
							<ul></ul>
						</div>
						
						<div class="elementary">
							<h4>초등</h4>
							<ul></ul>
						</div>
						
						<div class="middle">
							<h4>중등</h4>
							<ul></ul>
						</div>
						
						<div class="ebook">
							<h4>기타</h4>
							<ul></ul>
						</div>
					</div>
					
					<div class="only-admin-box">
						<c:if test="${sessionScope.loginMember.memberId.equals('admin')}">
							<button onclick="moonbookDatabind();">API에서 데이터 받아오기</button>
							<button onclick="uploadEbook();">e북 업로드</button>
							<button onclick="manageBanner();">배너 관리자</button>
						</c:if>
					</div>
				</div>
			</nav>
			
			<input type="hidden" id="contextPath" value="${path}"/>
			<input type="hidden" id="memberId" value="${sessionScope.loginMember.memberId}">
			<input type="hidden" id="shoppingBasketLoginCheck" value="${param.shoppingBasketLoginCheck}">
			<input type="hidden" id="ebookDetailLoginCheck" value="${param.ebookDetailLoginCheck}">
			<input type="hidden" id="currentFocus" value="${currentFocus}">
	
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${path}/resources/js/ebook/xml2json.js"></script>
	<script src="https://kit.fontawesome.com/5af64d5c05.js" crossorigin="anonymous"></script>
	<script src="${path}/resources/js/ebook/home/ebookHeader.js"></script>