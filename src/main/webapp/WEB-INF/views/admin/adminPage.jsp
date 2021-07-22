<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/adminPage.css">



<div class="wrap">
	<div class="container">
		<p class="path">
			홈 > <span>관리자페이지</span>
		</p>
			<h2 class="cscenter_h2">
				<a href="${path }/admin/adminPage.do">관리자페이지</a>
			</h2>
		<div class="admin_snb">
			<div class="admin_total" style="display: flex;">
				
				<div class="test2">
					<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
						<jsp:param name="" value="" />
					</jsp:include>
				</div>
				
				<div class="admin_contents">
					<div>
						<form  class="admin-search" style="">
							
							<div class="admin-search2">
							<select name="type">
								<option value="memberId" selected>Id</option>
								<option value="memberName" selected>Name</option>
							</select>
							</div>
							
							<div class="search-box">
								<input type="text">
								<img alt="검색하기" src="${path }/resources/img/admin/search.png">
							</div>
							
						</form>
					</div>
					<div class="memberT-container">
						<table class="memberT">
							<tr>
								<th>등록일</th>
								<th>회원 아이디</th>
								<th>회원 이름</th>
								<th>회원 전화번호</th>
								<th>회원 성별</th>
								<th>회원 포인트</th>
								<th>회원 등급</th>
								<th>총 매출</th>
								<th>방문 횟수</th>
								<th>수정하기</th>
							</tr>
							<tr>
								<td>${memberRegidate }0</td>
								<td>${memberId }1</td>
								<td>${memberName }2</td>
								<td>${memberPhone }3</td>
								<td>${memberGender }4</td>
								<td>${memberPoint }5</td>
								<td>${memberGradeNo }6</td>
								<td></td>
								<td></td>
								<td><img alt="검색하기" src="${path }/resources/img/admin/checkgreen.png" class="updateCheck"></td>
							</tr>
							<tr>
								<td>${memberRegidate }0</td>
								<td>${memberId }1</td>
								<td>${memberName }2</td>
								<td>${memberPhone }3</td>
								<td>${memberGender }4</td>
								<td>${memberPoint }5</td>
								<td>${memberGradeNo }6</td>
								<td></td>
								<td></td>
								<td><img alt="검색하기" src="${path }/resources/img/admin/checkgreen.png" class="updateCheck"></td>
							</tr>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>




</div>

<style>
</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>