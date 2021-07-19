<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/login/reset.css">
<link rel="stylesheet" href="${path }/resources/css/login/sleepingMemberPage.css">

<div class="sleepingMemberPage-container">
		<div class="loginInfo">
			<p>홈 > 로그인</p>
			<hr class="hr1">
			<h3>미이용 회원조회>알림</h3>
		<hr class="hr2">
		</div>
		<div class="sleepingBox1">
			<p class="sleepingInfo-title">미이용 회원 조회/복원</p>
			<p class="sleepingInfo-subtitle">본인확인을 통한 복원절차를 이용해보세요!</p>
			
			<div class="sleepingLogo">
				<img alt="잠자는로고사진"
					src="${path }/resources/img/login/restmember.png">
			</div>
			
			<div class="sleepingBox2">
			<p><span class="sleepingInfo-font">개인정보 보호법 제39조 6(개인정보의 파기에 대한 특례)</span>에 의거하여 KH문고에서는 고객님의 정보를 안전하게<br>
				보호하기 위해 전 1년간 로그인, 구매 등 이용이 없는 고객님의 정보를 미이용 회원으로 전환하여<br>
				별도 분리저장하는 정책을 2015년 8월 18일부터 실시하고 있습니다.<br>
				(기존에 등록하신 회원정보가 불명확하여 복원이 불가한 경우 신규가입을 해주시기 바랍니다.)</p>
			<br><br>
			<p><span class="sleepingInfo-font">미이용 회원은 로그인, 포인트 적립 및 사용 등 서비스 이용이 제한될 수 있습니다.</span><br>
				원활한 KH문고 이용을 위해 회원님의 상태를 확인해 주시기 바랍니다.</p>
			</div>
			<div class="sleepingBox3">
				<p class="sleepingInfo-font2">로그인을 통해 미이용 회원조회가 가능합니다.</p>
				<button class="sleepingBtn1" onclick="location.assign('${path}/member/loginPage.do')">회원 로그인</button>
			</div>
		
		
		</div>
		
		
		
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
<jsp:param name="" value=""/>
</jsp:include>