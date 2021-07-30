<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%int couponCount = 0; %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div class="content_head">
	<div class="user_section">
		<img class="padding10"
			src="${path }/resources/images/${membergrade.membergradeImg }">
		<div class="user_name">${loginMember.memberName }님
			(${membergrade.membergradeName })</div>
	</div>
	<div class="user_point padding10 flex">
		<div class="padding10">포인트 :</div>
		<div class="padding10">${loginMember.memberPoint }</div>
	</div>
	<div class="user_coupon padding10 flex">
		<div class="padding10">쿠폰 :</div>
		<div class="padding10">
			<c:forEach var="c" items="${coupon}" varStatus="status">
				<c:if test="${c.couponCanuse =='Y' && c.couponlistMembergradeNo <= membergrade.membergradeNo}">
					<c:set var="couponCount" value="<%=couponCount+=1 %>" />
				</c:if>
			</c:forEach>
			${couponCount }
		</div>
	</div>
</div>