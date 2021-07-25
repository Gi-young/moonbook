<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/home/ebookHeader.jsp">
	<jsp:param name="title" value="책 상세 - 문곰e북"/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/commonStyle.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/ebookDetail.css">

	<main>
		<p>책 상세 페이지</p>
	</main>

	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src = "${path}/resources/js/ebook/xml2json.js"></script>
	<script src="${path}/resources/js/ebook/home/ebookDetail.js"></script>

<jsp:include page="/WEB-INF/views/ebook/home/ebookFooter.jsp"/>