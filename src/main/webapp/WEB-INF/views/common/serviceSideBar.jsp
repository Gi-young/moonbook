<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet"
	href="${path}/resources/css/service/serviceSideBar.css">

<style>
</style>
<div class="service_sideMenu">
	<%-- <h1 class="padding10">
		<a href="${path }/member/myroom.do">마이페이지</a>
	</h1> --%>
	<h2 class="padding10">
		<a href="">고객센터</a>
	</h2>
	<ul class="sideMenu" style="width:180px;">
		<li>
				<p onclick="location.assign('${path}/service/serviceMain.do')" id="noticeBtn" class="serviceColor">공지사항</p>
		</li>
		<li>
				<p onclick="location.assign('${path}/service/eventBoard.do')" id="eventBtn" class="serviceColor">이벤트</p>
		</li>
		<li>
				<p onclick="location.assign('${path}/service/faqPage.do')" id="faqBtn" class="serviceColor">FAQ</p>
		</li>
		
	</ul>
</div>


<script>
	$('.sub-menu0').click(function() {
		$('.sub_content0').slideToggle('slow');

	});
	$('.sub-menu1').click(function() {
		$('.sub_content1').slideToggle('slow');

	});
	$('.sub-menu2').click(function() {
		$('.sub_content2').slideToggle('slow');

	});
	$('.sub-menu3').click(function() {
		$('.sub_content3').slideToggle('slow');

	});
	$('.sub-menu4').click(function() {
		$('.sub_content4').slideToggle('slow');

	});
	$('.sub-menu5').click(function() {
		$('.sub_content5').slideToggle('slow');

	});
	$('.sub-menu6').click(function() {
		$('.sub_content6').slideToggle('slow');

	});


</script>