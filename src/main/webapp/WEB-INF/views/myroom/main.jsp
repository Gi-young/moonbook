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
		<div class="myroom_snb">
			<h2 class="cscenter_h2">
				<a href="${path }/member/myroom.do">마이룸</a>
			</h2>
			<ul class="cscenter_snb3">
				<li><strong>주문관리</strong>
					<ul>
						<li><a href="#">주문/배송조회</a></li>
						<li><a href="#">취소/교환/반품조회</a></li>
					</ul></li>
				<li><strong>e-Book</strong>
					<ul>
						<li><a href="#">e-Book서재</a></li>
						<li><a href="#">찜</a></li>
					</ul></li>
				<li><a href="#"><strong>쿠폰함</strong></a></li>
				<li><a href="#"><strong>문의내역</strong></a></li>
				<li><strong>회원정보관리</strong>
					<ul>
						<li><a href="#">회원정보수정</a></li>
						<li><a href="#">비밀번호변경</a></li>
						<li><a href="#">회원등급조회/혜택안내</a></li>
						<li><a href="#">회원탈퇴</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="myroom_contents">
			<div class="out_myroom_gradearea">
				<div class="user_section">
					<div class="user_name">이름님 (회원등급)</div>
					<div class="btn_group">
						<a href="#" class="btn_small">혜택보기</a> <a href="#"
							class="btn_small">다음달 예상 등급</a>
					</div>
				</div>
				<table class="user_info_list">
					<tr>
						<td class="first">
							<div class="tit">
								<a href="#">쿠폰</a>
							</div>
							<div class="padding3">
								<a href="#"><strong class="bold">숫자</strong></a>장
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<h3 class="bul_green20">
			<span class="bold">나의 최근 주문현황</span>
			<div class="sub_title">
				<span class="col">|</span>"최근 1개월 기준"
			</div>
		</h3>
		<div class=order_tracking_section>
			<ul class="process_list">
				<li class="cell1">주문접수<span>숫자</span></li>
				<li class="cell2">결제완료<span>숫자</span></li>
				<li class="cell3">상품준비중<span>숫자</span></li>
				<li class="cell4">출고작업중<span>숫자</span></li>
				<li class="cell5">배송중<span>숫자</span></li>
				<li class="cell6">배송완료<span>숫자</span></li>
			</ul>
			<div class="total_order">
				<ul>
					<li><span class="tit">취소</span><a href="#"><strong>숫자</strong></a>건</li>
					<li><span class="tit">교환</span><a href="#"><strong>숫자</strong></a>건</li>
					<li><span class="tit">반품</span><a href="#"><strong>숫자</strong></a>건</li>
				</ul>
			</div>
		</div>
	</div>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>