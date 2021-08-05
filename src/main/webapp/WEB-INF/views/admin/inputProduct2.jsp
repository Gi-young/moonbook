<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/inputProduct2.css">

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
								<input class="chooseBookAdd" type="radio" name="chooseBookAdd" id="book" value="book" checked><label for="book" class="chooseBookAdd3">book</label>
								<input class="chooseBookAdd6" type="radio" name="chooseBookAdd" id="gift" value="gift"><label for="gift" class="chooseBookAdd5">gift</label>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="addProduct-container3">
				<form action="${path}/admin/updateProduct1.do" method="post">
					<table class="ChooseTable1">
						<!--자동 넘버처리 -->
						<tr>
							<th>도서 번호</th>
							<td>
								<input type="number" min="1" name="bindNo">
							</td>
						</tr> 
						<tr>
							<th>입고 개수</th>
							<td>
								<input type="number" min="1" name="stock">
							</td>
						</tr> 
						<tr>
							<th>입고가</th>
							<td>
								<input type="number" min="0" name="primeCost">
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
				<form action="${path}/admin/updateProduct3.do" method="post">
					<table class="ChooseTable3">
						<tr>
							<th>상품 번호</th>
							<td>
								<input type="number" min="1" name="gift_no">
							</td>
						</tr>
						<tr>
							<th>입고 개수</th>
							<td>
								<input type="number" min="1" name="gift_count">
							</td>
						</tr> 
						<tr>
							<th>입고가</th>
							<td>
								<input type="number" min="0" name="gift_rowPrice">
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
	
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>