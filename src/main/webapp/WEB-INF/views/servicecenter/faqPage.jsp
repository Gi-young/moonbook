<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/service/faqPage.css">

<div class="service-container">
	<div class="service-box1">
		<div class="service-box3">
			<jsp:include page="/WEB-INF/views/common/serviceSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="service-box2">
			<div class="service-box4">
					<div class="service-search3">
				<form class="service-search" action="">
						<table class="faqSearchTable">
							
							<tr>
								<th>FAQ 검색</th>
								<td class="search-box">
									<select name="type30">
										<option value="주문결제">주문결제</option>
										<option value="배송수령안내">배송수령안내</option>
										<option value="반품교환환불">반품교환환불</option>
										<option value="중고장터">중고장터</option>
										<option value="ebook">ebook</option>
										<option value="기타">기타</option>
									</select>
								</td>
								<td class="search-box">
									<input type="text" name="searchFaq"> 
									
								</td>
								<td class="search-box">
									<img alt="검색하기"
									src="${path }/resources/img/admin/search.png" onclick="searchFaqList();">
								</td>
							</tr>
							<tr>
								<th>FAQ 질문하기</th>
								<td class="search-box">
									<select name="type31">
										<option value="주문결제">주문결제</option>
										<option value="배송수령안내">배송수령일안내</option>
										<option value="반품교환환불">반품교환환불</option>
										<option value="중고장터">중고장터</option>
										<option value="ebook">ebook</option>
										<option value="기타">기타</option>
									</select>
								</td>
								<td class="search-box">
									<input type="text" name="askFaq"> 
								</td>
								<td class="search-box">
									<input type="button" value="등록" onclick="inputFaq()">
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="FAQlist-container">
						<p class="faqFont">※ FAQ 질문 / 답변</p>
						
						<div class="faqList-box1">
						<ul class="faqsideMenu">
						<c:forEach var="c" items="${list}" varStatus="vs">
							<li class="sub-faqmenu${vs.index} faqclassName">[${c.faqcgNum.faqcgName}] ${c.faqAsked}<span class="faqOx1"><c:if test="${c.faqStatus==0}">(접수대기)</c:if></span><span class="faqOx2"><c:if test="${c.faqStatus==1}">(답변완료)</c:if></span></li>
							<ul class="sub_faqcontent${vs.index} faqclassName2">
							<li class="last_li">
								<c:forEach var="a" items="${c.faqAnswer.split('.-')}" varStatus="vs">
									<c:if test="${!vs.last}">
										${a}<br>
									</c:if>
									<c:if test="${vs.last}">
										${a}
									</c:if>
								</c:forEach>
							
								<!-- 장바구니에서 선물주문을 하실 경우 휴대폰, 이메일로 선물번호를 발송하실 수 있습니다.<br>
								※ 대여, 구매 모두 가능하며 연재,시리즈 상품은 장바구니에서 최대 100권까지 선물하실 수 있습니다.<br><br>
								
								*eBook선물하기 주문방법<br>
								- eBook상세페이지 선물하기 버튼클릭<br>
								- PC e서재 / 모바일앱 선물하기<br>
								- eBook 장바구니에서 선물하기<br><br>
								
								*1회 주문시 1권이상 선물 주문방법<br>
								- eBook 장바구니에서 선물할 도서를 선택(단,학술논문 제외)후 선물하기 클릭<br>
								- 선물 받으시는 분 정보입력(휴대폰 또는 이메일)<br>
								- 선물 받으시는 분은 최대 20명까지 입력 후 결제(본인포함, 휴대폰 또는 이메일)<br><br>
								 단, 주문수량이 100권을 초과할 경우 수신 인원이 제한됩니다<br>
								 (예)1회 주문의 경우<br><br>
								  20권을 10명에게 200권 선물주문 불가합니다.<br>
								  20권을 5명에게 100권 선물주문 가능합니다.<br>
								- 마이룸> 선물조회/등록> 수신정보,선물번호 입력 후 선물받기<br>
								 -->
								<!-- eBook선물하기는 문곰책방에서 판매하는 eBook(전자책)을 지인과 친구들에게 선물 하실 수 있는 서비스 입니다.
								eBook선물하기 주문시 입력한 휴대번호로 선물알림 (알림톡)이 발송되며, 선물받은 사람이 선물등록시 컨텐츠를 다운로드 받을 수 있습니다.
								
								장바구니에서 선물주문을 하실 경우 휴대폰, 이메일로 선물번호를 발송하실 수 있습니다.
								※ 대여, 구매 모두 가능하며 연재,시리즈 상품은 장바구니에서 최대 100권까지 선물하실 수 있습니다.
								
								*eBook선물하기 주문방법
								- eBook상세페이지 선물하기 버튼클릭
								- PC e서재 / 모바일앱 선물하기
								- eBook 장바구니에서 선물하기
								
								*1회 주문시 1권이상 선물 주문방법
								- eBook 장바구니에서 선물할 도서를 선택(단,학술논문 제외)후 선물하기 클릭
								- 선물 받으시는 분 정보입력(휴대폰 또는 이메일)
								- 선물 받으시는 분은 최대 20명까지 입력 후 결제(본인포함, 휴대폰 또는 이메일)
								 단, 주문수량이 100권을 초과할 경우 수신 인원이 제한됩니다
								 (예)1회 주문의 경우
								  20권을 10명에게 200권 선물주문 불가합니다.
								  20권을 5명에게 100권 선물주문 가능합니다.
								- 마이룸> 선물조회/등록> 수신정보,선물번호 입력 후 선물받기 -->
							</li>
							</ul>
							</c:forEach> 
							<!-- <li class="sub-menu1">[결제] 문곰페이란 무엇인가요?</li>
							<ul class="sub_content1">
								<li>
								문곰페이는 온라인 문곰책방에서 사용 가능한 결제수단으로 스마일페이 기반의 결제 서비스를 제공합니다.<br>
								스마일페이 가입정보가 있을 경우,문곰페이 이용약관 동의(1회 인증) 후 즉시 서비스 이용 가능 합니다.<br>

								온라인 문곰책방 주문/결제 페이지에서 안전하고 간편한 문곰페이를 이용 해 보세요.<br>
								</li>
							</ul>
							<li class="sub-menu2">[정보/검색/알림기능] 검색이 되지 않거나 품절/절판인 도서는 구입할 수 없나요?</li>
							<ul class="sub_content2">
								<li>
									검색이 되지 않는 도서는 품절/절판일 경우가 대부분이므로<br>
									검색 옵션 중 [품절/절판상품 포함] 란에 체크하신 후 한번 더 검색해보시기 바랍니다.<br><br>

									품절이나 절판으로 표시된 도서는 출판사에서도 더 이상 발행되지 않고 재고가 없는 경우가 대부분이라,<br>
									구하기 어려운 도서입니다. 이 경우 회원님께서 요청하셔도 구입시기를 확실하게 약속드릴 수 없습니다.<br>
									이러한 도서의 	구입가능 여부를 확인하시려면 고객센터의 Q&A <도서/상품정보> 상담을 이용하여 주십시오.<br>
									최대한 확인하여 답변드리겠습니다.<br>
								</li>
							</ul>
							<li class="sub-menu3">[주문] 주문을 수정(취소/변경)할 수 있나요?</li>
							<ul class="sub_content3">
								<li>
									※ 업체배송상품(음반/DVD/gift/어린이전집)은 주문 진행 상태가 [주문접수]일 경우에만 주문 수정 가능합니다.<br>

									- 처리1,2,3단계는 주문을 접수하여 대금 결제를 진행하는 단계로 주문취소가 가능합니다.<br>
									온라인 입금이 완료된 건은 고객님의 환불계좌를 확인하기까지<br> 일시적으로 취소하신 금액을 예치금으로 전환해 드립니다.<br>
									(3단계 상품 준비 중에서는 도서 준비 상태에 따라 주문취소가 불가할 수도 있습니다.<br> 취소를 원하실 경우 고객센터로 연락하셔서 요청 바랍니다.)<br>

									- 처리 4단계는 회원님께서 주문하신 도서가 물류센터에서 물품 출고 작업 중으로 주문취소가 불가합니다.<br>

									- 처리 5단계는 주문 도서를 포장하여 택배사로 물품을 인계되는 단계로 주문취소가 불가합니다.<br>
									차후 도서를 배송받으신 후 마이룸 > 주문/결제 페이지에서 반품 신청 해 주시기 바랍니다.<br>
									(또는 청약철회서를 작성하시어 아래 주소로 반송해 주십시오.)<br>
								</li>
							</ul>
							<li class="sub-menu4">[배송안내] 주문하면 얼마 만에 받아볼 수 있나요?</li>
							<ul class="sub_content4">
								<li>고객님께서 주문하신 상품을 실제 받으시는 날은 "예상출고일+배송일"입니다.<br>

									'예상출고일'이란 근무일 기준으로 도서가 준비되는 시간만을 안내하는 것이며,<br>
									배송시간은 예상출고일 외 택배를 통해 고객님께 실제 배달되는 기간을 말합니다.<br><br>

									출고예정일은 상품에 따라 준비기간이 다르며<br>
									배송 시간은 지역에 따라 약간씩 다르나 보통 1~3일정도 소요됩니다.<br>
									(도서산간지역은 최대 7일 소요)<br><br>

									* 예상출고일은 영업일 기준으로 산정되며, 일요일과 공휴일 및 기타 휴무일에는 배송되지 않습니다.<br>
									(우체국 배송은 토요일 휴무로 배송 불가함)<br><br>
									* 주문한 상품의 당사에 재고가 없을 때는<br> 거래처로 다시 주문 요청한 후 출고되므로 3∼7일내외 정도 더 소요됩니다.<br>
									* 천재지변 등의 불가항력적 사유로 인한 배송 지연은 그 해당기간 동안의 배송소요 기간에서 제외됩니다.<br>
							</li>
							</ul>
							<li class="sub-menu5">[배송안내] 주문상품이 언제 출고 되는지 알 수 있나요?</li>
							<ul class="sub_content5">
								<li>
									각 상품별 재고량을 기준으로 상세 상품정보에 예상출고일이 표시됩니다.<br>

									출고예정일이란, 주문상품의 결제(무통장입금의 경우 입금확인)가<br> 확인된 날 기준으로 상품을 준비하여 상품 포장 후<br> 
									문곰책방 물류센터에서 택배사로 전달하게 되는 예상 일자 입니다<br><br>
									배송일정은 예상출고일에 택배사의 배송일(약 2일)이 더해진 날이며<br> 연휴 및 토.일,공휴일을 제외한 근무일 기준입니다.<br>
									다양한 상품을 함께 주문하실 경우 가장 늦은 출고일정에 맞춰 함께 배송됩니다.<br><br>
									
									*수도권 외 지역 바로배송 서비스의 경우<br> 경품수령 선택 여부에 따라 배송일정이 변경됩니다.<br>
									*출고예정일이 5일 이상인 상품의 경우,<br> 출판사/유통사 사정으로 품/절판 되어 구입이 어려울 수 있습니다.<br> 이 경우 SMS,메일로 알려드립니다.<br><br>

   									고객님께서 급하게 필요하신 상품은 별도로 주문하면 받으시는 시간이 절약 됩니다.<br>
									* 온라인 입금의 경우 입금 확인이 완료된 시점부터 적용되므로<br> 주문일과 관계없이 예상출고일은 결제완료시점을<br>
   									기준으로 다시 계산됩니다.<br><br>
									* 5~7일 이상이 소요되는 상품(해외개인주문도서 포함)의<br> 경우 거래처 사정에 따라 품절 또는 절판<br>
   									될 수 있습니다. 준비가 되지 않는 경우에는<br> 메일(또는 전화)로 별도 연락 드리겠습니다.<br><br>
									* 외국도서(서양도서, 일본도서)의 경우 한정된 수량이 수입되고,<br> 실재고 DB가 Off-Line과 연결되어 있으므로 상품의<br>
   									유통상 주문 수량이 재고 수량보다 많은 경우 품절 될 수 있음을 알려드립니다.<br><br>
									* 외국도서중 국내 출판사를 통해 위탁 판매되고 있는 일부<br> [수입교재]의 경우 출판사 사정에 의해 출고예정일보다<br>
    								다소 지연될 수 있음을 사전에 양해 부탁드립니다.<br>
								</li>
							</ul>
							<li class="sub-menu6">[배송안내] 주문한 상품이 아직 안 왔어요.</li>
							<ul class="sub_content6">
								<li>
									주문하신 도서를 아직 못받아 보셨다면 다음 사항을 확인해 주십시오.<br>

									1. 주문·배송 확인 시 상품의 처리상태가 포장완료로 되어 있는 경우<br>
									이 상품은 당사에서는 출고처리를 한 것입니다.<br>
									당사에서 출고처리가 되었으나 2~3일 이내에 받아보시지 못한 경우는 다음을 확인하시기 바랍니다.<br>

									* 배송조회를 확인하셔서 주문하신 상품이 받아보실 주소의 근처 취급소에 있다고 조회되면, <br>
									택배사 직원이 방문했음에도 불구하고 부재중이셔서 배송받지 못하신 경우가 많습니다.<br>
  									이 경우 고객센터의 Q&A <배송/수령일 안내> 상담이나 전화(국번없이)1544-1900을 이용하시면<br> 신속히 처리해 드립니다.<br>
									* 당일 배송지역의 경우, 배송조회가 되지 않습니다.<br>
  									주문하신 당일 신속한 배송처리가 되기 때문에 배송조회가 무의미하기 때문입니다.<br>

									2. 주문·배송 확인 시 상품의 처리상태가 품절/절판이라고 되어 있는 경우<br>
									상품이 품절/절판인 경우에는 당사에 재고가 없으며,<br> 거래처에서 상품을 더 이상 취급하지 않기 때문에 보내드릴 수 없습니다.<br>
									이 경우 메일로 별도 안내해 드리고 있습니다.<br>
									만약 메일을 받아 보지 못하셨다면, 네트워크의 오류나 메일주소의 오기 또는 메일주소가 없기 때문입니다.<br>
									[마이룸]의 [회원정보 수정]에서 메일주소의 등록 또는 수정을 하십시오.<br>

									3. 상품준비중 상태가 오래 지속될 경우
									주문/배송 조회시 주문상태가<br> ‘상품준비중’ 단계로 남아 있다면 상품의 출고 예정일을 확인해 주시기 바랍니다.<br>

									여러권을 함께 주문하셨을 경우, 출고 예정일이 가장 늦은 상품에 맞춰 함께 배송됩니다.<br>
									(마이룸 > 주문배송 조회 페이지에서 예약판매 도서를 함께 주문하셨는지 확인해주세요!)<br>
								</li>
							</ul>
							<li class="sub-menu7">[배송안내] [반품/교환/환불] 파본/훼손/오배송 된 상품을 교환하고 싶습니다. 어떻게 해야하나요?</li>
							<ul class="sub_content7">
								<li>
									일반 택배로 배송 받으신 상품에 하자가 있는 경우, 인터넷 홈페이지에서 배송 완료일로 부터 30일 이내<br>
									마이룸 > 주문/ 배송내역 > 주문상세페이지 > 교환신청 가능합니다.<br><br>

									※ 도서 자체 인쇄 파본인 경우 문제점 발견 후 30일이내<br>
									※ 단, 우편/ 편의점택배 수령의 경우 회수주소지 정보에 일반 주소지 입력해 주시면<br> 일반택배로 맞교환 진행됩니다.<br><br>
									
									또는, 고객센터 1:1상담에서 <파본/ 상품불량 신고> 또는 <반품/교환/환불> 상담에<br> 주문번호와 내용을 기재하여 주십시오.<br>
									담당자 확인 후 주문시의 주소로 상품을 다시 배송 해 드립니다.<br>
									파본도서는 배송 된 상품을 받으시면서 맞교환해주시면 됩니다.<br><br>

									택배직원 편에 반송을 못하셨을 경우, 고객센터의 Q&A <반품/교환/환불>로 문의 접수해주시면,<br>
									택배기사가 반품회수 재방문을 하도록 조치해드립니다.<br>
									또는 주문번호와 반송사유를 간략하게 메모하여 착불 반품을 보내주셔도 됩니다.<br><br>

									[반송주소]
									일반 택배 반품시 :(우편번호:10881) 경기도 파주시 문발로 249,<br> 문곰책방 A동 2층 인터넷반품담당자 앞<br>
									위 주소는 인터넷문곰책방 구매고객님께서 이용하시는 반품주소입니다.<br>
									※만약의 배송 확인을 위해, 택배 반송 시에는 반송영수증을 최소 2개월간 보관하여 주시기 바랍니다.<br>
								</li>
							</ul>
							<li class="sub-menu8">[배송안내] [반품/교환/환불] 예치금을 환불받고 싶습니다.</li><br>
							<ul class="sub_content8">
								<li>
									예치금은 문곰책방에서의 상품 구매에 사용하실 수 있으며, 고객계좌로 환불 받으실 수 있습니다.<br>
									결제 수단별 환불 반영 기간은 아래와 같습니다.<br><br>
									
									- 주문당일 취소 시 환불 반영 기간은 1~2일(영업일 기준)입니다.<br>
									- 통합포인트 및 제휴 포인트 환불 반영 기간은 1~2일 (영업일 기준) 입니다.<br>
									- 기타 결제수단 (제휴사 포인트 등)인 경우 해당 결제수단에 대한 승인취소로 처리되며, 부득이한 경우<br>
									(부분 배송)으로 차액이 발생한 경우 환불해 드리며,<br> 경우에 따라서는 재결제를 해주셔야 하는 경우가 발생할 수 있습니다.<br>
									- 마이룸 > 나의통장 > 예치금에서 환불신청 및 환불내역을 확인하실 수 있습니다.<br>
									※ 체크카드는 입금까지 은행 정책에 따라 주말 제외 7~10일 소요됩니다.<br>
									※ 신용카드 환불은 카드사 정책에 따라 취소 반영 기간의 차이가 있으니<br> 자세한 사항은 해당 카드사로
									문의해 주시기 바랍니다.<br><br>
									
									▣ 2011년 6월 1일 부터 환불관리 규정이 강화되었습니다.<br><br>
									①신용카드
									※ 불분명한 사유로 인한 잦은 주문취소/반품 등으로 환불신청을 자주 반복하시는 경우<br>
									- 내역확인을 위해 시일이 소요되어 처리가 늦어질 수 있으니 고객님의 너그러운 양해를 부탁드립니다.<br><br>
									
									②휴대폰 (소액결제) /집전화결제<br>
									※ 월말에 주문결제 하신 후 익월에 환불신청을 자주 반복하시는 경우<br>
									※ 불분명한 사유로 인한 잦은 주문취소/반품 등으로<br> 환불신청(월 3회 이상 또는 5만원 이상)을 자주 반복하시는 경우><br>
									-계좌환불 제한, 결제수단 이용 제한, 월별 사용한도 축소 될 수 있으니 신중히 결정해 주시기 바랍니다.<br><br>
									
									③ 복합결제
									※ 제휴사 포인트 등 복합결제 금권은 본 결제수단에 대해 승인취소 처리되며,<br>
									당사사유로 인한 주문취소/반품 등이 발생한 경우 내역 확인 후 환불해 드립니다.<br><br>
								</li>
							</ul> -->
							
						
						
						</ul>
						
						
						</div>
						
						
						<div id="pagebar-container">
			        		${pageBar }
			        	</div> 
			        </div>
		</div>
	</div>
</div>

<!-- 다음에는 슬라이드 토글줄때 for문 말고 next.val로 가져오자.. -->

<script>
/* window.onload = function () {
	for(let i=0; i<${list.size()}; i++) {
		$('.sub_faqcontent' + i).css("display","none");
	} 
	for(let j=0; j<${list.size()}; j++){
		$('.sub-faqmenu' + j).css("display","flex");
		$('.sub-faqmenu' + j).css("border","1px solid black");
		$('.sub-faqmenu' + j).css("width","710px");
		$('.sub-faqmenu' + j).css("height","40px");
		$('.sub-faqmenu' + j).css("justify-content","center");
		$('.sub-faqmenu' + j).css("align-items","center");
		$('.sub-faqmenu' + j).css("font-weight","bold");
		$('.sub-faqmenu' + j).css("color","#582810");
	}  
} */

for(let i=0; i<${list.size()}; i++) {
	$('.sub-faqmenu' + i).click(function() {
		
		$('.sub_faqcontent' + i).slideToggle('slow');
		$('.sub_faqcontent' + i).css("display","block");
		
	});
}


function inputFaq(){
	let type31=document.getElementsByName("type31")[0].value;
	let askFaq=document.getElementsByName("askFaq")[0].value;
	
	location.assign("${path}/service/inputAskFaq.do?type31="+type31+"&askFaq="+askFaq);
}

function searchFaqList(){
	let type30=document.getElementsByName("type30")[0].value;
	let searchFaq=document.getElementsByName("searchFaq")[0].value;
	
	$.ajax({
		url: "${path}/service/searchFaq.do",
		data: {
			type30:type30,
			searchFaq:searchFaq
			
		},
		success: data => {
			console.log(data);
			document.querySelectorAll(".faqsideMenu li").forEach((v,i) => {
				v.remove();
			});
			document.querySelectorAll(".faqsideMenu li ul").forEach((v,i) => {
				v.remove();
			});
			document.querySelectorAll(".faqsideMenu li ul li").forEach((v,i) => {
				v.remove();
			});
			
			let checkOx;
			let checkOx2;
			let totalUl=document.querySelector(".faqsideMenu");
			for(let i=0;i<data.length;i++){
				let li=document.createElement("li");
				li.classList.add('sub-faqmenu'+i);
				li.classList.add('faqclassName');
				
				if(data[i].faqStatus==1){
					checkOx="<span class='faqOx2'>" +'(답변완료)'+"</span>";
				}else if(data[i].faqStatus==0){
					checkOx="<span class='faqOx1'>" + '(접수대기)'+"</span>";
				}
				li.innerHTML ="[" + data[i].faqcgNum.faqcgName + "] " + data[i].faqAsked+checkOx;
				
				let faqsplit;
				
				faqsplit=data[i].faqAnswer.split(/.-/).join('<br>');
				
				console.log(faqsplit);
				//for(let j=0;j<data.length;j++){
					let innerUl=document.createElement("ul");
					innerUl.classList.add('sub_faqcontent'+i);
					innerUl.classList.add('faqclassName2');
					if(data[i].faqAnswer!=null){
						innerUl.innerHTML = "<li class='last_li'>"+faqsplit+"</li>";
						//console.log("test");
						//console.log(data[i].faqAnswer.split("."));
						//console.log(splitMulti(data[i].faqAnswer,[".","-"]));
						//console.log(data[i].faqAnswer.split(".-"));
						
					}
					
					//totalUl.appendChild(innerUl);
				//}
				totalUl.appendChild(li);
				totalUl.appendChild(innerUl);
				
			}
			for(let i=0; i<${list.size()}; i++) {
				$('.sub-faqmenu' + i).click(function() {
					
					$('.sub_faqcontent' + i).slideToggle('slow');
					$('.sub_faqcontent' + i).css("display","block");
					
				});
			}
			
			
			
		}
	});
		
} 


/* $('.sub-menu1').click(function() {
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
$('.sub-menu7').click(function() {
	$('.sub_content7').slideToggle('slow');

});
$('.sub-menu8').click(function() {
	$('.sub_content8').slideToggle('slow');

}); */
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>