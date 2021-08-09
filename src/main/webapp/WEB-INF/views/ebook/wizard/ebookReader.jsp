<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e북 리더 - 문곰책방"/>
	<jsp:param name="currentPageIndex" value="7"/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookReader.css">

	<aside>
			<div id="asideController">
				<button onclick="showBookMark();">북마크</button>
				<button onclick="showTesseract();">TESSERACT</button>
			</div>
	
			<div id="bookMark">
				<div id="markList"></div>
				
				<div id="markController">
					<input id="bookMarkName" type="text" placeholder="북마크 제목">
					<div>
						<input id="bookMarkTargetPage" type="number" min="1" step="1" value="1">
						<button onclick="createCustomBookMark();">북마크 생성</button>
					</div>
				</div>
			</div>
			
			<div id="textTurmoil">
				<div id="pseudoBox">
					<div id="parsedTextData"></div>
					
					<div id="tesseractController">
						<button id="pageToTextBtn">텍스트로 변환</button>
						<button id="textToSpeechBtn">읽어 줘</button>
						<button id="stopSpeechBtn">그만 읽어</button>
					</div>
				</div>
				
				<div id="tesseractLoaderBox">
					<div id="tesseractLoader"></div>
					<div id="tesseractLoaderMessage">
						텍스트를 추출 중입니다
					</div>
				</div>
			</div>
			
			<div id="pageController">
				<div id="pageStatus">
					<input type="number" id="moveToPage" min="1" value="1"> / <span id="page-count"></span>
				</div>
				
				<button id="moveToPageBtn">이동</button>
			</div>
			
			<div id="readingInfo">
				<div>오늘 독서시간: <span id="readTime"></span>분</div>
				<div>오늘 독서량: <span id="readPage"></span>p</div>
			</div>
	</aside>

	<section>
		<div id="book">
			<div id="binding">
				<c:forEach begin="1" end="26">
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
		
		<div id="bookLoaderBox">
			<div id="bookLoader"></div>
			<div id="bookLoaderMessage">책을 불러오는 중입니다. 잠시만 기다려주세요</div>
		</div>
	</section>

	<input type="hidden" id="bindNo" value="${bindNo}">
	<input type="hidden" id="filepath" value="${filepath}">
	<input type="hidden" id="autoplay" value="${cookie.grantAutoplay.value}">
	
	<script src='https://unpkg.com/tesseract.js@v2.1.0/dist/tesseract.min.js'></script>
	<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
	<script src="${path}/resources/js/ebook/wizard/ebookReader.js"></script>

</body>
</html>