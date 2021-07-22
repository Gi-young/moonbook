<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/adminPage.css">

<div class="admin-container">
	<div class="admin-box1">
		<div class="admin-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="admin-box2">
			<form class="admin-search" style="">

				<div class="admin-search2">
					<select name="type">
						<option value="memberId" selected>Id</option>
						<option value="memberName" selected>Name</option>
					</select>
				</div>

				<div class="search-box">
					<input type="text"> <img alt="검색하기"
						src="${path }/resources/img/admin/search.png">
				</div>

			</form>
		</div>
	</div>
</div>


<style>
</style>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include> --%>