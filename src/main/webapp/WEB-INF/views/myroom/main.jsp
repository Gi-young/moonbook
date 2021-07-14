<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<div class="wrap">
	<div class="container">
		<p class="path">
			홈 > <span>마이룸 > main</span>
		</p>
	</div>
	<div class="content_middle">
		<div class="myroom_snb">
			<h2 class="cscenter_h2">
				<a href="${path }/member/myroom.do">마이룸</a>
			</h2>
			<ul class="cscenter_snb3">
				<li><strong>일반상품 주문관리</strong>
					<ul>
						<li><a href="#">주문/배송조회</a></li>
						<li><a href="#">취소/교환/반품조회</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>