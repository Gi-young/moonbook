<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e북 플래너 - 문곰책방"/>
	<jsp:param name="currentPageIndex" value="2"/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookPlanner.css">
	
		<aside>
			<div></div>
		</aside>
		
		<section>
			<canvas id="line-chart"></canvas>
		</section>
	</div>

	<input type="hidden" id="contextPath" value="${path}">
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="${path}/resources/js/ebook/wizard/ebookPlanner.js"></script>
	
</body>
</html>