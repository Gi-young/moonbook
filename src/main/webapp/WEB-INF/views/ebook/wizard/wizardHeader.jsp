<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${param.title}</title>
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
		</header>
		
	<input type="hidden" id="contextPath" value="${path}"/>
	<input type="hidden" id="loginMemberId" value="${sessionScope.loginMember.memberId}"/>
	<input type="hidden" id="currentPageIndex" value="${param.currentPageIndex}"/>
		
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="${path}/resources/js/ebook/wizard/wizardHeader.js"></script>