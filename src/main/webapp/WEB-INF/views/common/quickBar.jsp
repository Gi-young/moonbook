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
    <title>quickBar</title>
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${path }/resources/css/quickBar.css">
</head>
<body>
    <div class="quickContents">
        <div class="qc-padding-left">
            <!-- <div>
            쇼핑가이드 
                <a href="#">
                    <img src="../components/image/쇼핑가이드.jpg" alt="" class="guide">
                </a>
            </div>
            <div>
            오늘만 특가 상품 
                <a href="#">
                    <img src="../components/image/오늘만특가_퀵.jpg" alt="" class="toSale">
                </a>
            </div> -->
            <button class="topBtn" onclick="">
            <!-- 최상단 이동 버튼 -->
            ▲
            </button>
            <button class="botBtn" onclick="">
            <!-- 최하단 이동 버튼 -->
            ▼
            </button>
            <!-- 상담문의, 관리자 연결 -->
                <button class="help">
                    <img src="${path }/resources/images/상담문의.png" alt="상담문의">
                </button>
                <button class="chatting">
                    <img src="${path }/resources/images/chatting.svg" alt="채팅">
                </button>
                <button class="locationHome" onclick="location.assign('${path}')">
                    <img src="${path }/resources/images/퀵바홈버튼.png" alt="홈으로 이동">
                </button>
        </div>
        <!-- <div class="openBar-wrap">
            <button class="openBar-hover"> 
                〈 
            </button>
            <div class="openBar">
                <img src="../components/image/최근본상품.svg" alt="">
            </div>
        </div> -->
    </div>
</body>
</html>
<script>
    // var winWidth = $(".quickContents");
    // // console.log(winWidth);
    // // console.log(winWidth.css("left"));
    // $(window).resize(function(){
    //     console.log($(window).width());
    //     if($(window).width()>1300){
    //         winWidth.css("left","85%");
    //     }else if($(window).width()<1300){
    //         winWidth.css("left","130 0px");
    //     }
    // })
    const topBtn = $(".topBtn");
    const botBtn = $(".botBtn");
    $(topBtn).click(function(){
        window.scrollTo(0,0);
        // 상단 이동 버튼
    })
    $(botBtn).click(function(){
        window.scrollTo(0,100000);
        // 하단 이동 버튼
    })
</script>