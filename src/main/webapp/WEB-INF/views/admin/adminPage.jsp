<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path }/resources/css/admin/adminPage.css">

<div class="wrap">
	<div class="container">
		<p class="path">
			홈 > <span>관리자페이지</span>
		</p>
		<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
   			<jsp:param name="" value=""/>
		</jsp:include>
		
	</div>


</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp">
<jsp:param name="" value=""/>
</jsp:include>