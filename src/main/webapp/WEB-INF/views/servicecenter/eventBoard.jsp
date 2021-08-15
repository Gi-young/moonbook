<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/service/serviceMain.css">
<link rel="stylesheet" href="${path }/resources/css/bookdetail/bookdetail.css">
<div class="service-container">
	<div class="service-box1">
		<div class="service-box3">
			<jsp:include page="/WEB-INF/views/common/serviceSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="service-box2">
					<div style="display:flex; justify-content:center; margin-top:20px; margin-bottom:30px;" ><p style="font-size:30px;">공지사항</p></div>
          <div class="service-box2" style="board:none;">
           <table class="review-exp review-board" id="targetTable" style="width:770px;">
            <tr><th style='width:50px;'>번호</th>
            <th style='width:480px;'>내용</th>
            <th style='width:120px;'>작성자</th>
            <th style='width:120px;'>작성일</th></tr>
            <tr class='review-text review-tr'>
            <%-- <c:forEach var="b" items="#"> --%>
	            <td class='review-num'>1</td>
		   	    <td>
			   	    <div class='review'>
			   	    	<a class='review-title-a'><a href="#">나다 이눔아</a>
			   	    </div>
		   	    </td>
		   	    <td class='review-writer'>관리자빡빡</td>
		   	    <td class='review-date'>SYSDATE</td>
	   	    </tr>
	   	    <%-- </c:forEach> --%>
           </table>

        <div id="pageBar"></div> 
		</div>
		</div>
	</div>
</div>


<style>
</style>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>