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
				<p>쿠폰 등록</p>
			</div>
			
			<div class="addProduct-container3">
				<form action="${path}/admin/addCouponList.do" method="post">
					<table class="ChooseTable1">
						<!--자동 넘버처리 -->
						
						<tr>
							<th>쿠폰이름</th>
							<td>
								<input type="text" min="1" name="couponlistName">
							</td>
						</tr>
						<tr>
							<th>회원 등급번호</th>
							<td>
								<input type="text" min="1" name="couponlistMembergradeNo">
							</td>
						</tr>  
						<tr>
							<th>할인금액</th>
							<td>
								<input type="number" min="1000" name="couponlistAmount">
							</td>
						</tr> 
						<tr>
							<th>발급가능여부</th>
							<td>
								<input class="chooseBookAdd" type="radio" name="couponlistForuse" id="Y" value="Y" checked><label for="Y" class="chooseBookAdd3">Y</label>
								<input class="chooseBookAdd2" type="radio" name="couponlistForuse" id="N" value="N"><label for="N" class="chooseBookAdd4">N</label>
							</td>
						</tr> 
						<tr>
							<th>사용가능일수</th>
							<td>
								<input type="number" min="1" name="couponlistInvalid">
							</td>
						</tr>
						<!-- <tr>
							<th>등급 번호</th>
							<td>
								<input type="number" min="1" name="couponlistInvalid">
							</td>
						</tr> -->
						
						<tr>
							<td colspan="2">
								<input type="submit" value="등록">
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