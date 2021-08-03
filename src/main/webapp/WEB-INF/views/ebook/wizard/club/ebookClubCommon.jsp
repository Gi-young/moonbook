<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${param.title}</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/commonStyle.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookClub.css">
	<script defer src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script defer src="${path}/resources/js/ebook/wizard/ebookClub.js"></script>
</head>
<body>
	<div id="container">
		<header>
			<a href="${path}/ebook/openEbookWizard.do">e북 마법사</a>
			<a href="${path}/ebook/pageEbookReport.do">e독서록</a>
			<a href="${path}/ebook/pageEbookPlanner.do">e북 플래너</a>
			<a href="${path}/ebook/pageEbookClubManager.do">e독서토론 </a>
			<a href="${path}/ebook/pageEbookPublisher.do">e노트 출판</a>
		</header>
		
		<aside>
			<ul>
				<li><a href="${path}/ebook/pageEookClubManager.do">나의 클럽 관리하기</a></li>
				<li><a href="${path}/ebook/pageEookClubBoard.do">클럽 게시판</a></li>
				<li><a href="${path}/ebook/pageEookClubDebate.do">독서 토론</a></li>
				<li><a href="${path}/ebook/pageEookClubDebateManager.do">독서 토론 관리</a></li>
			</ul>
		</aside>