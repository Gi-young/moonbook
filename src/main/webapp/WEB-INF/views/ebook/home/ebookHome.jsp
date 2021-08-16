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
		<form id="searchFrm" action="${path }/ebook/searchBook.do">
			<div>
				<div class="searchBar marginBo2em">
					<select id="searchType" name="searchType">
						<option value="title" selected>제목</option>
						<option value="author">저자</option>
						<option value="pulisher">출판사</option>
						<option value="isbn">ISBN</option>
					</select> <select id="categoryCode" name="categoryCode">
						<option value="111111">구현된 e북</option>
						<option value="100020010">한국고전소설</option>
						<option value="100020020" selected>세계문학</option>
						<option value="100020030">세계고전</option>
						<option value="300050">청소년 문학</option>
						<option value="310010010">한국그림책(0~3세)</option>
						<option value="310010020">외국그림책(0~3세)</option>
						<option value="310020010">한국그림책(4~7세)</option>
						<option value="310020020">외국그림책(4~7세)</option>
						<option value="310040010">세계 명작 동화(유아)</option>
						<option value="310040020">한국 전래 동화(유아)</option>
						<option value="310040030">국내 창작 동화(유아)</option>
						<option value="310040040">다른나라 그림책(유아)</option>
						<option value="320010010">어린이동화(초 1~2학년)</option>
						<option value="320020010">어린이동화(초 3~4학년)</option>
						<option value="320030010">어린이동화(초 5~6학년)</option>
						<option value="320040010">어린이동화(공통)</option>
					</select> <input type="text" id="keyword" name="keyword"
						placeholder="검색 키워드를 입력하세요"> <input type="number"
						name="dataVolume" min="1" step="1"
						placeholder="조회 개수를 입력하세요"> <input type="submit"
						value="검색">
				</div>
				<div class="rank">우선 순위 설정</div>
				<div id="pubdateOrder">
					<div class="width70">
						<div class="padding10 width30">
							<div class="width70">
								<label for="pubdateOrderDesc">최신 순</label>
							</div>
							<input type="radio" id="pubdateOrderDesc" name="pubdateOrder"
								value="DESC" checked>
						</div>
						<div class="padding10 width30">
							<div class="width70">
								<label for="pubdateOrderDesc">오래된 순</label>
							</div>
							<input type="radio" id="pubdateOrderAsc" name="pubdateOrder"
								value="ASC">
						</div>
					</div>
					<div class="padding10">
						<input type="number" name="importancePubdate" value="1" max="4"
							min="1" step="1" required>
					</div>
				</div>
	
				<div id="salesOrder">
					<div class="width70">
						<div class="padding10 width30">
							<div class="width70">
								<label for="salesOrderDesc">판매량 높은 순</label>
							</div>
							<input type="radio" id="salesOrderDesc" name="salesOrder"
								value="DESC" checked>
						</div>
						<div class="padding10 width30">
							<div class="width70">
								<label for="salesOrderAsc">판매량 낮은 순</label>
							</div>
							<input type="radio" id="salesOrderAsc" name="salesOrder"
								value="ASC">
						</div>
					</div>
					<div class="padding10">
						<input type="number" name="importanceSales" value="2" max="4"
							min="1" step="1" required>
					</div>
				</div>
	
				<div id="ratingOrder">
					<div class="width70">
						<div class="padding10 width30">
							<div class="width70">
								<label for="ratingOrderDesc">평점 높은 순</label>
							</div>
							<input type="radio" id="ratingOrderDesc" name="ratingOrder"
								value="DESC" checked>
						</div>
						<div class="padding10 width30">
							<div class="width70">
								<label for="ratingOrderAsc">평점 낮은 순</label>
							</div>
							<input type="radio" id="ratingOrderAsc" name="ratingOrder"
								value="ASC">
						</div>
					</div>
					<div class="padding10">
						<input type="number" name="importanceRating" value="3" max="4"
							min="1" step="1" required>
					</div>
				</div>
	
				<div id="priceOrder">
					<div class="width70">
						<div class="padding10 width30">
							<div class="width70">
								<label for="priceOrderDesc">높은 가격 순</label>
							</div>
							<input type="radio" id="priceOrderDesc" name="priceOrder"
								value="DESC" checked>
						</div>
						<div class="padding10 width30">
							<div class="width70">
								<label for="priceOrderAsc">낮은 가격 순</label>
							</div>
							<input type="radio" id="priceOrderAsc" name="priceOrder"
								value="ASC">
						</div>
					</div>
					<div class="padding10">
						<input type="number" name="importancePrice" value="4" max="4"
							min="1" step="1" required>
					</div>
				</div>
			</div>
		</form>
	</main>

	<script src="${path}/resources/js/ebook/home/ebookHome.js"></script>
	
<jsp:include page="/WEB-INF/views/ebook/home/ebookFooter.jsp"/>