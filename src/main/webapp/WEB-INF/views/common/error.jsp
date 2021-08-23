<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="title" value="에러 페이지"/>
</jsp:include>

   <section id="content">
   		<div style="display:flex; justify-content:center; margin-top:50px; margin-bottom:30px;">
         <img src="${path }/resources/img/common/errorPage2.png" alt="errorPage">
        </div>
         <script>
            setTimeout(()=>{
               location.replace('${path}');
            },3000);
         </script>
   </section>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp"/>