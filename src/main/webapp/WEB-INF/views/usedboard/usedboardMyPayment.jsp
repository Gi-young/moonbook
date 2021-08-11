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
		<p id="titi" style="font-size: 35px; color: black;">구매내역</p><br>
        <c:if test="${loginMember!=null }">
        <a href="${path }/usedboard/usedboardList.do?memberId=${loginMember.memberId}" style="font-size: 20px; color: #964b00">내 중고게시판</a> <a style="font-size: 20px; color: #964b00;">/</a> 
        <a href="${path }/usedboard/usedboardMyPayment.do?memberId=${loginMember.memberId}" style="font-size: 20px; color: #964b00;">내 중고구매목록</a> <a style="font-size: 20px; color: #964b00;">/</a>
        <a href="${path }/usedboard/usedboardList.do" style="font-size: 20px; color: #964b00;">중고게시판</a>
        </c:if>
	<table class="list-table">
		<tr>
			<th width="150">구매내역번호</th>
			<th width="200">주문번호</th>
			<th width="300">제목</th>	
            <th width="150">결제일</th>
			<th width="150">가격</th>	
			<th width="150">배송상태</th>
			<!-- <th width="150">결제취소</th> -->
			<th width="150">배송완료</th>
		</tr>
        <c:if test="${list.isEmpty()}">
        	<tr>
            	<td colspan="7">구매내역이 없습니다.</td>
            </tr>
        </c:if>
        <c:forEach var="b" items="${list }">
        	<tr>
				<td>${b.usedboardPayment_No }</td>
				<td>${b.merchant_uid }</td>
				<td width="300"><a href="${path }/usedboard/usedboardView.do?no=${b.usedboardPayment_BoardNo}">${b.usedboardPayment_Title }</a></td>
				<td>${b.usedboardPayment_Date }</td>
				<td>￦${b.usedboardPayment_Price }</td>
				<td>
					<c:if test="${b.usedboardPayment_State==1 }">
						배송확인중
					</c:if>
					<c:if test="${b.usedboardPayment_State==2 }">
						배송중
					</c:if>
					<c:if test="${b.usedboardPayment_State==3 }">
						배송완료
					</c:if>
					<c:if test="${b.usedboardPayment_State==4 }">
						배송취소
					</c:if>
				</td>
				<%-- <td>
					<c:set var="i" value="${i+1 }"/>
					<c:if test="${b.usedboardPayment_State==1 }">
						<c:if test="${usedboardPayment_Cancel==n }">
							<button onclick="cancelPay(this.value)" value="${i }">환불하기</button>
						</c:if>
						<c:if test="${usedboardPayment_Cancel!=n }">
							환불완료
						</c:if>
					</c:if>
					<c:if test="${b.usedboardPayment_State!=1 }">
						환불불가
					</c:if>
				</td> --%>
				<td>
					<c:if test="${b.usedboardPayment_State==2 }">
						<button onclick="location.assign('${path}/usedboard/usedboardPay2.do?no=${b.usedboardPayment_BoardNo }&id=${b.member_Id }');">배송확인</button>
					</c:if>
					<c:if test="${b.usedboardPayment_State==1 }">
						배송확인중
					</c:if>
					<c:if test="${b.usedboardPayment_State==3 }">
						배송완료
					</c:if>
					<c:if test="${b.usedboardPayment_State==4 }">
						배송취소
					</c:if>
				</td>
			</tr>
        </c:forEach>
		
	</table><br>
	<div id="pageBarb">${pageBar }</div>
</div>
</center>
</section>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"></jsp:include>