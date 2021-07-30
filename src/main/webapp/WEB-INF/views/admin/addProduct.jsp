<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/addProduct.css">

<div class="addProduct-container">
	<div class="addProduct-box1">
		<div class="addProduct-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="addProduct-box2">
			<div class="addProduct-box4">
					<p>도서 등록</p>
			</div>
			<div class="addProduct-container3">
				
				<table class="ChooseTable1">
						<tr>
							<th>제품 별 카테고리</th>
							<th>등록하기</th>
						</tr>
						<tr>
							<td colspan="2" class="product-category">고전/문학</td>
						</tr>
						<tr>
							<th>한국고전소설</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=308')" value="등록">
							</td>
						</tr>
						<tr>
							<th>세계문학</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=1167')" value="등록">
							</td>
						</tr>
						<tr>
							<th>세계고전</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=1142')" value="등록">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="product-category">청소년</td>
						</tr>
						<tr>
							<th>청소년 문학</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=1073')" value="등록">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="product-category">0~3세</td>
						</tr>
						<tr>
							<th>한국그림책</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=319')" value="등록">
							</td>
						</tr>
						<tr>
							<th>외국그림책</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=422')" value="등록">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="product-category">4~7세</td>
						</tr>
						<tr>
							<th>한국그림책</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=1016')" value="등록">
							</td>
						</tr>
						<tr>
							<th>외국그림책</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=1220')" value="등록">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="product-category">유아그림책</td>
						</tr>
						<tr>
							<th>세계 명작 동화</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=761')" value="등록">
							</td>
						</tr>
						<tr>
							<th>한국 전래 동화</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=264')" value="등록">
							</td>
						</tr>
						<tr>
							<th>국내 창작 동화</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=493')" value="등록">
							</td>
						</tr>
						<tr>
							<th>다른나라 그림책</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=397')" value="등록">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="product-category">초등1~2학년</td>
						</tr>
						<tr>
							<th>어린이동화</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=1113')" value="등록">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="product-category">초등3~4학년</td>
						</tr>
						<tr>
							<th>어린이동화</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=1163')" value="등록">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="product-category">초등5~6학년</td>
						</tr>
						<tr>
							<th>어린이동화</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=746')" value="등록">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="product-category">어린이(공통)</td>
						</tr>
						<tr>
							<th>어린이동화</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=829')" value="등록">
							</td>
						</tr>
						
					</table>
					
 				<div class="addProduct-box8">
					<p>기프트 등록</p>
				</div>
				<table class="ChooseTable1">
						<tr>
							<th>전자기기</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=909091')" value="등록">
							</td>
						</tr>
						<tr>
							<th>수납/정리</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=909092')" value="등록">
							</td>
						</tr>
						<tr>
							<th>독서 필수템</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=909093')" value="등록">
							</td>
						</tr><tr>
							<th>잡화</th>
							<td class="Ch-td">
								<input type="button" onclick="location.assign('${path}/admin/addProductPage2.do?categoryCode=909094')" value="등록">
							</td>
						</tr>
						
					</table>
			</div>
			
 
			
			
		</div>
	</div>
</div>


<script>
	
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>