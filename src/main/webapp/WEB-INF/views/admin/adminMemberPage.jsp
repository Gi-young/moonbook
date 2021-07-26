<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/adminMemberPage.css">


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
				<form class="admin-search">
						<table class="adminHowTable">
							<tr>
								<th>정렬방법</th>
								<td>
								<select name="type1">
									<option value="totalMoney" selected>총 매출</option>
									<option value="memberPoint" >회원포인트</option>
									<option value="memberVisit" >방문횟수</option>
								</select>
								</td>
								<td>
									<input class="howASCSearch" type="radio" name="searchHow2" id="asc" value="asc" checked><label for="asc">오름차순</label>
									<input class="howDESCSearch2" type="radio" name="searchHow2" id="desc" value="desc"><label for="desc">내림차순</label>
								</td>
								<td><input type="submit" value="조회하기"></td>
							</tr>
							<tr>
								<th>검색하기</th>
								<td class="admin-search2">
								<select name="type2">
									<option value="memberId" selected>Id</option>
									<option value="memberName" >Name</option>
								</select>
								</td>
								<td class="search-box">
									<input type="text"> 
								</td>
								<td class="search-box">
									<img alt="검색하기"
									src="${path }/resources/img/admin/search.png">
								</td>
							</tr>
						</table>
					
	
				</form>
					</div>
			</div>
			<div class="memberT-container">
						<p class="memberTFont">총 <span class="turnRed">${totalContents }</span>명의 회원이 있습니다.</p>
						<p class="memberTFont2">※ 전화번호, 주소, 회원 포인트, 회원 등급만 수정 가능합니다.</p>
						<%-- <form action="${path }/admin/memberUpdate.do" name="admemberT" id="admemberT" method="post"> --%>
						<table class="memberT">
							
							<tr>
								<th>등록일</th>
								<th>회원 아이디</th>
								<th>회원 이름</th>
								<th>회원 전화번호</th>
								<th>회원 성별</th>
								<th>회원 주소</th>
								<th>회원 포인트</th>
								<th>회원 등급</th>
								<th>총 매출</th>
								<th>방문 횟수</th>
								<th>수정하기</th>
								<th>삭제하기</th>
							</tr>
							
							
							<c:forEach var="e" items="${list }">
							<tr>
									<td><input type="text" value="${e.memberRegiDate }" name="memberRegiDate" readonly></td>
									<td><input type="text" value="${e.memberId }" name="memberId" readonly></td>
									<td><input type="text" value="${e.memberName }" name="memberName" readonly></td>
									<td><input type="text" value="${e.memberPhone }" name="memberPhone"></td>
									<td><input type="text" value="${e.memberGender }" name="memberGender" readonly></td>
									<td><input type="text" value="${e.memberAddress }" name="memberAddress"></td>
									<td><input type="text" value="${e.memberPoint }" name="memberPoint"></td>
									<td><input type="text" value="${e.memberGradeNo }" name="memberGradeNo"></td>
									<td><input type="text" value="${e.memberTotalSale }" name="memberTotalSale" readonly></td>
									<td><input type="text" value="${e.memberVisit }" name="memberVisit" readonly></td>
									<td>
										<img alt="수정하기" src="${path }/resources/img/admin/checkgreen.png" onclick="changeMemberV(event);" class="updateCheck">
									</td>
									
									<td>
										<form action="${path }/admin/memberDelete.do" method="post" class="adMemberT">
											<input type="hidden" value="${e.memberId }" name="memberId" readonly>
											<%-- <img alt="삭제하기" src="${path }/resources/img/admin/delete2.png" class="updateCheck" onclick="adminMemberDelete();"> --%> 
											<!-- <input type="submit" value="삭제"> -->
											<button type="submit"><img src="${path }/resources/img/admin/delete2.png" alt="" class="updateCheck"></button>
											
										</form>
										</td>
								
							</tr>
							</c:forEach>
							

						</table>
						<!-- </form> -->
						
						<div id="pagebar-container">
			        		${pageBar }
			        	</div> 
			        
					</div>
		</div>
	</div>
</div>


<script>

function changeMemberV(event){
	let memberId=event.target.parentElement.parentElement.children[1].children[0].value;
	let memberPhone=event.target.parentElement.parentElement.children[3].children[0].value;
	let memberAddress=event.target.parentElement.parentElement.children[5].children[0].value;
	let memberPoint=event.target.parentElement.parentElement.children[6].children[0].value;
	let memberGradeNo=event.target.parentElement.parentElement.children[7].children[0].value;
	console.dir(memberPhone);
	console.log("${path}/admin/memberUpdate.do?memberPhone="+memberPhone+"&memberAddress="+memberAddress+"&memberPoint="+memberPoint+"&memberGradeNo="+memberGradeNo+"&memberId="+memberId);
	location.assign("${path}/admin/memberUpdate.do?memberPhone="+memberPhone+"&memberAddress="+memberAddress+"&memberPoint="+memberPoint+"&memberGradeNo="+memberGradeNo+"&memberId="+memberId);
	
} 


function adminMemberDelete(event){
	/*  let memberDeleteN = confirm($(e.target).prev().val()+"회원을 정말 삭제하시겠습니까?"); 
	
	if(memberDeleteN){
		$("#adMemberT").attr("action","${path}/admin/"+url+"memberId"+${memberId})
		
	}  */ 
	$(".adMemberT").submit(); 
	
	/* console.log(event.target); */
	
}
</script>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="" value="" />
</jsp:include> --%>