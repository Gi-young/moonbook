<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/home/ebookHeader.jsp">
	<jsp:param name="title" value="문곰e북"/>
</jsp:include>
	
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/ebookHome.css">
	<main>
		<form id="searchFrm">
			<div>
				<input type="text" id="keyword" name="keyword" placeholder="검색 키워드를 입력하세요">
				
				<select id="searchType" name="searchType">
					<option value="title" selected>제목</option>
					<option value="author">저자</option>
					<option value="pulisher">출판사</option>
					<option value="isbn">ISBN</option>
				</select>
				
				<select id="categoryCode" name="categoryCode">
					<option value="100020020" selected>세계문학</option>
				</select>
				
				<div id="pubdateOrder">
					<label for="pubdateOrderDesc">최신 순</label>
					<input type="radio" id="pubdateOrderDesc" name="pubdateOrder" value="DESC" checked>
					<label for="pubdateOrderDesc">오래된 순</label>
					<input type="radio" id="pubdateOrderAsc" name="pubdateOrder" value="ASC">
					<input type="number" name="importancePubdate" value="1">
				</div>
				
				<div id="priceOrder">
					<label for="priceOrderDesc">높은 가격 순</label>
					<input type="radio" id="priceOrderDesc" name="priceOrder" value="DESC" checked>
					<label for="priceOrderAsc">낮은 가격 순</label>
					<input type="radio" id="priceOrderAsc" name="priceOrder" value="ASC">
					<input type="number" name="importancePrice" value="2">
				</div>
				
				<div id="salesOrder">
					<label for="salesOrderDesc">판매량 높은 순</label>
					<input type="radio" id="salesOrderDesc" name="salesOrder" value="DESC" checked>
					<label for="salesOrderAsc">판매량 낮은 순</label>
					<input type="radio" id="salesOrderAsc" name="salesOrder" value="ASC">
					<input type="number" name="importanceSales" value="3">
				</div>
				
				<input type="submit" value="검색">
			</div>
		</form>
	</main>
	
	<input type="hidden" id="contextPath" value="${path}"/>
	
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script src = "${path}/resources/js/ebook/xml2json.js"></script>
	<script src="${path}/resources/js/ebook/home/ebookHome.js"></script>
	
<jsp:include page="/WEB-INF/views/ebook/home/ebookFooter.jsp"/>