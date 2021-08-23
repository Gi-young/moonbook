<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
p {
font-family:'한컴 말랑말랑';
}

.review-form{
	display: flex;
	flex-direction: column;
	
}
#content{
	font-family: "한컴 말랑말랑";
	font-size: 20px;
	font-weight: bold;
	resize: none;
}
.score-div{
	display: flex;
	justify-content:center;
	align-items:center;
	
}

.title-font{
margin-left:40%;
font-size:30px;
font-weight:bold;
color:rgba(88,40,16,1);
}
.rbox p{
font-size:20px;
font-weight:bold;
color:rgba(88,40,16,1);
}
.rbox label{
font-size:20px;
font-weight:bold;
color:rgba(88,40,16,1);
}
.subBtn{
background-color:rgba(88,40,16,1);
color:white;
}
.writerv{
font-size:20px;
font-weight:bold;
color:rgba(88,40,16,1);
}
</style>
</head>
<body>

	<p class="title-font">리뷰 작성</p>
	<form class="review-form" action="${path }/SellbookController/reviewWrite.do" method="post" encType="multipart/form-data">
	<div style="display:flex; align-items: center; justify-content:center; border:6px solid rgba(88,40,16,1); margin-bottom:30px;">
	  	<p class="review-font"><img src="${b.image }" alt="도서이미지"></p>
	  <p class="review-font" style="margin-left:10px;">구매하신<p style="margin-left:10px; font-weight:800; color=#582810; font-size:20px;">${b.title }</p>&nbsp;은(는) 어떠셨나요?</p>
		</div>
		<p class="writerv">리뷰작성하기▼</p>
		<textarea cols="1" rows="4" id="content" name="content" style="border:6px solid rgba(88,40,16,1);">
		</textarea>
		<div class="rbox">
		<p class="review-font" style="margin-left:43%;">상품 만족도</p>	
		<div class="score-div">
			<input type="radio" id="score-0" name="score" value="0"><label for="score-0">0</label>&nbsp;&nbsp;
			<input type="radio" id="score-2" name="score" value="2"><label for="score-2">2</label>&nbsp;&nbsp;
			<input type="radio" id="score-4" name="score" value="4"><label for="score-4">4</label>&nbsp;&nbsp;
			<input type="radio" id="score-6" name="score" value="6"><label for="score-6">6</label>&nbsp;&nbsp;
			<input type="radio" id="score-8" name="score" value="8"><label for="score-8">8</label>&nbsp;&nbsp;
			<input type="radio" id="score-10" name="score" value="10"><label for="score-10">10</label>	
		</div>
		</div><br>
		<input type="hidden" value="${b.bindNo }" id="bindNo" name="bindNo">
		<input type="hidden" value="${loginMember.memberId }" id="loginMember" name="loginMember">
		<button class="subBtn">등록하기</button>
	</form>
	
</body>
</html>