<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e북 리더 - 문곰책방"/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookReader.css">

	<aside></aside>

	<section id="container">
		<div id="bookController">
			<span>
				<span id="page-num"></span> / <span id="page-count"></span>
			</span>
			<div id="textTurmoil">
				<div id="parsedTextData"></div>
				<button id="pageToTextBtn">텍스트로 변환</button>
				<button id="textToSpeechBtn">읽어 줘</button>
			</div>
		</div>

		<div id="book">
			<div id="binding">
				<c:forEach begin="1" end="27">
					<img src="${path}/resources/images/ebook/binding.png">
				</c:forEach>
			</div>
			<canvas id="left-canvas" class="canvas"></canvas>
			<canvas id="right-canvas" class="canvas"></canvas>
		</div>

		<div class="hidden">
			<img id="left-canvas-img">
			<img id="right-canvas-img">
		</div>
	</section>

	<input type="hidden" id="filepath" value="${filepath}">
	
	<script src='https://unpkg.com/tesseract.js@v2.1.0/dist/tesseract.min.js'></script>
	<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
	<script src="${path}/resources/js/ebook/wizard/ebookReader.js"></script>

</body>
</html>