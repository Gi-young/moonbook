<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/ebook/wizard/wizardHeader.jsp">
	<jsp:param name="title" value="e북 독서클럽 - 문곰책방"/>
	<jsp:param name="currentPageIndex" value="1"/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/ebook/wizard/ebookClub.css">

	<section>
		<div class="grid-container">
			<div class="create-club">
				<p class="title">새로운 독서클럽 만들기</p>
				
				<input type="text" id="clubName" placeholder="클럽 이름">
				
				<input type="button" onclick="createClub();" value="생성"/>
			</div>
			
			<div class="join-club">
				<p class="title">클럽 가입하기</p>
				
				<input type="text" id="searchClubName" placeholder="클럽 이름">
			
				<input type="button" onclick="joinClub();" value="가입 신청하기"/>
			</div>
			
			<div class="club-box">
				<div class="club-box-header">
					<p class="title">내가 가입한 독서클럽 정보</p>
					<select id="selectClub"></select>
					
					<div>
						<input type="button" onclick="deleteClub();" value="독서클럽 해체하기"/>
					</div>
				</div>
				
				<table>
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>성별</th>
							<th>이메일</th>
							<th>주소</th>
							<th>클럽장</th>
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
			</div>
			
			<div class="club-notice">
				<p class="title">독서클럽 알림</p>
				<div id="noticeBoard"></div>
			</div>
			
			<div class="club-board">
				<div>
					<div class="club-board-header">
						<div class="club-board-header-left">
							<p class="title">우리들의 게시판</p>
							
							<select id="boardType">
								<option value="club">클럽 게시판</option>
								<option value="_recruit">회원 모집 게시판</option>
							</select>
						</div>
						
						<div>
							<input type="button" value="글쓰기" onclick="openWriteBoard();">
						</div>
					</div>
				
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
						</thead>
						
						<tbody></tbody>
					</table>
				</div>
				
				<div id="contentBox">
					<p class="content-none">게시물을 선택해주세요</p>
				</div>
			</div>
			
			<div class="next-ebook">
				<div class="cover-img-box">
					<p>토론할 책을 지정해주세요</p>
				</div>
				
				<div class="bind-no-box">
					<label for="bindNo">책 일련번호</label>
					<input type="number" id="bindNo">
					
					<input type="button" value="확정" onclick="designateNextEbook();">
				</div>
			</div>
			
			<div class="next-date">
				<p class="title">다음 토론 시간</p>
			
				<input type="date" id="nextDate">
				<input type="time" id="nextTime">
				
				<input type="button" value="확정" onclick="designateNextDate();">
			</div>
			
			<div class="reading-record">
				<p class="title">당신의 독서 기록</p>
			
				<div>총 독서 시간 : <span id="totalReadingTime" class="record"></span>분</div>
				
				<div>총 독서량 : <span id="totalReadingPage" class="record"></span>쪽</div>
			</div>
			
			<div class="club-debate">
				<div class="debate-box">
					<div id="debateBoard"></div>
					
					<div class="debate-controller">
						<input type="text" id="debateText" placeholder="메시지를 입력하세요">
						<input type="button" id="debateSubmit" value="전송">
						
						<!-- <label for="uploadImg">이미지 선택</label>
						<input type="file" id="uploadImg">
						
						<input type="button" value="이미지 전송"> -->
						
						<input type="button" id="debateEnd" value="토론 종료">
					</div>
				</div>
				
				<div id="remaining"></div>
				
				<!-- <div class="debate-member"></div> -->
			</div>
		</div>
	</section>
	
	<input type="hidden" id="contextPath" value="${path}">

	<script src="${path}/resources/js/ebook/wizard/ebookClub.js"></script>
	
</body>
</html>