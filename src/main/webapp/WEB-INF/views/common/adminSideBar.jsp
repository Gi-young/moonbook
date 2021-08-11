<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet"
	href="${path}/resources/css/admin/adminSideBar.css">

<style>
</style>
<div class="admin_sideMenu">
	<%-- <h1 class="padding10">
		<a href="${path }/member/myroom.do">마이페이지</a>
	</h1> --%>
	<h2 class="padding10">
		<a href="${path }/admin/adminPage.do">관리자페이지</a>
	</h2>
	<ul class="sideMenu" style="width:180px;">
		<li>
				<p onclick="location.assign('${path}/admin/adSalePage.do')" class="adminColor">판매 내역</p>
			</li>
		<li>
				<p onclick="location.assign('${path}/admin/adMemberPage.do')" class="adminColor">회원 관리</p>
			</li>
		<li class="sub-menu2">
				<p onclick="" class="adminColor">제품 관리</p>
			<ul class="sub_content2">
			<li><p onclick="location.assign('${path}/admin/addProductPage.do')" class="adminColor2">등록</p></li>
			<li><p onclick="location.assign('${path}/admin/inputProductPage2.do')" class="adminColor2">입고</p></li>
			<li><p onclick="location.assign('${path}/admin/removeProductPage.do')" class="adminColor2">출고</p></li>
			<li><p onclick="location.assign('${path}/admin/stockProductPage.do')" class="adminColor2">재고현황</p></li>
		</ul>
			</li>
		<li class="sub-menu3">
				<p onclick="" class="adminColor">매출 분석</a>
			
			<ul class="sub_content3">
			<!-- <li><p onclick="" class="adminColor2">수입및지출집계</p></li>
			<li><p onclick="" class="adminColor2">일별매출집계</p></li> -->
			<li><p onclick="" class="adminColor2">차트</p></li>
			<li><p onclick="location.assign('${path}/admin/bookAnalysisPage.do')" class="adminColor2">책 상세</p></li>
			<li><p onclick="location.assign('${path}/admin/ebookAnalysisPage.do')" class="adminColor2">e북 상세</p></li>
			<li><p onclick="location.assign('${path}/admin/giftAnalysisPage.do')" class="adminColor2">기프트 상세</p></li>
			<!-- <li><p onclick="" class="adminColor2">월별제품매출분석</p></li> -->
		</ul>
			</li>
		<li class="sub-menu4">
				<p onclick="" class="adminColor">고객센터</a>
			
			<ul class="sub_content4">
			<li><p onclick="" class="adminColor2">공지사항</p></li>
			<li><p onclick="" class="adminColor2">FAQ관리</p></li>
			<li><p onclick="" class="adminColor2">이벤트</p></li>
			<li><p onclick="" class="adminColor2">1대1채팅</p></li>
		</ul>
			</li>
		<li class="sub-menu5">
			<p onclick="" class="adminColor">쿠폰관리</a>
			<ul class="sub_content5">
				<li><p onclick="location.assign('${path}/admin/addCouponPage.do')" class="adminColor2">등록</p></li>
			<li><p onclick="location.assign('${path}/admin/inputCouponPage.do')" class="adminColor2">발급</p></li>
			<li><p onclick="location.assign('${path}/admin/searchCouponlist.do')" class="adminColor2">조회</p></li>
			</ul>
		</li>
		<li class="sub-menu6">
			<p onclick="" class="adminColor">경매관리</a>
			<ul class="sub_content6">
				<li><p onclick="location.assign('${path}/admin/adminAuctionCatePage.do')" class="adminColor2">카테고리 등록</p></li>
			</ul>
		</li>
		<li class="sub-menu7">
			<p onclick="location.assign('${path}/admin/deliveryManagementPage.do')" class="adminColor">배송관리</a>
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