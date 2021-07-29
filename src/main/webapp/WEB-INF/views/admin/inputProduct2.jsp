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
								<input class="chooseBookAdd" type="radio" name="chooseBookAdd" id="book" value="book" checked><label for="book" class="chooseBookAdd3">책등록</label>
								<input class="chooseBookAdd6" type="radio" name="chooseBookAdd" id="gift" value="gift"><label for="gift" class="chooseBookAdd5">gift</label>
							</td>
							<td><input type="button" value="선택하기" onclick="orderList();"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="addProduct-container3">
				<form action="${path}/admin/insertProduct1.do" method="post">
					<table class="ChooseTable1">
						<!--자동 넘버처리 -->
						<tr>
							<th>도서 번호</th>
							<td>
								<input type="number" min="1" name="bookNo">
							</td>
						</tr> 
						<tr>
							<th>안전 재고</th>
							<td>
								<input type="number" min="1" name="stock">
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
				<form action="${path}/admin/insertProduct3.do" method="post">
					<table class="ChooseTable3">
						<tr>
							<th>상품 번호</th>
							<td>
								<input type="number" min="1">
							</td>
						</tr>
						<tr>
							<th>안전 재고</th>
							<td>
								<input type="number" min="1" name="stock">
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
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>