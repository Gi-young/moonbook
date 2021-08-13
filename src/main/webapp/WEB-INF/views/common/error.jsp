<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="title" value="에러 페이지"/>
</jsp:include>

   <section id="content">
         <h1 style="color:red;"><%=exception.getMessage()%></h1>
         <h3>3초 후 메인화면으로 이동합니다</h3>
         <script>
            setTimeout(()=>{
               location.replace('${path}');
            },3000);
         </script>
   </section>
      
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>