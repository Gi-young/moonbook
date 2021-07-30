<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/service/faqPage.css">

<div class="service-container">
	<div class="service-box1">
		<div class="service-box3">
			<jsp:include page="/WEB-INF/views/common/serviceSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="service-box2">
			<div class="service-box4">
					<div class="service-search3">
				<form class="service-search" action="">
						<table class="faqSearchTable">
							
							<tr>
								<th>FAQ 검색</th>
								
								<td class="search-box">
									<input type="text" name="searchHow8"> 
									
								</td>
								<td class="search-box">
									<img alt="검색하기"
									src="${path }/resources/img/admin/search.png" onclick="searchMT();">
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="FAQlist-container">
						<p class="faqFont">※ 가장 많이 하는 FAQ</p>
						
						<div class="faqList-box1">
						<ul>
							<li>[ebook] 테스트용 faq입니다 테스트테스트</li>
							<li>[ebook] 테스트용 faq입니다 테스트테스트</li>
							<li>[ebook] 테스트용 faq입니다 테스트테스트</li>
							<li>[ebook] 테스트용 faq입니다 테스트테스트</li>
							<li>[ebook] 테스트용 faq입니다 테스트테스트</li>
							<li>[ebook] 테스트용 faq입니다 테스트테스트</li>
							<li>[ebook] 테스트용 faq입니다 테스트테스트</li>
						</ul>
						</div>
						
						
						<div id="pagebar-container">
			        		${pageBar }
			        	</div> 
			        </div>
		</div>
	</div>
</div>


<style>
</style>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>