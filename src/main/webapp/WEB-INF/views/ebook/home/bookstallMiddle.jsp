<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/home/ebookHeader.jsp">
	<jsp:param name="title" value="중등도서 - 문곰e북"/>
</jsp:include>
	
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/bookstallMiddle.css">
	
	<main>
		<p>중등도서</p>
		
		<div class="carousel-container">
			<div class="carousel-slide">
				<img src="${path}/resources/images/ebook/bookstallMiddle/test1.jpg" alt="">
				<img src="${path}/resources/images/ebook/bookstallMiddle/test2.jpg" alt="">
				<img src="${path}/resources/images/ebook/bookstallMiddle/test3.jpg" alt="">
				<img src="${path}/resources/images/ebook/bookstallMiddle/test4.jpg" alt="">
				<img src="${path}/resources/images/ebook/bookstallMiddle/test5.jpg" alt="">
			</div>
		</div>
		<button id="prevBtn">Prev</button>
		<button id="nextBtn">Next</button>
		
	</main>
	
	<input type="hidden" id="contextPath" value="${path}"/>
	
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src = "${path}/resources/js/ebook/xml2json.js"></script>
	<script src="${path}/resources/js/ebook/home/bookstallMiddle.js"></script>
	
<jsp:include page="/WEB-INF/views/ebook/home/ebookFooter.jsp"/>