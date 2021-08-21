<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/addProduct3.css">

<div class="addProduct-container">
	<div class="addProduct-box1">
		<div class="addProduct-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="addProduct-box2">
			<div class="addProduct-box4">
				<p>제품 등록</p>
			</div>
			<!-- <div class="addProduct-container2">
				<form action="" method="post">
					<table class="ChooseTable1">
						<tr>
							<th>타입</th>
							<td>
								<input class="chooseBookAdd" type="radio" name="chooseBookAdd" id="book" value="book" checked><label for="book" class="chooseBookAdd3">책등록</label>
								<input class="chooseBookAdd6" type="radio" name="chooseBookAdd" id="gift" value="gift"><label for="gift" class="chooseBookAdd5">gift</label>
							</td>
						</tr>
					</table>
				</form>
			</div> -->
			
			
			<div class="addProduct-container5" style="display:block;">
				<form action="${path}/admin/insertProduct3.do" method="post">
					<table class="ChooseTable3">
						<!-- <tr>
							<th>상품 번호</th>
							<td>
								<input type="number" min="1">
							</td>
						</tr> -->
						<tr>
							<th>상품명</th>
							<td>
								<input type="text" name="gift_title">
							</td>
						</tr>
						<tr>
							<th>상품 이미지</th>
							<td>
								<input type="text" name="gift_img" class="adCheckImg2">
							</td>
						</tr>
						
						<tr>
							<th>가격</th>
							<td>
								<input type="number" min="1000" max="9900000" class="bookPriceAd3" name="gift_price">
							</td>
						</tr>
						<tr>
							<th>브렌드</th>
							<td>
								<input type="text" name="gift_brand">
							</td>
						</tr>
						<tr>
							<th>제조사</th>
							<td>
								<input type="text" name="gift_maker">
							</td>
						</tr>
						<tr>
							<th>카테고리 코드</th>
							<td>
								<input type="number" min="1" value="${categoryCode }" name="gift_category" readonly>
							</td>
						</tr>
						<tr>
							<th>제품 타입</th>
							<td>
								<input class="chooseBookAdd" type="radio" name="gift_productType" id="1" value="1" checked><label for="1" class="chooseBookAdd3">1</label>
								<input class="chooseBookAdd2" type="radio" name="gift_productType" id="2" value="2"><label for="2" class="chooseBookAdd4">2</label>
							</td>
						</tr>
						<tr>
							<th>할인 여부</th>
							<td>
								<input class="chooseBookAdd" type="radio" name="gift_discount" id="Y" value="Y" checked><label for="Y" class="chooseBookAdd3">Y</label>
								<input class="chooseBookAdd2" type="radio" name="gift_discount" id="N" value="N"><label for="N" class="chooseBookAdd4">N</label>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<input type="submit" value="등록" onclick="return checkImgLong2(event);" class="adminBtn">
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
					
					$(".addProduct-container5").css("display","none");
					$(".addProduct-container3").css("display","block");
				}else if(v.value=="gift"){
					$(".addProduct-container3").css("display","none");
					$(".addProduct-container5").css("display","block");
				}
			}
		})
	})
	$(".bookPriceAd1").keyup(e =>{ // BOOK 할인가
		const bookPriceAd=$(e.target).val();
		$("#discountPriceAd1").val(bookPriceAd*0.9);
	});
	$(".bookPriceAd1").change(e =>{ // BOOK 할인가
		const bookPriceAd=$(e.target).val();
		$("#discountPriceAd1").val(bookPriceAd*0.9);
	});
	$(".bookPriceAd3").keyup(e =>{ // GIFT 할인가
		const bookPriceAd3=$(e.target).val();
		$("#discountPriceAd3").val(bookPriceAd3*0.9);
	});
	$(".bookPriceAd3").change(e =>{ // GIFT 할인가
		const bookPriceAd3=$(e.target).val();
		$("#discountPriceAd3").val(bookPriceAd3*0.9);
	});
	function checkImgLong2(event){ 
		//gift 이미지가 db 저장보다 길때 return false 
		
		let checkImg= document.getElementsByClassName("adCheckImg2")[0].value;
		
		if(checkImg.length>99){
			alert("해당하는 도서 이미지 파일이 큽니다 \n 이미지를 대체하세요");
			return false;
		}else{
			return true;
		}
		
	}
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>