<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
.review-form{
	display: flex;
	flex-direction: column;
	
}
#content{
	resize: none;
}
.score-div{
	display: flex;
	
}
.title-font{
	font-size: 24px;
	font-weight: 800;
}
</style>
</head>
<body>
	<p class="title-font">상품 리뷰 작성</p>
	<form class="review-form">
	  <p class="review-font">구매한 제품은 어떠셨나요?</p>
		<textarea cols="50" rows="50" id="content" name="content">
		</textarea>
	  	<p class="review-font">상품 사진</p>
		<input type="file">	
		<p class="review-font">상품 만족도</p>	
		<div class="score-div">
			<input type="radio" id="score-1" name="score"><label for="score-1">1</label>
			<input type="radio" id="score-2" name="score"><label for="score-2">2</label>
			<input type="radio" id="score-3" name="score"><label for="score-3">3</label>
			<input type="radio" id="score-4" name="score"><label for="score-4">4</label>
			<input type="radio" id="score-5" name="score"><label for="score-5">5</label>	
		</div>	
	</form>
	
</body>
</html>