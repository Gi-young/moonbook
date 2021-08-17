<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
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
	
}
.title-font{
	font-size: 24px;
	font-weight: 800;
}
</style>
</head>
<body>

	<p class="title-font">공지사항 작성 </p>
	<form class="review-form" action="${path }/ServiceboardController/noticeBoardWrite.do" method="post">
	    제목 : <input type="text" id="noticeTitle" name="noticeTitle">
		내용 : <textarea cols="5" rows="20" id="noticeContent" name="noticeContent"></textarea>	
		<input type="hidden" value="${loginMember.memberId }" id="memberId" name="memberId">
		<button class="subBtn">등록하기</button>
	</form>
	
</body>
</html>