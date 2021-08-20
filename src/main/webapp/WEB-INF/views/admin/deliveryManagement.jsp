<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/deliveryManagement.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<div class="admin-container">
	<div class="admin-box1">
		<div class="admin-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="admin-box2">
			<div class="admin-box4">
					<div class="admin-search3">
				<form class="admin-search" action="${path }/admin/insertDelivery.do" id="DeliveryForm" method="post">
						<table class="adminHowTable">
							<tr>
								<th>배송 추가</th>
								<td class="admin-search2">
									
								</td>
								<td class="search-box">
									<input type="text" name="deliveryType1" placeholder="가격을 입력하세요"> 
								</td>
								<!-- <td class="search-box">
									<input type="text" name="deliveryType2" placeholder="배송상태를 입력하세요"> 
								</td> -->
								<td class="search-box">
									<input type="submit" value="추가" class="adminBtn"/>
									<!-- <button onclick="addAuctionCate(event)">추가</button>  -->
								</td>
							</tr>
							<tr>
								<th>배송 갱신</th>
								<td class="admin-search2">
									<input type="number" min="1" value="" placeholder="배송번호" name="deliveryType3"/>
								</td>
								<td class="search-box">
									<input type="text" name="deliveryType4" placeholder="가격을 입력하세요"> 
								</td>
								<!-- <td class="search-box">
									<input type="text" name="deliveryType5" placeholder="배송상태를 입력하세요"> 
								</td> -->
								<td class="search-box">
									<input type="button" value="갱신" onclick="updateDeliveryAdmin('updateDelivery.do')" class="adminBtn"/>
									<!-- <button onclick="addAuctionCate(event)">추가</button>  -->
								</td>
							</tr>
							
							<tr>
								<th>배송 삭제</th>
								<td class="admin-search2">
									<input type="number" min="1" value="" placeholder="배송번호" name="deliveryType6"/>
								</td>
								<td class="search-box">
									
								</td>
								
								<td class="search-box">
									<input type="button" value="삭제" onclick="deleteDeliveryAdmin('deleteDelivery.do');" class="adminBtn"/>
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="memberT-container">
			<div>
				<table class="memberT">
							
							<tr>
								<th>배송번호</th>
								<th>배송비</th>
								<!-- <th>배송상태</th> -->
								
							</tr>
							
							
							<c:forEach var="e" items="${list }">
							<tr>
									<td><input type="text" value="${e.deliveryNo }" name="deliveryNo" readonly></td>
									<td><input type="text" value="${e.deliveryPrice }" name="deliveryPrice" readonly></td>
									<%-- <td><input type="text" value="${e.deliveryStatus }" name="deliveryStatus" readonly></td> --%>
									
								
							</tr>
							</c:forEach>
							

						</table>
						</div>
						<!-- </form> -->
						
						<div id="pagebar-container5">
			        		${pageBar }
			        	</div> 
			</div>
			
					
				
		</div>
	</div>
</div>


<script>

function addAuctionCate(event){
	
}
function deleteAuctionCate(url){
	$("#addDeleteAuction").attr("action","${path}/admin/"+url);
	$("#addDeleteAuction").submit(); 
	/* location.assign("${path}/admin/deleteAuctionCate.do"); */
}
function updateDeliveryAdmin(url){
	$("#DeliveryForm").attr("action","${path}/admin/"+url);
	$("#DeliveryForm").submit();
}
function deleteDeliveryAdmin(url){
	$("#DeliveryForm").attr("action","${path}/admin/"+url);
	$("#DeliveryForm").submit();
}
	
	





</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>