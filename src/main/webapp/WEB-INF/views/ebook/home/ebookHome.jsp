<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/ebook/home/ebookHeader.jsp">
	<jsp:param name="title" value="문곰e북" />
	<jsp:param name="shoppingBasketLoginCheck" value="${shoppingBasketLoginCheck}" />
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/ebookHome.css">
	
	<main class="container">
		<div class="main-boundary-box">
			<div class="banner-box">
				<div class="slide-banner">slide-banner</div>
			</div>
		
			<div class="search-box">
				<form id="searchFrm" action="${path}/ebook/search.do">
					<div class="order-container">
						<div id="salesOrder">
							<p>판매량</p>
						
							<div>
								<input type="radio" id="salesOrderDesc" name="salesOrder" value="DESC" checked>
								<label for="salesOrderDesc">내림</label>
							</div>
							<div>
								<input type="radio" id="salesOrderAsc" name="salesOrder" value="ASC">
								<label for="salesOrderAsc">오름</label>
							</div>
							
							<input type="number" name="importanceSales" value="1" max="4" min="1" step="1" required>
						</div>
			
						<div id="ratingOrder">
							<p>평점</p>
						
							<div>
								<input type="radio" id="ratingOrderDesc" name="ratingOrder" value="DESC" checked>
								<label for="ratingOrderDesc">내림</label>
							</div>
							<div>
								<input type="radio" id="ratingOrderAsc" name="ratingOrder" value="ASC">
								<label for="ratingOrderAsc">오름</label>
							</div>
							
							<input type="number" name="importanceRating" value="2" max="4" min="1" step="1" required>
						</div>
						
						<div id="pubdateOrder">
							<p>출판일</p>
							
							<div>
								<input type="radio" id="pubdateOrderDesc" name="pubdateOrder" value="DESC" checked>
								<label for="pubdateOrderDesc">내림</label>
							</div>
							<div>
								<input type="radio" id="pubdateOrderAsc" name="pubdateOrder" value="ASC">
								<label for="pubdateOrderAsc">오름</label>
							</div>
							
							<input type="number" name="importancePubdate" value="3" max="4" min="1" step="1" required>
						</div>
			
						<div id="priceOrder">
							<p>가격</p>
						
							<div>
								<input type="radio" id="priceOrderDesc" name="priceOrder" value="DESC" checked>
								<label for="priceOrderDesc">내림</label>
							</div>
							<div>
								<input type="radio" id="priceOrderAsc" name="priceOrder" value="ASC">
								<label for="priceOrderAsc">오름</label>
							</div>
							
							<input type="number" name="importancePrice" value="4" max="4" min="1" step="1" required>
						</div>
					</div>
				
					<div class="searchBar">
						<select id="searchType" name="searchType">
							<option value="title" selected>제목</option>
							<option value="author">저자</option>
							<option value="publisher">출판사</option>
							<option value="isbn">ISBN</option>
						</select>
						
						<select id="categoryCode" name="categoryCode"></select>
						
						<input type="text" id="keyword" name="keyword" placeholder="검색 키워드를 입력하세요">
						<input type="submit" value="검색">
					</div>
				</form>
				
				<div class="search-result"></div>
				
				<div class="page-bar"></div>
			</div>
		</div>
	</main>

	<script src="${path}/resources/js/ebook/home/ebookHome.js"></script>
	
<jsp:include page="/WEB-INF/views/ebook/home/ebookFooter.jsp"/>