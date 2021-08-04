<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e북 마법사 - 문곰책방"/>
</jsp:include>

		<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookWizard.css"/>
		
		<aside>
			<div></div>
		</aside>
		
		<section>
			<button id="readBookBtn">책 읽기</button>
			
		</section>
	</div>

	<input type="hidden" id="contextPath" value="${path}">
	
	<script src="${path}/resources/js/ebook/wizard/ebookWizard.js"></script>
	
</body>
</html>