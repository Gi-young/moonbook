<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/adminAuctionCate.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<div class="admin-container">
	<div class="admin-box1">
		<div class="admin-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="admin-box2">
			<div class="admin-box4">
					<div class="admin-search3">
				<form class="admin-search" action="${path }/admin/addAuctionCate.do" id="addDeleteAuction">
						<table class="adminHowTable">
							
							<tr>
								<th>카테고리 내 종류 추가</th>
								<td class="admin-search2">
								<select name="type9">
									<option value="도서" >도서</option>
									<option value="문구" >문구</option>
									<option value="음반" >음반</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text" name="type10"> 
								</td>
								<td class="search-box">
									<input type="submit" value="추가" class="adminBtn"/>
									<!-- <button onclick="addAuctionCate(event)">추가</button>  -->
								</td>
							</tr>
							
							<tr>
								<th>카테고리 내 종류 삭제</th>
								<td class="admin-search2">
								<select name="type20">
									<option value="도서" >도서</option>
									<option value="문구" >문구</option>
									<option value="음반" >음반</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text" name="type21"> 
								</td>
								<td class="search-box">
									<input type="button" value="삭제" onclick="deleteAuctionCate('deleteAuctionCate.do');" class="adminBtn"/>
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="memberT-container">
				<%-- <c:forEach var="c" items="${list2 }"> --%>
				<div class="auction_box1">
					<ul class="auction_cate2" >
						<li>도서</li>
					</ul>
					<ul class="auction_cate1" >
						<c:forEach var="e" items="${list }">
							<c:if test="${e.auctioncateName eq '도서'}">
								<li>${e.auctioncateFirst}</li>
							</c:if> 
						</c:forEach> 
					</ul>
				</div>
			
				 <div class="auction_box1">
					<ul class="auction_cate2" >
						<li>문구</li>
					</ul>
					<ul class="auction_cate1" >
						<c:forEach var="e" items="${list }">
							<c:if test="${e.auctioncateName eq '문구'}">
								<li>${e.auctioncateFirst}</li>
							</c:if> 
						</c:forEach> 
					</ul>
				</div>
				
				<div class="auction_box1">
					<ul class="auction_cate2" >
						<li>음반</li>
					</ul>
					<ul class="auction_cate1" >
						<c:forEach var="e" items="${list }">
							<c:if test="${e.auctioncateName eq '음반'}">
								<li>${e.auctioncateFirst}</li>
							</c:if> 
						</c:forEach> 
					</ul>
				</div>
			</div>
			
					
				
		</div>
	</div>
</div>


<script>

function addAuctionCate(event){
	
}
function deleteAuctionCate(url){
	$("#addDeleteAuction").attr("action","${path}/admin/"+url);
	$("#addDeleteAuction").submit(); 
	/* location.assign("${path}/admin/deleteAuctionCate.do"); */
}
	
	





</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>