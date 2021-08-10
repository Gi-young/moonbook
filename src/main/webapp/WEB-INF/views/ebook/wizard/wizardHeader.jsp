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
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/wizardHeader.css">
</head>
<body>
	<div id="container">
		<header>
			<ul>
				<li><a href="${path}/ebook/openEbookWizard.do">e북 마법사 홈</a></li>
				<li><a href="${path}/ebook/pageEbookReport.do">e독서록</a></li>
				<li><a href="${path}/ebook/pageEbookPlanner.do">e북 플래너</a></li>
				<li><a href="${path}/ebook/pageEbookClubManager.do">e독서토론[<span id="noticeAlert">0</span>]</a></li>
			</ul>
			
			<c:if test="${param.currentPageIndex.equals('7')}">
				<div id="randomClassicalMusicBox">
					랜덤 클래식 [&nbsp;<span class="music-title">title</span>&nbsp;]
					
					<div id="musicController">
						<i id="backward" class="fas fa-backward"></i>
						<i id="forward" class="fas fa-forward"></i>
					</div>
					
					<div id="grantAutoplayBox">
						<input type="checkbox" id="grantAutoplay">
						<label for="grantAutoplay">자동재생 해제</label>
					</div>
				</div>
			</c:if>
			
			<c:if test="${param.currentPageIndex.equals('0')}">
				<div id="hiToMember">
					<c:out value="${sessionScope.loginMember.memberId}"/>님 환영합니다
				</div>
			</c:if>
		</header>
		
	<input type="hidden" id="contextPath" value="${path}"/>
	<input type="hidden" id="loginMemberId" value="${sessionScope.loginMember.memberId}"/>
	<input type="hidden" id="currentPageIndex" value="${param.currentPageIndex}"/>
		
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="https://kit.fontawesome.com/5af64d5c05.js" crossorigin="anonymous"></script>
	<script src="${path}/resources/js/ebook/wizard/wizardHeader.js"></script>