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
		<li><h3>
				<a href="#">판매 내역</a>
			</h3></li>
		<li><h3>
				<a href="#">회원 관리</a>
			</h3></li>
		<li class="sub-menu2"><h3>
				<a href="#">제품 관리</a></h3>
			<ul class="sub_content2">
			<li><button>매입등록</button></li>
			<li><button>매입내역</button></li>
			<li><button>재고현황</button></li>
			<li><button>입출고현황</button></li>
		</ul>
			</li>
		<li class="sub-menu3"><h3>
				<a href="#">분석</a>
			</h3>
			<ul class="sub_content3">
			<li><button>수입및지출집계</button></li>
			<li><button>일별매출집계</button></li>
			<li><button>제품별매출집계</button></li>
			<li><button>매출상세분석</button></li>
			<li><button>월별제품매출분석</button></li>
		</ul>
			</li>
		<li class="sub-menu4"><h3>
				<a href="#">고객센터</a>
			</h3>
			<ul class="sub_content4">
			<li><button>공지사항</button></li>
			<li><button>FAQ관리</button></li>
			<li><button>1대1상담</button></li>
			<li><button>기업정보</button></li>
		</ul>
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

	/* function adUpdateMember(){
	 $.get("${path}/admin/adUpdateMember",data =>{
	 console.log(data);
	 });
	 } */
</script>