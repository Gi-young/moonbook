<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 글쓰기</title>
	<link rel="icon" href="${path}/resources/images/ebook/favicon.png" sizes="16x16">
	<style>
		html, body {
			margin: 0;
			padding: 0;
			width: 100%;
			height: 100%;
		}
		
		body {
			display: grid;
			grid-template-rows: 15px 7px 1fr 7px 15px;
		}
		
		div.color-band {
			background-color: #582810;
		}
		
		div.inner-color-band {
			background-color: #E5E2DB;
		}
		
		main {
			position: relative;
			display: flex;
			flex-direction: row;
			flex-wrap: nowrap;
			justify-content: center;
			align-items: center;
		}
		
		div.write-container {
			box-sizing: border-box;
			border: 1px solid silver;
			border-radius: 5px;
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			width: 80%;
			height: 60%;
			padding: 20px;
		}
		
		div.write-container>textarea {
			width: 100%;
			flex-grow: 1;
		}
		
		div.write-container>input[type=button] {
			width: 100%;
			margin-top: 10px;
			background-color: white;
			border: 1px solid black;
			color: black;
		}
		
		div.write-container>input[type=button]:hover {
			background-color: black;
			color: white;
			cursor: pointer;
		}
		
		div.write-notice {
			color: red;
			font-size: 13px;
			font-weight: bold;
			position: absolute;
			left: 50px;
			top: 215px;
			width: 300px;
			height: 20px;
			text-align: center;
		}
		
		div.board-title {
			font-size: 13px;
			margin-bottom: 10px;
			width: 100%;
			display: flex;
			flex-direction: row;
			flex-wrap: nowrap;
			justify-content: center;
			align-items: center;
		}
		
		div.board-title input[type=text] {
			flex-grow: 1;
		}
	</style>
</head>
<body>

	<div class="color-band"></div>
	<div class="inner-color-band"></div>
	
	<main>
		<div class="write-container">
			<div class="board-title">
				<label for="boardTitle">제목 : &nbsp;</label>
				<input type="text" id="boardTitle">
			</div>
		
			<textarea id="content"></textarea>
			
			<input type="button" value="등록" onclick="writeBoard();">
		</div>
		
		<div class="write-notice"></div>
	</main>
	
	<div class="inner-color-band"></div>
	<div class="color-band"></div>
	
	<input type="hidden" id="loginMemberId" value="${sessionScope.loginMember.memberId}">
	<input type="hidden" id="clubName" value="${clubName}">
	
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<script>
		let loginMemberId = document.getElementById("loginMemberId").value;
		let clubName = document.getElementById("clubName").value;
		let writeNotice = document.querySelector("div.write-notice");
		
		function writeBoard() {
			let content = document.getElementById("content").value;
			let title = document.getElementById("boardTitle").value;
			
			if (title === "" || content === "") {
				writeNotice.innerText = "내용을 입력해주세요";
			} else {
				$.ajax({
					url: "${path}/ebook/writeBoard.do",
					type: "GET",
					data: {
						loginMemberId: loginMemberId,
						title: title,
						clubName: clubName,
						content: content
					},
					success: data => {
						if (data > 0) {
							window.close();
						} else {
							write.innerText = "작성에 실패하였습니다. 다시 시도해주세요";
						}
						
					}
				});
			}
		}
	</script>
	
</body>
</html>