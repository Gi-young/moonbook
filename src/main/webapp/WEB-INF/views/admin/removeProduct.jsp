<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/removeProduct.css">

<div class="addProduct-container">
	<div class="addProduct-box1">
		<div class="addProduct-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="addProduct-box2">
			<div class="addProduct-box4">
				<p>도서 출고</p>
			</div>
			<table class="ChooseTable1">
				<tr>
					<th>타입</th>
					<td>
						<input class="chooseBookAdd" type="radio" name="chooseBookAdd" id="book" value="" checked><label for="book" class="chooseBookAdd3">종이책</label>
						<input class="chooseBookAdd2" type="radio" name="chooseBookAdd" id="ebook" value=""><label for="ebook" class="chooseBookAdd4">eBook</label>
					</td>
					<td><input type="button" value="선택하기" onclick="orderList();"></td>
				</tr>
			</table>
			
			
		</div>
	</div>
</div>


<style>
</style>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>