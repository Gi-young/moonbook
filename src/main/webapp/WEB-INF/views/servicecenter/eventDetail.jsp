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
<body>
<div class="service-container">
	<div class="service-box1">
		<div class="service-box3">
			<jsp:include page="/WEB-INF/views/common/serviceSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="service-box2">
			<div style="display:flex; justify-content:center; margin-top:20px; margin-bottom:30px;" ><p style="font-size:30px;">공지사항</p></div>
			<div style="display:flex; justify-content:flex-end; margin-right:5px; margin-bottom:5px;">
        </div>
          <div class="service-box2" style="border:none;">
           <table class="review-exp review-board" id="targetTable" style="width:770px;">
	            <tr>
	            <th style='width:70px;'>${event.eventboardNo}</th>
	            <th style='width:480px;'>${event.eventboardTitle}</th>
	            <th style='width:110px;'>${event.memberId}</th>
	            <th style='width:110px;'>${event.eventboardDate}</th>
	            </tr>
            <tr class='review-text review-tr'>
	         <td>내용</td>
	         <td colspan="3">
	         <p>
	           	${event.eventboardContent }
	         </p>
	         </td>
	   	    </tr>
           </table>	
        <div style="display:flex; justify-content:center; align-items:center; ">	
			<a href="javascript:history.back()"><img id="backImg" src="${path }/resources/img/sellLev1/back2.png" alt="문곰도서" style="opacity:0.5;"></a>
		</div>
        <div id="pageBar"></div> 
		</div>
		</div>
		</div>
	</div>
</body>
		<script>
		let backImg = document.getElementById("backImg");
		backImg.addEventListener("mouseover", ()=>{
			backImg.style.opacity="1";
		});
		backImg.addEventListener("mouseout", ()=>{
			backImg.style.opacity="0.5";
		});
		</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>