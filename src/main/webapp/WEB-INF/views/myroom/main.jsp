<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="마이룸 - KH문고" />
</jsp:include> --%>
<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
	<jsp:param name="title" value="마이룸 - KH문고" />
</jsp:include>
<%-- <div class="wrap">
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
				<li><a href="#"><strong>관심작가</strong></a></li>
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
					<div class="user_name">${loginMember.memberName }님
						(${loginMember.memberGrade })</div>
					<div class="btn_group">
						<a href="${path }/member/grade.do" class="btn_small">혜택보기</a> <a
							href="${path }/member/nextgrade.do" class="btn_small">다음달 예상
							등급</a>
					</div>
				</div>
				<table class="user_info_list">
					<tr>
						<td class="first">
							<div class="tit">
								<a href="#">쿠폰</a>
							</div>
							<div class="padding3">
								<a href="#"><strong class="bold">${coupon.size() }</strong></a>장
							</div>
						</td>
					</tr>
				</table>
			</div> --%>

			<h3 class="bul_green20">
				<span class="bold">나의 최근 주문현황</span>
				<div class="sub_title">
					<span class="col">|</span>최근 1개월 기준
				</div>
			</h3>
			<div class=order_tracking_section>
				<ul class="process_list">
					<li class="cell1">주문접수<span>0</span></li>
					<li class="cell2">결제완료<span>0</span></li>
					<li class="cell3">상품준비중<span>0</span></li>
					<li class="cell4">출고작업중<span>0</span></li>
					<li class="cell5">배송중<span>0</span></li>
					<li class="cell6">배송완료<span>0</span></li>
				</ul>
				<div class="total_order">
					<ul>
						<li><span class="tit">취소</span><a href="#"><strong
								class="bold">75</strong></a>건</li>
						<li><span class="tit">교환</span><a href="#"><strong
								class="bold">150</strong></a>건</li>
						<li><span class="tit">반품</span><a href="#"><strong
								class="bold">2222</strong></a>건</li>
					</ul>
				</div>
			</div>
			<table class="table_myroom td_font_12 margin_top20">
				<%-- <caption>최근 주문 내용</caption> --%>
				<colgroup>
					<col width="14%">
					<col width="14%">
					<col width="70">
					<col>
					<col width="5%">
					<col width="14%">
					<col width="14%">
				</colgroup>
				<tr>
					<th class="first" scope="col">주문번호</th>
					<th scope="col">주문금액</th>
					<th scope="col" colspan="2">상품정보</th>
					<th scope="col">수량</th>
					<th scope="col">주문상태</th>
					<th scope="col">주문변경</th>
				</tr>
				<tr>
					<td class="first none_data" colspan="7">최근 주문내용 목록이 없습니다.</td>
				</tr>
			</table>
			<div class="paging_num_my">
				<img src="${path }/resources/images/btn_prev02.gif" class="imover">
				<img src="${path }/resources/images/btn_next02.gif" class="imover">
			</div>
			<div class="box_info_my margin_top30">
				<h3>
					<img src="${path }/resources/images/icon_info.gif">안내사항
				</h3>
				<ul>
					<li>● 주문번호를 클릭하면 주문/배송 상세내역을 확인하실 수 있습니다.</li>
					<li>● 주문정보 수정은 (주문취소/배송지변경, 교환/반품신청) 주문/배송 상세페이지에서 가능합니다.</li>
					<li>● 배송조회는 택배사로 상품전달 후 조회 가능합니다.</li>
					<li>● e-Book은 구매 후 e-Book서재를 통해 이용가능합니다.</li>
					<li>● 주문한 상품이 품절될 경우 해당 상품은 자동 주문취소되며, 결제금액은 승인 취소됩니다.</li>
				</ul>
			</div>

			<h3 class="bul_green20 padding10 margin_top30">
				<span class="bold">나의 관심상품</span>
			</h3>
			<div class="myroom_wishlist margin_top30">
				<div class="tab_menu02">
					<ul>
						<li class="myTab"><a href="#">최근 본 도서</a></li>
						<li class="myTab on"><a href="#">최근 본 기프트</a></li>
					</ul>
				</div>
				<div class="myroom_wishlist_slide" style="display: none;">
					<p class="no_data">최근에 본 도서가 없습니다.</p>
				</div>
				<div class="myroom_wishlist_slide">
					<div class="mask">
						<ul class="myroom_wishlist_roll">
							<li><dl class="prod_type01">
									<dt>
										<a href="#"><img
											src="${path }/resources/images/m9791190885843.jpg"></a>
									</dt>
									<dd class="title">
										<a href="#">[도서분류]책제목</a>
									</dd>
									<dd class="writer">작가지음</dd>
									<dd class="price">
										<strong class="bold">가격</strong>
									</dd>
								</dl>
						</ul>
					</div>
					<a href="#" class="btn_prev"> <img
						src="${path }/resources/images/gifts_list_arr1.gif">
					</a> <a href="#" class="btn_next"> <img
						src="${path }/resources/images/gifts_list_arr2.gif">
					</a>
				</div>
			</div>
		</div>
	</div>


</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include>