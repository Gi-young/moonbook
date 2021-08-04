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
<link rel="stylesheet" href="${path }/resources/css/index/stickymenu.css">
</head>
<body>
	<div class="stickycontainer">
        <div class="category-open">
            <a href="${path}"><img src="${path }/resources/img/sticky/stickybook.png" alt="" style="height: 50px;"></a>
        </div>
        <div class="stickymenu">
            <ul>
                <!-- 페이지 전환할 때 스크립트로 전환 -->
                <li>
                    <a style="color:#582810;" href="${path}/sellbookController/sellbook.do">문곰도서</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#582810;" href="${path}/ebook/pageEbook.do">문곰e북</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#582810;" href="${path }/gift/giftView.do">문곰템</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#582810;" href="${path}/usedboard/usedboardList.do">중고</a> 
                </li>
                <p>·</p>
                <li>
                    <a style="color:#582810;" href="${path}/auction/auction.do">경매</a> 
                </li>
            </ul>
        </div>
    </div>
    <script>
        var lnb = $(".stickycontainer").offset().top;

        $(window).scroll(function() {
            var window = $(this).scrollTop();
        console.log("엘엔비"+lnb);
        console.log("윈도우"+window);
            if( 300 <= window) {
            $(".stickycontainer").addClass("fixed");
            $(".stickycontainer").css("display","flex");
            
            } else {
            $(".stickycontainer").removeClass("fixed");
            $(".stickycontainer").css("display","none");
            }
	    });
        
    </script>
</body>
</html>