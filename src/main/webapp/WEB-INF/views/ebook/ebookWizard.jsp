<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>KH문고 이북리더</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/ebookWizard.css">
</head>
<body>
	<div id="container">
		<header>
			
		</header>
		
		<aside>
			<div></div>
		</aside>
		
		<section>
			<button id="readBookBtn">책 읽기</button>
			
		</section>
	</div>

	<input type="hidden" id="contextPath" value="${path}">

	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
	<script src="${path}/resources/js/ebook/ebookWizard.js"></script>
</body>
</html>