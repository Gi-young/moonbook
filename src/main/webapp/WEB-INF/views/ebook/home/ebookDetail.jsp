<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/home/ebookHeader.jsp">
	<jsp:param name="title" value="책 상세 - 문곰e북"/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/ebookDetail.css">

	<main>
		<img src="${ebookDatabind.image}">
		<p><c:out value="${ebookDatabind.title}"/></p>
		<p><c:out value="${ebookDatabind.author}"/></p>
		<p><c:out value="${ebookDatabind.price}"/>원</p>
		<p><c:out value="${ebookDatabind.isbn}"/></p>
		<p><c:out value="${ebookDatabind.pubdate}"/></p>
		<p><c:out value="${ebookDatabind.publisher}"/></p>
		<p><c:out value="${ebookDatabind.description}"/></p>
		<a href="${ebookDatabind.link}">상세보기 페이지로 이동</a>
		<p><c:out value="${ebookDatabind.categoryCode}"/></p>
		
		<input type="button" value="좋아요" onclick="loveOrUnlove();">
		<input type="checkbox" id="checkLoved">
		
		<input type="button" value="장바구니에 넣기" onclick="putInShoppingBasket();">

		<input type="hidden" id="bindNo" value="${ebookDatabind.bindNo}">
	</main>

	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src = "${path}/resources/js/ebook/xml2json.js"></script>
	<script src="${path}/resources/js/ebook/home/ebookDetail.js"></script>

<jsp:include page="/WEB-INF/views/ebook/home/ebookFooter.jsp"/>