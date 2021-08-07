<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/resources/css/gift/hotTracksMenu.css">
</head>
<body>
	<div class="hotTracks">
    <!-- 상단 핫트랙스 메뉴바 -->
        <div class="category-open">
            <img src="${path }/resources/images/gift/기프트헤더로고.png" alt="" style="height: 50px;">
        </div>
        <div class="hotTracks-menu">
            <ul>
                <!-- 페이지 전환할 때 스크립트로 전환 -->
                <li>
                    <a class="hot-a" href="${path }/gift/moreThing.do?giftCate=e">전자기기</a>
                </li>
                <p>·</p>
                <li>
                    <a class="hot-a" href="${path }/gift/moreThing.do?giftCate=s">수납/정리</a>
                </li>
                <p>·</p>
                <li>
                    <a class="hot-a" href="${path }/gift/moreThing.do?giftCate=r">독서 필수템</a>
                </li>
                <p>·</p>
                <li>
                    <a class="hot-a" href="${path }/gift/moreThing.do?giftCate=g">잡화</a> 
                </li>
            </ul>
        </div>
    </div>
    <script>
        var lnb = $(".hotTracks").offset().top; 
        $(window).scroll(function() { 
            var window = $(this).scrollTop();              
            if(lnb <= window) {
            $(".hotTracks").addClass("fixed");
            } else {
            $(".hotTracks").removeClass("fixed");
            }
    });
    </script>
</body>
</html>