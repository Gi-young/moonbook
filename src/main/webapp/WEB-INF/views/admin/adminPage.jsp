<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path }/resources/css/admin/adminPage.css">

<div class="wrap">
	<div class="container">
		<p class="path">
			홈 > <span>관리자페이지</span>
		</p>
		<div class="admin_snb">
			<h2 class="cscenter_h2">
				<a href="${path }/admin/adminPage.do">관리자페이지</a>
			</h2>
			<ul class="cscenter_snb3" style="width:180px;">
				<li><strong>회원 관리</strong>
					<ul>
						<li><button>수정</button></li>
						<li><button>삭제</button></li>
					</ul></li>
				<li><strong>책 관리</strong>
					<ul>
						<li><button>등록</button></li>
						<li><button>수정</button></li>
						<li><button>삭제</button></li>
					</ul></li>
				
				<li><strong>기프트 관리</strong>
					<ul>
						<li><button>등록</button></li>
						<li><button>수정</button></li>
						<li><button>삭제</button></li>
				</ul></li>
				<li><strong>FAQ 관리</strong>
					<ul>
						<li><button>등록</button></li>
						<li><button>수정</button></li>
						<li><button>삭제</button></li>
					</ul></li>
					<li><strong>공지사항</strong>
					<ul>
						<li><button>등록</button></li>
						<li><button>수정</button></li>
						<li><button>삭제</button></li>
					</ul></li>
			</ul>
		</div>
		
	</div>


</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp">
<jsp:param name="" value=""/>
</jsp:include>