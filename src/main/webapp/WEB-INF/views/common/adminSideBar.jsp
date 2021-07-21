<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path }/resources/css/admin/adminPage.css">

		<ul class="cscenter_snb3" style="width:180px;">
				<li><strong>ERP</strong></li>
				<li class="sub-menu1"><strong>회원 관리</strong>
					<ul class="sub_content1">
						<li class="sub-item"><button onclick="adUpdateMember()">수정</button></li>
						<li class="sub-item"><button>삭제</button></li>
					</ul></li>
				<li class="sub-menu2"><strong>책 관리</strong>
					<ul class="sub_content2">
						<li><button>등록</button></li>
						<li><button>수정</button></li>
						<li><button>삭제</button></li>
					</ul></li>
				
				<li class="sub-menu3"><strong>기프트 관리</strong>
					<ul class="sub_content3">
						<li><button>등록</button></li>
						<li><button>수정</button></li>
						<li><button>삭제</button></li>
				</ul></li>
				<li class="sub-menu4"><strong>FAQ 관리</strong>
					<ul class="sub_content4">
						<li><button>등록</button></li>
						<li><button>수정</button></li>
						<li><button>삭제</button></li>
					</ul></li>
					<li class="sub-menu5"><strong>공지사항</strong>
					<ul class="sub_content5">
						<li><button>등록</button></li>
						<li><button>수정</button></li>
						<li><button>삭제</button></li>
					</ul></li>
					
			</ul>
		
		
<script>

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




function adUpdateMember(){
	$.get("${path}/admin/adUpdateMember",data =>{
		console.log(data);
	});
}
</script>