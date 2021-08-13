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
<style>

/* @import url("style.css"); */
/* .qc-padding-left{
    padding-left: 18px;
} */
.quickContents{
    position: fixed;
    bottom: 0;
    top: 50%;
    left: 1700px;
    z-index: 5;
    /* min-width: 1350px; */
    width: 63px;
    height: 370px;
    display: flex;
    align-items: center;
    justify-content: center;
    align-content: center;
}
/* .guide,.toSale{
    width: 61px;
    height: 114px;
    border: 1px solid silver;
} */
.topBtn,.botBtn{
    width: 63px;
    height: 36px;
    cursor: pointer;
    border: 1px solid #AAB1C7;
    border-radius: 5px;
    background-color: #FFFFFF;
    display: flex;
    align-items: center;
    justify-content: center;
    align-content: center;
}
.topBtn:hover,.botBtn:hover{
    border: 3px solid #AAB1C7;
}
.botBtn{
    margin-top: 2px;
    margin-bottom: 2px;
}
/* .openBar{
    background-color: #AAB1C7;
    position: relative;
    width: 63px;
    height: 50px;
    display: flex;
    justify-content: center;
    align-content: center;
    align-items: center;
    cursor: pointer;
} */
.help{
    display: flex;
    align-items: center;
    justify-content: center;
    align-content: center;
    width: 63px;
    height: 50px;
    padding: 12px 10px 12px 10px;
    border: 1px solid #AAB1C7;
    border-radius: 5px;
}
.helpImg{
    width: 41px;
    height: 41px;
}
.help:hover{
    border: 3px solid #AAB1C7;
    cursor: pointer;
}
.chatting{
    display: flex;
    align-items: center;
    justify-content: center;
    align-content: center;
    width: 63px;
    height: 50px;
    padding: 14px 10px 10px 10px;
    border: 2px solid #AAB1C7;
    border-radius: 5px;
}
.chatting img{
    width: 41px;
    height: 41px;
}
.chatting:hover{
    border: 3px solid #AAB1C7;
    cursor: pointer;
}
.locationHome{
    display: flex;
    align-items: center;
    justify-content: center;
    align-content: center;
    width: 63px;
    height: 50px;
    padding: 12px 10px 12px 10px;
    border: 2px solid #AAB1C7;
    border-radius: 5px;
    margin-top: 2px;
}
.locationHome img{
    width: 41px;
    height: 41px;
}
.locationHome:hover{
    border: 3px solid #AAB1C7;
    cursor: pointer;
}
/* .openBar img{
    width: 35px;
    height: 40px;
}
.openBar-wrap{
    display: flex;
    width: 80px;
    margin-right: 30px;
}
.openBar-hover{
    width: 20px;
    height: 50px;
    margin-right: 2px;
    background-color: #AAB1C7;
    font-weight: 800;
    cursor: pointer;
} */


</style>
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
                    <a href="${path }/service/servicePage.do"><img src="${path }/resources/images/상담문의.png" alt="상담문의" class="helpImg"></a>
                </button>
                <button class="chatting">
                    <img src="${path }/resources/images/chat.png" alt="채팅">
                </button>
                <button class="locationHome" onclick="location.assign('${path}')">
                    <img src="${path }/resources/images/gift/퀵바홈버튼.png" alt="홈으로 이동">
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
        $('html, body').animate({scrollTop:'0'},800);
        // 상단 이동 버튼
    })
    $(botBtn).click(function(){
        //window.scrollTo(0,100000);
         let windowEnd = ($(document).height() - $(window).height());
        $('html, body').animate({scrollTop: windowEnd},800); 
        // 하단 이동 버튼
    })
</script>