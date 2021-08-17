<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>e북 업로드</title>
	<link rel="icon" href="${path}/resources/images/ebook/favicon.png" sizes="16x16">
</head>
<body>
	<form action="${path}/ebook/uploadEbook.do" method="post" enctype="multipart/form-data">
		<div>
			<p>업로드할 eBook에 상응하는 BOOK_EBOOK_DATABIND의 BIND_NO를 입력하세요<p>
			<input type="number" name="ebookNo" value="1" min="1" step="1" required>
		
			<input type="file" name="upFile">
		
			<input type="submit" value="업로드">
		</div>
	</form>
	
	<script>
		<c:if test="${result != null}">
			alert("${message}");
		</c:if>
	</script>
	
</body>
</html>