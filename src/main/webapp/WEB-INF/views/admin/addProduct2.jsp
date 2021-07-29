<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/addProduct2.css">

<div class="addProduct-container">
	<div class="addProduct-box1">
		<div class="addProduct-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="addProduct-box2">
			<div class="addProduct-box4">
				<p>제품 입고</p>
			</div>
			<div class="addProduct-container2">
				<form action="" method="post">
					<table class="ChooseTable1">
						<tr>
							<th>타입</th>
							<td>
								<input class="chooseBookAdd" type="radio" name="chooseBookAdd" id="book" value="book" checked><label for="book" class="chooseBookAdd3">종이책</label>
								<input class="chooseBookAdd2" type="radio" name="chooseBookAdd" id="ebook" value="ebook"><label for="ebook" class="chooseBookAdd4">eBook</label>
								<input class="chooseBookAdd6" type="radio" name="chooseBookAdd" id="gift" value="gift"><label for="gift" class="chooseBookAdd5">gift</label>
							</td>
							<td><input type="button" value="선택하기" onclick="orderList();"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="addProduct-container3">
				<form action="" method="post">
					<table class="ChooseTable1">
						<tr>
							<th>도서 번호</th>
							<td>
								<input type="number" min="1">
							</td>
						</tr>
						<tr>
							<th>도서 이미지</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>책 제목</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>책 부제</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>책 소개</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td>
								<input type="number" min="10000" max="99000" class="bookPriceAd1">
							</td>
						</tr>
						<tr>
							<th>저자</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>출판사</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>출간일</th>
							<td>
								<input type="Date">
							</td>
						</tr>
						<tr>
							<th>옮긴이</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>ISBN</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>쪽수</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>크기</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>수량</th>
							<td>
								<input type="number" min="1">
							</td>
						</tr>
						<tr>
							<th>판매여부</th>
							<td>
								<input class="chooseBookAdd" type="radio" name="BOOK_FORSALE" id="Y" value="Y" checked><label for="Y" class="chooseBookAdd3">Y</label>
								<input class="chooseBookAdd2" type="radio" name="BOOK_FORSALE" id="N" value="N"><label for="N" class="chooseBookAdd4">N</label>
							</td>
						</tr>
						<tr>
							<th>입고가</th>
							<td>
								<input type="number" min="10000">
							</td>
						</tr>
						<tr>
							<th>안전재고</th>
							<td>
								<input type="number" min="5">
							</td>
						</tr>
						<tr>
							<th>할인가</th>
							<td>
								<input type="number" min="1" value="" id="discountPriceAd1" readonly>
							</td>
						</tr>
						<tr>
							<th>카테고리 코드</th>
							<td>
								<input type="number" min="1" value="${categoryCode }" readonly>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="입고">
							</td>
						</tr>
					</table>
				</form>	
 
			</div>
			<div class="addProduct-container4" style="display:none;">
				<form action="" method="post">
					<table class="ChooseTable2">
						<tr>
							<th>도서 번호</th>
							<td>
								<input type="number" min="1">
							</td>
						</tr>
						<tr>
							<th>책 제목</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>저자</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>도서 이미지</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td>
								<input type="number" min="10000" max="99000">
							</td>
						</tr>
						<tr>
							<th>ISBN</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>출판일</th>
							<td>
								<input type="Date">
							</td>
						</tr>
						<tr>
							<th>출판사</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>설명</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>링크</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>카테고리 코드</th>
							<td>
								<input type="number" min="1" value="${categoryCode }" readonly>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<input type="submit" value="입고">
							</td>
						</tr>
					</table>
				</form>	
 
			</div>
			<div class="addProduct-container5" style="display:none;">
				<form action="" method="post">
					<table class="ChooseTable3">
						<tr>
							<th>상품 번호</th>
							<td>
								<input type="number" min="1">
							</td>
						</tr>
						<tr>
							<th>상품 이미지</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>상품 소개</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td>
								<input type="number" min="10000" max="99000">
							</td>
						</tr>
						<tr>
							<th>제조사</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>제조국</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>A/S및 소비자 상담</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>치수</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>수량</th>
							<td>
								<input type="number" min="1">
							</td>
						</tr>
						<tr>
							<th>판매 여부</th>
							<td>
								<input type="number" min="1" value="${categoryCode }" readonly>
							</td>
						</tr>
						<tr>
							<th>입고가</th>
							<td>
								<input type="number" min="1" value="${categoryCode }" readonly>
							</td>
						</tr>
						<tr>
							<th>안전재고</th>
							<td>
								<input type="number" min="1" value="${categoryCode }" readonly>
							</td>
						</tr>
						<tr>
							<th>할인가</th>
							<td>
								<input type="number" min="1" value="${categoryCode }" readonly>
							</td>
						</tr>
						<tr>
							<th>카테고리 코드</th>
							<td>
								<input type="number" min="1" value="${categoryCode }" readonly>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="입고">
							</td>
						</tr>
					</table>
				</form>	
 
			</div>
			
		</div>
	</div>
</div>


<script>
	$("input[name=chooseBookAdd]").click(e=>{
		$("input[name=chooseBookAdd]").each((i,v)=>{
			if(v.checked){
				if(v.value=="book"){
					$(".addProduct-container4").css("display","none");
					$(".addProduct-container5").css("display","none");
					$(".addProduct-container3").css("display","block");
				}else if(v.value=="ebook"){
					$(".addProduct-container3").css("display","none");
					$(".addProduct-container5").css("display","none");
					$(".addProduct-container4").css("display","block");
				}else if(v.value=="gift"){
					$(".addProduct-container3").css("display","none");
					$(".addProduct-container4").css("display","none");
					$(".addProduct-container5").css("display","block");
				}
			}
		})
	})
	$(".bookPriceAd1").keyup(e =>{ //할인가
		const bookPriceAd=$(e.target).val();
		$("#discountPriceAd1").val(bookPriceAd*0.9);
	});
	$(".bookPriceAd1").change(e =>{ //할인가
		const bookPriceAd=$(e.target).val();
		$("#discountPriceAd1").val(bookPriceAd*0.9);
	});
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>