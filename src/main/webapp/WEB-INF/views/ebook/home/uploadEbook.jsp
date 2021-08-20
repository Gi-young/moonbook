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
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/home/uploadEbook.css">
</head>
<body>
	<div class="color-band"></div>
	<div class="inner-color-band"></div>
	
	<form action="${path}/ebook/uploadEbook.do" method="post" enctype="multipart/form-data">
		<div class="inner-container">
			<p>BOOK_EBOOK_DATABIND에 맞춰 BIND_NO를 입력하세요<p>
			
			<div class="input-box">
				<label class="bind-no width-100 flex-row">bindNo : <input type="number" name="ebookNo" value="1" min="1" step="1" required></label>

				<div class="width-100 flex-row">
					<label for="upFile">파일 선택</label>
					<input type="text" id="filepath" class="flexgrow-1" placeholder="선택된 파일 없음" readonly>
					<input type="file" id="upFile" name="upFile">
				</div>

				<input type="submit" class="width-100" value="업로드">
			</div>
		</div>
		
		<div id="resultMessage"></div>
	</form>
	
	<div class="inner-color-band"></div>
	<div class="color-band"></div>
	
	<script>
		let message = document.getElementById("resultMessage");
	
		<c:if test="${result != null}">
			<c:if test="${message.equals('success')}">
				message.innerText = "업로드 성공";
				message.style.color = "green";
			</c:if>
			<c:if test="${message.equals('fail')}">
				message.innerText = "업로드 실패";
				message.style.color = "red";
			</c:if>
		</c:if>
		
		document.getElementById("upFile").addEventListener("change", (e) => {
			document.getElementById("filepath").value = e.target.value;	
		});
	</script>
	
</body>
</html>