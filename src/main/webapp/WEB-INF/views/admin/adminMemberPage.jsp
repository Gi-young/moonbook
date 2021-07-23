<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/adminMemberPage.css">

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
				<form class="admin-search">
						<table class="adminHowTable">
							<tr>
								<th>정렬방법</th>
								<td>
								<select name="type1">
									<option value="totalMoney">총 매출</option>
									<option value="memberId" selected>Id</option>
									<option value="memberName" >Name</option>
								</select>
								</td>
								<td>
									<input class="howASCSearch" type="radio" name="searchHow2" id="asc" value="asc" checked><label for="asc">오름차순</label>
									<input class="howDESCSearch2" type="radio" name="searchHow2" id="desc" value="desc"><label for="desc">내림차순</label>
								</td>
								<td><input type="submit" value="조회하기"></td>
							</tr>
							<tr>
								<th>검색하기</th>
								<td class="admin-search2">
								<select name="type2">
									<option value="memberId" selected>Id</option>
									<option value="memberName" >Name</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text"> 
								</td>
								<td class="search-box">
									<img alt="검색하기"
									src="${path }/resources/img/admin/search.png">
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
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
								<th>삭제하기</th>
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
								<td><img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" class="updateCheck"></td>
								<td><img alt="삭제하기" src="${path }/resources/img/admin/delete2.png" class="updateCheck"></td>
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
								<td><img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" class="updateCheck"></td>
								<td><img alt="삭제하기" src="${path }/resources/img/admin/delete2.png" class="updateCheck"></td>
							</tr>

						</table>
					</div>
		</div>
	</div>
</div>


<style>
</style>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include> --%>