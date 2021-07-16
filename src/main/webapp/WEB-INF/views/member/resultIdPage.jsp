<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<p>이창은 5초후에 닫힙니다.</p>
	
	<c:if test="${m2 ne null}">
		사용자의 아이디는 ${m2 } 입니다.
	</c:if>
	

	
</body>
</html>

<script type="text/javascript">
setTimeout(function(){
	
	window.close();
},5000);
</script>