<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>KH문고 이북리더</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/ebookReader.css">
</head>
<body>
	<div id="container">
		<header>
			
		</header>
		<div id="mainSection">
			<aside>
				<div></div>
			</aside>
			<section>
				<button id="readBookBtn">책 읽기</button>
				<div class="top-bar">
					<button class="btn" id="prev">
						<i class="fas fa-arrow-circle-left"></i> Prev Page
					</button>
					<button class="btn" id="next">
						Next Page <i class="fas fa-arrow-circle-right"></i>
					</button>
				</div>
				<span class="page-info">
					Page <span id="page-num"></span> of <span id="page-count"></span>
				</span>
				
				<canvas id="left-canvas"></canvas>
				<canvas id="right-canvas"></canvas>
				
			</section>
		</div>
	</div>

	<input type="hidden" id="contextPath" value="${path}">

	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
	<script src="${path}/resources/js/ebook/ebookReader.js"></script>
</body>
</html>