<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e북 독서클럽 - 문곰책방"/>
	<jsp:param name="currentPageIndex" value="3"/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookClub.css">

	<aside>
		<ul>
			<li><a href="${path}/ebook/pageEbookClubManager.do">나의 클럽 관리하기</a></li>
			<li><a href="${path}/ebook/pageEbookClubBoard.do">클럽 게시판</a></li>
			<li><a href="${path}/ebook/pageEbookClubDebate.do">토론방</a></li>
			<li><a href="${path}/ebook/pageEbookClubDebateManager.do">토론 관리하기</a></li>
			<li><a href="${path}/ebook/pageEbookClubGather.do">클럽 홍보마당</a></li>
		</ul>
	</aside>
	
	<section>
		<div class="create-club">
			<p>새로운 독서클럽 만들기</p>
			
			<div>
				<input type="text" id="clubName" placeholder="클럽 이름">
				<span id="checkClubName"></span>
			</div>
			
			<div>
				<input type="button" onclick="createClub();" value="독서클럽 만들기"/>
				<span id="createNotice"></span>
			</div>
		</div>
		
		<div class="join-club">
			<p>[클럽 이름]으로 가입하기</p>
			
			<div>
				<input type="text" id="searchClubName" placeholder="클럽 이름">
				<span id="checkSearchClubName"></span>
			</div>
			
			<div>
				<input type="button" onclick="joinClub();" value="가입 신청하기"/>
				<span id="joinNotice"></span>
			</div>
		</div>
		
		<div class="club-box">
			<p>내가 가입한 독서클럽 정보</p>
		
			<select id="selectClub"></select>
			
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>이메일</th>
						<th>주소</th>
						<th>리더</th>
						<th>추방</th>
					</tr>
				</thead>
				<tbody></tbody>
				<tfoot>
					<tr>
						<td>총 인원</td>
						<td id="totalMember" colspan="6"></td>
					</tr>
				</tfoot>
			</table>
			
			<div class="deleteClub">
				<input type="button" onclick="deleteClub();" value="독서클럽 해체하기"/>
			</div>
		</div>
		
		<div class="club-notice">
			<p>독서클럽 알림</p>
			<div id="noticeBoard"></div>
		</div>
		
	</section>
	
	<input type="hidden" id="contextPath" value="${path}">

	<script src="${path}/resources/js/ebook/wizard/ebookClubManager.js"></script>
	
</body>
</html>