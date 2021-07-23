<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>e독서록 - 문곰책방</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/commonStyle.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookReport.css">
	<script defer src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script defer src="${path}/resources/js/ebook/wizard/ebookReport.js"></script>
</head>
<body>
	<div id="container">
		<header>
			<a href="${path}/ebook/openEbookWizard.do">e북 마법사</a>
			<a href="${path}/ebook/pageEbookReport.do">e독서록</a>
			<a href="${path}/ebook/pageEbookPlanner.do">e북 플래너</a>
			<a href="${path}/ebook/pageEbookClub.do">e독서토론 </a>
			<a href="${path}/ebook/pageEbookPublisher.do">e노트 출판</a>
		</header>
		
		<aside>
			<div></div>
		</aside>
		
		<section>
			
		</section>
	</div>

	<input type="hidden" id="contextPath" value="${path}">
</body>
</html>