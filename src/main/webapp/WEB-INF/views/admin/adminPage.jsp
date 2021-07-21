<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/adminPage.css">
<style>
/* table tbody {
	border: black 1px solid;
    width: 750px;
    border-collapse: collapse;
   
}
th, td{
border: black 1px solid;
background-color: #582810;
}  */
.sub_content1{
	display:none;
}
.sub_content2{
	display:none;
}
.sub_content3{
	display:none;
}
.sub_content4{
	display:none;
}
.sub_content5{
	display:none;
}

</style>
<div class="wrap">
	<div class="container">
		<p class="path">
			홈 > <span>관리자페이지</span>
		</p>
		<div class="admin_snb">
			<h2 class="cscenter_h2">
				<a href="${path }/admin/adminPage.do">관리자페이지</a>
			</h2>
			
			<div class="" style="display:flex;">
			
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include> 
			
			<div class="admin_contents">
				<div class="memberT-container">
					<table class="memberT">
						<tr>
							<th class="">회원 아이디</th>
							<th>회원 이름</th>
							<th>회원 전화번호</th>
							<th>회원 성별</th>
							<th>회원 포인트</th>
							<th>회원 등급</th>
						</tr>
						<tr>
							<td>${memberId }1</td>
							<td>${memberName }2</td>
							<td>${memberPhone }3</td>
							<td>${memberGender }4</td>
							<td>${memberPoint }5</td>
							<td>${memberGradeNo }6</td>
						</tr>

					</table>
				</div>
			</div>
			</div>
		</div>
	</div>




</div>

<style>

</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>