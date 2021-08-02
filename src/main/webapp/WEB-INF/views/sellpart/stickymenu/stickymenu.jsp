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
	<div class="stickycontainer">
        <div class="category-open">
            <img src="${path }/resources/images/gift/기프트헤더로고.png" alt="" style="height: 50px;">
        </div>
        <div class="stickymenu">
            <ul>
                <!-- 페이지 전환할 때 스크립트로 전환 -->
                <li>
                    <a style="color:#696969;" href="${path}/sellbookController/bookadong99.do">아동 도서</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#696969;" href="${path}/sellbookController/bookchodongdonghwa99.do">초등 도서</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#696969;" href="${path}/sellbookController/bookjoongdong.do">중등 도서</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#696969;" href="${path}/sellbookController/bookgojunkorea.do">고전 도서</a> 
                </li>
            </ul>
        </div>
    </div>
    <script>
        var lnb = $(".stickycontainer").offset().top;
        $(window).scroll(function() {
            var window = $(this).scrollTop();
            if(lnb <= window) {
            $(".stickycontainer").addClass("fixed");
            } else {
            $(".stickycontainer").removeClass("fixed");
            }
    });
    </script>
</body>
</html>