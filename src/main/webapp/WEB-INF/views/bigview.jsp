<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
.bigview{
	width: -webkit-fill-available;
	height: -webkit-fill-available;
}
</style>

<img src="${bigview.image }" alt="크게보기" class="bigview">
 
