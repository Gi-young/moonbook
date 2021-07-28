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
<body style="background-color: #E5E2DB;">
    <div class="couponBox">
        <div class="flex">
     		<p class="userName">사용자</p>님이 보유하고 계신 쿠폰은 총<p class="cp-countAll">0</p>개 입니다.
        </div>
        <div class="couponList">
            <div class="couponView"> 
                <img src="${path }/resources/images/gift/bronzebear.png" alt="">
                <p>보유 브론즈 쿠폰</p><p class="cp-count">숫자</p>
                <button class="useCoupon">쿠폰사용</button>
            </div>
            <div class="couponView">  
                <img src="${path }/resources/images/gift/silverbear.png" alt="">
                <p>보유 실버 쿠폰</p><p class="cp-count">숫자</p>
                <button class="useCoupon">쿠폰사용</button>
            </div>
            <div class="couponView">
                <img src="${path }/resources/images/gift/goldbear.png" alt="">
                <p>보유 골드 쿠폰</p><p class="cp-count">숫자</p>
                <button class="useCoupon">쿠폰사용</button>
            </div>
            <div class="couponView">
                <img src="${path }/resources/images/gift/platinumbear.png" alt="">
                <p>보유 플래티넘 쿠폰</p><p class="cp-count">숫자</p>
                <button class="useCoupon">쿠폰사용</button>
            </div>
        </div>
        <p class="couponMsg">＊쿠폰사용은 구매 1회당 1회로 제한됩니다.</p>
        	<div class="eventBanner">
        </div>
    </div>
</body>
</html>