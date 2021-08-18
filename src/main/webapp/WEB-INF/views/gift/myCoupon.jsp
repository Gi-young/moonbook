<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${path }/resources/css/gift/myCoupons.css">
</head>
<body style="background-color: #E5E2DB; font-family:'한컴 말랑말랑', '돋움';">
    <div class="couponBox">
        <div class="flex">
     		<p class="userName">${member.memberName }</p>님이 보유하고 계신 쿠폰 정보입니다.
        </div>
        <div class="couponList">
        	 <form action="${path }/gift/choiceCoupon.do" method="post" > 
        	<c:forEach var="i" items="${couponlist }" varStatus="status">
	            <div class="couponView" style="width:500px;"> 
	                <img src="${i.couponImg}" alt="">
	                <p>${i.couponlistName }</p>
	                <p>${i.couponlistAmount }원</p>
	                <p style="font-weight:900;">${i.couponlistForuse eq 'Y'?"사용가능":"기간만료"}</p>
	                <c:if test="${i.couponlistForuse eq 'Y'}">
	                	<button type="button" class="useCoupon" onclick="getUseCoupon(${status.index})">쿠폰 사용</button>
	                </c:if>
					<input type="hidden" value="${i.couponlistNo }" name="couponNo" class="couponNo"/>
	                <input type="hidden" value="${i.couponlistName }" name="couponName" class="couponName"/>
	                <input type="hidden" value="${i.couponlistAmount }" name="couponAmount" class="couponAmount"/>                           
	            </div>
	         </form>   
	        </c:forEach>    
            <%-- <div class="couponView">  
                <img src="${path }/resources/images/gift/silverbear.png" alt="">
                <p>보유 실버 쿠폰</p><p class="cp-count"></p>
                <button class="useCoupon" value="실버 쿠폰">쿠폰사용</button>
            </div>
            <div class="couponView">
                <img src="${path }/resources/images/gift/goldbear.png" alt="">
                <p>보유 골드 쿠폰</p><p class="cp-count">${coupon. }</p>
                <button class="useCoupon" value="골드 쿠폰">쿠폰사용</button>
            </div> --%>
        </div>
        <p class="couponMsg">＊쿠폰사용은 구매 1회당 1회로 제한됩니다.</p>
        	<div class="eventBanner">
        	</div>
    </div>
    
    <script>
    
    function getUseCoupon(i){
        let cpAmount = document.getElementsByClassName("couponAmount")[i].value;
        let cpNo = document.getElementsByClassName("couponNo")[i].value;   
        let cpName = document.getElementsByClassName("couponName")[i].value; 
        let ci = document.getElementsByClassName("couponAmount")[i].value;
        
        if(confirm(cpName+"을 사용하시겠습니까?")){
        	opener.document.getElementById("couponNo").value=cpNo;
        	opener.document.getElementById("couponAmount").value=ci;
        	opener.document.getElementById("ds").innerHTML=cpAmount+"원 <br>할인이 적용됩니다.";
        	window.close();
        	return true;
        }else{
        	return false;
        }
        
    }
 	
    </script>
    
</body>
</html>