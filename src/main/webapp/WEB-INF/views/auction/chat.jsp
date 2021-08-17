<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
 
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</head>
<body>
	<input type="text" value="" id="send">
	<button onclick="sendMessage();">체크</button>
</body>

<script>
let sockAuction = new SockJS("http://localhost:9090" + "${path}" + "/auction");

sockAuction.onopen = (e) => {
	console.log(e);
	
}

sockAuction.onmessage = (i) => {
	console.log(i);
}

sockAuction.onclose = (e) => {
	console.log(e);
}
function sendMessage() {
	sockAuction.send($("#send").val());
} 


</script>
</html>