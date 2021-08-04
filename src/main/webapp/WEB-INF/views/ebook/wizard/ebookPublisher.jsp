<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e노트 출판 - 문곰책방"/>
</jsp:include>
		
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookPublisher.css">
		
		<aside>
			<div></div>
		</aside>
		
		<section>
			
		</section>
	</div>

	<input type="hidden" id="contextPath" value="${path}">
	
	<script src="${path}/resources/js/ebook/wizard/ebookPublisher.js"></script>
	
</body>
</html>