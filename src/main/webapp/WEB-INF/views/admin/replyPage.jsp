<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 답변하기</title>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/replyPage.css">
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="FaqAnswer-container">
		<form action="${path }/admin/updateFaqAnswer.do" method="post" id="FaqAnswerForm">
			<div class="FaqAnswer-title">
				
				<input type="hidden" value="${faq.faqNo }" name="faqNo"><span class="faqcolor">[${faq.faqcgNum.faqcgName }]&nbsp;</span><span class="faqcolor">${faq.faqAsked }</span><span class="faqOx1"><c:if test="${faq.faqStatus==0 }">(접수대기)</c:if></span>
				<span class="faqOx2"><c:if test="${faq.faqStatus ==1}">(답변완료)</c:if></span><span><input type="button" onclick="updateFaqBtn()" value="등록" class="replyFaq"></span>
			</div>
			<div class="FaqAnswer-box">
				<textarea name="faqAnswer" value="" class="faqTextArea"></textarea>
			</div>
		</form>
	</div>
</body>
</html>
<script type="text/javascript">

function updateFaqBtn(){
	$("#FaqAnswerForm").submit();
	
}

/* function fn_resultIdPwdBtn(){
	
	opener.document.getElementById('memberId_').value='${m2}';
	opener.document.getElementById('password').focus();
	
	window.close();
} */
</script>
