<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:inclue path="/WEB-INF/views/ebook/wizard/club/ebookClubCommon.jsp">
	<jsp:param name="title" value="e북 독서클럽 - 문곰책방"/>
</jsp:inclue>
		
		<section>
			<div id="debateBox">메시지</div>
			<input type="text" id="debateMessage">
			<input type="button" id="submitBtn" value="입력"/>
		</section>
	</div>

	<input type="hidden" id="contextPath" value="${path}">
</body>
</html>