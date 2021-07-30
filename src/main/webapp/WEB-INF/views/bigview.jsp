<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
<img src="${book.image }" alt="크게보기"> 
테스트입니다.
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
   <jsp:param name="" value=""/>
</jsp:include>