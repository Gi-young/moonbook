<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<link rel="stylesheet" href="${path }/resources/css/myroom/layout.css">
<link rel="stylesheet" href="${path }/resources/css/memberGrade.css">
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="title" value="쿠폰함 - 문곰책방"/>
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
		<div class="myroom_contents">
			<jsp:include page="/WEB-INF/views/common/myroomHead.jsp">
				<jsp:param value="" name="" />
			</jsp:include>
			<table class="tbl_nextGrade">
				<tr>
					<c:forEach var="mg" items="${allMembergrade }">
						<c:if test="${membergrade.membergradeNo >= mg.membergradeNo}">
							<th><img
								src="${path }/resources/images/${mg.membergradeImg }"></th>
						</c:if>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="mg" items="${allMembergrade }" varStatus="status">
						<c:if test="${membergrade.membergradeNo >= mg.membergradeNo}">
							<td>
								<ul>
									<c:forEach var="c" items="${coupon }">
										<c:if
											test="${c.couponlistMembergradeNo == mg.membergradeNo && c.couponCanuse == 'Y'}">
											<li><img
												src="${path }/resources/images/img_coupon_1000.png">
												<div>${c.couponlistName }</div></li>
										</c:if>
									</c:forEach>
								</ul>
							</td>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<div class="content_middle padding10 bold margin_top2e">
				<h3>사용한 쿠폰내역</h3>
			</div>
			<table class="tbl_nextGrade">
				<tr>
					<th>결제내역</th>
					<th>사용한쿠폰</th>
					<th>사용날짜</th>
				</tr>
				<tr>
					<td>결제내역</td>
					<td>골드곰 등업 축하 쿠폰</td>
					<td><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy.MM.dd HH:mm:ss"/></td>
				</tr>
				<%-- <tr>
					<td>결제내역</td>
					<td>골드곰 등업 축하 쿠폰</td>
					<td><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy.MM.dd HH:mm:ss"/></td>
				</tr>
				<tr>
					<td>결제내역</td>
					<td>골드곰 등업 축하 쿠폰</td>
					<td><fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy.MM.dd HH:mm:ss"/></td>
				</tr> --%>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>