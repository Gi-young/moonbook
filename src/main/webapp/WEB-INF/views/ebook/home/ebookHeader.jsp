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
</head>
<body>
	<div class="wrapper">
		<nav class="portal-navbar">
			<button onclick="location.assign('${path}')">홈으로</button>
			
			<c:if test="${sessionScope.loginMember == null}">
				<div id="loginBox">
					<button id="loginBtn" onclick="login();">로그인</button>
				</div>
			</c:if>
			
			<c:if test="${sessionScope.loginMember != null}">
				<div id="memberInfoBox">
					<span><b><c:out value="${sessionScope.loginMember.memberId}"/></b>님, 환영합니다</span>
					<button id="logoutBtn" onclick="logout();">로그아웃</button>
				</div>
			</c:if>
			
			<c:if test="${sessionScope.loginMember != null}">
				<c:if test="${sessionScope.loginMember.memberId.equals('admin')}">
					<div id="adminBox">
						<button id="databindBtn" onclick="moonbookDatabind();">api에서 데이터 받아오기</button>
						<button id="uploadEbookBtn" onclick="uploadEbook();">e북 업로드</button>
					</div>
				</c:if>
			</c:if>
		</nav>
		
		<header>
			<div class="header-logo">
				<a href="${path}/ebook/pageEbook.do"><img src="${path}/resources/images/ebook/moonbook_ebook_logo.png"></a>
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
			</ul>
		</nav>
		
		<input type="hidden" id="contextPath" value="${path}"/>
		<input type="hidden" id="memberId" value="${sessionScope.loginMember.memberId}">
		<input type="hidden" id="shoppingBasketLoginCheck" value="${param.shoppingBasketLoginCheck}">
	
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${path}/resources/js/ebook/xml2json.js"></script>
	<script src="https://kit.fontawesome.com/5af64d5c05.js" crossorigin="anonymous"></script>
	<script src="${path}/resources/js/ebook/home/ebookHeader.js"></script>