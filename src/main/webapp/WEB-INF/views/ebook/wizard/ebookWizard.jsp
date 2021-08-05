<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e북 마법사 - 문곰책방"/>
</jsp:include>

		<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookWizard.css"/>
		
		<aside>
			<h2>내 서재</h2>
			
			<ul>
				<li>나의 모든 e북</li>
			</ul>
			
			<div class="library-controller">
				<input type="text" placeholder="분류 이름">
				<button onclick="">분류 추가</button>
				<select></select>
				<button onclick="">분류 삭제</button>
			</div>
		</aside>
		
		<section>
			<div class="pseudo-box"></div>
		</section>
	</div>

	<input type="hidden" id="contextPath" value="${path}">
	
	<script src="${path}/resources/js/ebook/wizard/ebookWizard.js"></script>
	
</body>
</html>