<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet"
	href="${path}/resources/css/admin/adminSideBar.css">

<style>
</style>
<ul class="cscenter_snb3" style="">
	<li class="sub-menu0"><strong>판매 내역</strong></li>
	<li class="sub-menu1"><strong>회원 관리</strong></li>
	<li class="sub-menu2"><strong>제품 관리</strong>
		<ul class="sub_content2">
			<li><button>매입등록</button></li>
			<li><button>매입내역</button></li>
			<li><button>재고현황</button></li>
			<li><button>입출고현황</button></li>
		</ul></li>

	<li class="sub-menu3"><strong>분석</strong>
		<ul class="sub_content3">
			<li><button>수입및지출집계</button></li>
			<li><button>일별매출집계</button></li>
			<li><button>제품별매출집계</button></li>
			<li><button>매출상세분석</button></li>
			<li><button>월별제품매출분석</button></li>

		</ul></li>
	<li class="sub-menu4"><strong>고객센터</strong>
		<ul class="sub_content4">
			<li><button>공지사항</button></li>
			<li><button>FAQ관리</button></li>
			<li><button>1대1상담</button></li>
			<li><button>기업정보</button></li>
		</ul></li>
</ul>


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