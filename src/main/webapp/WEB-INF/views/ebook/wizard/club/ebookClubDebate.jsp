<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e북 독서클럽 - 문곰책방"/>
	<jsp:param name="currentPageIndex" value="3"/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookClub.css">
	
	<aside>
		<ul>
			<li><a href="${path}/ebook/pageEbookClubManager.do">나의 클럽 관리하기</a></li>
			<li><a href="${path}/ebook/pageEbookClubBoard.do">클럽 게시판</a></li>
			<li><a href="${path}/ebook/pageEbookClubDebate.do">토론방</a></li>
			<li><a href="${path}/ebook/pageEbookClubDebateManager.do">토론 관리하기</a></li>
			<li><a href="${path}/ebook/pageEbookClubGather.do">클럽 홍보마당</a></li>
		</ul>
	</aside>
	
		<section>
			<select id="selectClub"></select>
		
			<div id="debateBox">메시지</div>
			
			<input type="text" id="debateMessage">
			<input type="button" id="submitBtn" value="입력">
			
			<input type="file" id="uploadImage">
			
		</section>
	</div>
	
	<section>
	
		<div id="noticeBoard" style="display: hidden;"></div>
	</section>

	<input type="hidden" id="contextPath" value="${path}">
	
	<script src="${path}/resources/js/ebook/wizard/ebookClub.js"></script>
	<script src="${path}/resources/js/ebook/wizard/ebookClubDebate.js"></script>
	
</body>
</html>