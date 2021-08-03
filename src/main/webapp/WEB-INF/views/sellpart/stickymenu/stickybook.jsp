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
            <a href="${path}"><img src="${path }/resources/img/sticky/stickyfast.png" alt="" style="height: 50px;"></a>
        </div>
        <div class="stickymenu">
            <ul>
                <!-- 페이지 전환할 때 스크립트로 전환 -->
                <li>
                    <a style="color:#582810;" href="${path}/sellbookController/bookadong99.do">아동도서(공통)</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#582810;" href="${path}/sellbookController/bookchodongdonghwa99.do">초등도서(공통)</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#582810;" href="${path}/sellbookController/bookjoongdongworld.do">중등도서(세계)</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#582810;" href="${path}/sellbookController/bookgojunkorea.do">고전도서(한국)</a> 
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