<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e독서록 - 문곰책방"/>
	<jsp:param name="currentPageIndex" value="1"/>
</jsp:include>
		
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookReport.css">
		
		<aside>
			<div></div>
		</aside>
		
		<section>
			<div id="editorBox"></div>
			<button id="saveBtn">저장</button>
		</section>
	</div>

	<input type="hidden" id="contextPath" value="${path}">
	
	<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
	<script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
	<script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
	<script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>
	<script src="${path}/resources/js/ebook/wizard/ebookReport.js"></script>
	
</body>
</html>