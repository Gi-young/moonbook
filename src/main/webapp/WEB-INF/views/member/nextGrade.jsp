<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
	<jsp:param name="title" value="회원등급조회" />
	<jsp:param name="subtitle" value="회원등급조회" />
</jsp:include>
<h3 class="bul_green20 padding_bottom20 bold">
	<span>회원 등급 확인</span>
</h3>
<div class="box_memberGrade">
	<strong class="bold">고객님은 <em>${membergrade.membergradeName }</em>
		회원입니다.
	</strong>
	<p>회원 등급은 직전 3개월간 순수구매액 기준으로 매월 1일 산정되며, 당월 구매실적에 관계없이 3개월간 유지됩니다.</p>
</div>
<h3 class="bul_green20 margin_top30 padding_bottom20 bold">
	<span>등급산정 반영금액</span>
</h3>
<table class="tbl_nextGrade">
	<tr>
		<th>구분</th>
		<th scope="col">4월</th>
		<th scope="col">5월</th>
		<th scope="col">6월</th>
	</tr>
	<tr>
		<td><strong>순수구매액</strong></td>
		<td>0원</td>
		<td>0원</td>
		<td>0원</td>
	</tr>
</table>
<ul class="list_nextGrade margin_top30">
	<li>매월 순수구매액은 전월 1일 ~ 당월 1일까지 구매내역입니다. ex) 7월 : 6월 1일 ~ 7월 1일</li>
	<li>순수구매액은 도서, 기프트 상품 구입시 결제한 실제 금액이며, 쿠폰을 통한 할인 금액은 순수구매액에서
		제외됩니다.</li>
</ul>
<h3 class="bul_green20 margin_top30 padding_bottom20 bold">
	<span>익월 예상 등급</span>
</h3>
<div class="text_nextGrade">
	8월 1일 등급산정시 반영될 금액은 <span>0</span>원으로 <strong class="bold">프렌즈</strong>
	회원 기준에 충족됩니다.
</div>
<table class="tbl_nextGrade">
	<tr>
		<th>구분</th>
		<th scope="col">5월</th>
		<th scope="col">6월</th>
		<th scope="col">7월</th>
		<th scope="col">상위등급 충족<br>추가 필요금액
		</th>
	</tr>
	<tr>
		<td><strong>순수구매액</strong></td>
		<td>0원</td>
		<td>0원</td>
		<td>0원</td>
		<td>+100000원</td>
	</tr>
</table>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>