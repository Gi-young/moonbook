<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<section id="content">
<style>
.list-table {
	        margin-top: 20px;
	        margin-bottom: 60px;
	    }
        .list-table th{
        	vertical-align: middle;
        	text-align:center;
            height:40px;
            border-top:2px solid skyblue;
            border-bottom:1px solid #CCC;
            font-weight: bold;
            font-size: 17px;
        }
        .list-table td{
            text-align:center;
            padding:10px 0;
            border-bottom:1px solid	 #CCC; height:20px;
            font-size: 14px ;
            word-break: break-all;
        }
        .btn{
            margin: 10px;
            height: 30px;
            width: 50px;
        }
/*페이지바*/
div#pageBar {
	margin-top: 10px;
	text-align: center;
	background-color: rgba(0, 188, 212, 0.3);
}

div#pageBar span.cPage {
	color: #0066ff;
}
</style>
<center>
<div id="main_in"><br>
		<p id="titi" style="font-size: 35px; color: black;">신고관리</p><br>
        <c:if test="${loginMember!=null }">
        <a href="${path }/usedboard/usedboardList.do?memberId=${loginMember.memberId}" style="font-size: 20px; color: #964b00">내 중고게시판</a> <a style="font-size: 20px; color: #964b00;">/</a> 
        <a href="${path }/usedboard/usedboardMyPayment.do?memberId=${loginMember.memberId}" style="font-size: 20px; color: #964b00;">내 중고구매목록</a> <a style="font-size: 20px; color: #964b00;">/</a>
        <a href="${path }/usedboard/usedboardList.do" style="font-size: 20px; color: #964b00;">중고게시판</a> <a style="font-size: 20px; color: #964b00;">/</a>
        <c:if test="${loginMember.memberId=='admin' }"> 
        <a href="${path }/usedboard/usedboardSingoList.do" style="font-size: 20px; color: #964b00;">신고관리</a>
        </c:if>
        </c:if>
	<table class="list-table">
		<tr>
			<th width="150">신고번호</th>
			<th width="150">신고게시판번호</th>
			<th width="300">신고게시판제목</th>	
            <th width="150">신고자</th>
			<th width="150">게시판삭제</th>
			<th width="150">신고취소</th>
		</tr>
        <c:if test="${list.isEmpty()}">
        	<tr>
            	<td colspan="6">신고내역이 없습니다.</td>
            </tr>
        </c:if>
        <c:forEach var="b" items="${list }">
        	<tr>
				<td>${b.usedboardsingo_No }</td>
				<td>${b.usedboardsingo_BoardNo }</td>
				<td><a href="${path }/usedboard/usedboardView.do?no=${b.usedboardsingo_BoardNo}">${b.usedboards[0].usedboard_Title }</a></td>
				<td>${b.usedboardsingo_Id }</td>
				<td><a href="${path }/usedboard/usedboardDelete.do?singoNo=${b.usedboardsingo_No}&no=${b.usedboardsingo_BoardNo}">삭제하기</a></td>
				<td><a href="${path }/usedboard/usedboardSingoDelete.do?no=${b.usedboardsingo_No}">취소하기</a></td>
			</tr>
        </c:forEach>
	</table><br>
	<div id="pageBarb">${pageBar }</div>
</div>
</center>
</section>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"></jsp:include>