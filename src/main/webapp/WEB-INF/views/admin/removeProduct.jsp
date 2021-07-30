<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
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
				<p>제품 출고</p>
			</div>
			<div class="addProduct-container2">
				<form action="" method="post">
					<table class="ChooseTable1">
						<tr>
							<th>타입</th>
							<td>
								<input class="chooseBookAdd" type="radio" name="chooseBookAdd" id="book" value="book" checked><label for="book" class="chooseBookAdd3">book</label>
								<input class="chooseBookAdd2" type="radio" name="chooseBookAdd" id="ebook" value="ebook" checked><label for="ebook" class="chooseBookAdd4">eBook</label>
								<input class="chooseBookAdd6" type="radio" name="chooseBookAdd" id="gift" value="gift"><label for="gift" class="chooseBookAdd5">gift</label>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="addProduct-container3">
				<form action="${path}/admin/outputProduct1.do" method="post">
					<table class="ChooseTable1">
						<tr style="display:none">
							<th>도서 가격</th>
							<td>
								<input type="hidden" min="1" name="price" id="bringPrice1" readonly>
							</td>
						</tr>
						<tr>
							<th>도서 번호</th>
							<td>
								<input type="number" min="1" name="bindNo" class="bringNum1">
							</td>
						</tr> 
						<tr>
							<th>출고 개수</th>
							<td>
								<input type="number" min="1" name="stock" class="bringInputStock1">
							</td>
						</tr> 
						
						<tr>
							<td colspan="2">
								<input type="submit" onclick="checkStock();" value="출고">
							</td>
						</tr>
					</table>
				</form>	
 
			</div>
			<div class="addProduct-container4" style="display:none">
				<form action="${path}/admin/outputProduct2.do" method="post">
					<table class="ChooseTable2">
						<tr style="display:none">
							<th>도서 가격</th>
							<td>
								<input type="hidden" min="1" name="price" id="bringPrice1" readonly>
							</td>
						</tr>
						<tr>
							<th>도서 번호</th>
							<td>
								<input type="number" min="1" name="bindNo" class="bringNum1">
							</td>
						</tr> 
						<tr>
							<th>출고 개수</th>
							<td>
								<input type="number" min="1" name="stock">
							</td>
						</tr> 
						
						<tr>
							<td colspan="2">
								<input type="submit" value="출고">
							</td>
						</tr>
					</table>
				</form>	
 
			</div>
			<div class="addProduct-container5" style="display:none;">
				<form action="${path}/admin/outputProduct3.do" method="post">
					<table class="ChooseTable3">
						<tr style="display:none">
							<th>상품 가격</th>
							<td>
								<input type="hidden" min="1" name="price" id="bringPrice2" readonly>
							</td>
						</tr>
						<tr>
							<th>상품 번호</th>
							<td>
								<input type="number" min="1" class="bringNum2">
							</td>
						</tr>
						<tr>
							<th>출고 개수</th>
							<td>
								<input type="number" min="1" name="stock" class="bringInputStock3">
							</td>
						</tr> 
						
						<tr>
							<td colspan="2">
								<input type="submit" value="출고">
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
					$(".addProduct-container4").css("display","none");
					$(".addProduct-container3").css("display","block");
				}else if(v.value=="ebook"){
					$(".addProduct-container5").css("display","none");
					$(".addProduct-container4").css("display","block");
					$(".addProduct-container3").css("display","none");
				}else if(v.value=="gift"){
					$(".addProduct-container3").css("display","none");
					$(".addProduct-container4").css("display","none");
					$(".addProduct-container5").css("display","block");
				}
			}
		})
	})
	$(".bringNum1").keyup(e =>{ // 가격가져오기 book
		let bringNum=$(e.target).val();
		let bringPrice=$("#bringPrice1").val();
		$.ajax({
			url: "${path}/admin/bringPrice.do",
			type: "GET",
			data: {
				bindNo: bringNum
			},
			success: data => {
				//console.log(data);
				$("#bringPrice1").val(data.price);
			}
		});
	});
	$(".bringNum1").change(e =>{ // 가격가져오기 book
		let bringNum2=$(e.target).val();
		let bringPrice2=$("#bringPrice1").val();
		$.ajax({
			url: "${path}/admin/bringPrice.do",
			type: "GET",
			data: {
				bindNo: bringNum2
			},
			success: data => {
				$("#bringPrice1").val(data.price);
			}
		});
	});
	$(".bringNum2").keyup(e =>{ // 가격가져오기 gift
		let bringNum3=$(e.target).val();
		let bringPrice3=$("#bringPrice1").val();
		$.ajax({
			url: "${path}/admin/bringPrice2.do",
			type: "GET",
			data: {
				bindNo: bringNum3
			},
			success: data => {
				$("#bringPrice2").val(data.price);
			}
		});
	});
	$(".bringNum2").change(e =>{ // 가격가져오기 gift
		let bringNum4=$(e.target).val();
		let bringPrice4=$("#bringPrice1").val();
		$.ajax({
			url: "${path}/admin/bringPrice2.do",
			type: "GET",
			data: {
				bindNo: bringNum4
			},
			success: data => {
				$("#bringPrice2").val(data.price);
			}
		});
	});
	const checkStock=()=>{ //BOOK에서 재고가 있는지 확인, 재고가 출고할 양보다 작으면 return =false
		let stock=$(".bringInputStock1").val(); //output할 stock 값임
		let bringNum=$(".bringNum1").val();
		$.ajax({
			url: "${path}/admin/checkStock1.do",
			type: "GET",
			data: {
				bindNo: bringNum
				stock: stock
			},
			success: data => {
				if(data.result=="true"){
					return true;
				}else if(data.result="false"){
					alert("해당하는 출고 개수보다 재고가 부족합니다")
					return false;
				}
			}
		});
	}
	
	
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>