<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>${param.title }</title> 
    <link rel="stylesheet" href="${path }/resources/css/newHeader.css">
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>
<div class="header">
     <div class="header-top">
         <ul class="header-top-info1">
        <!--
                <li class="store-info"><a href="#">매장안내 ▼</a></li>
                <div>    
                    <li><a href="#">회원혜택 ▼</a></li>
                    <div class="benefit"></div>
                </div>
            </ul>
            <ul class="header-top-info2">
                <li class="login"><a href="#">로그인</a></li>
                <li><a href="#">회원가입</a></li>
                <li><a href="#">고객센터</a></li>
                <li><a href="#">주문배송</a></li>
                <li><a href="#"><img src="../components/image/baguni.svg" style="width: 24px; height: 24px;"></a></li>
        -->
            </ul> 
    </div> 
    <!--
        <div class="info">
            <ul>
                <li><a href="#">강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</a></li>
                <li><a href="#">강남지원 2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 4F, 5F, 7F</a></li>
                <li><a href="#">강남지원 3관 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F</a></li>
                <li><a href="#">종로지원 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</a></li>
                <li><a href="#">당산지원 : 서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F, 20F</a></li>
                <li><a href="#">이태원지원 : 서울특별시 용산구 보광로 73 한국폴리텍제1대학</a></li>
            </ul>
        </div> -->
    
        <div class="header-mid">
            <img src="${path }/resources/images/common/mgbanner.png" alt="">
            <!-- <h1 class="logo">
                <a href="#">
                    <img src="../components/image/kh문고 로고 final.png" style="width: 250px;">
                </a> 
            </h1>
            <div class="header-mid-searchBox">
                <div class="flex">
                <div class="searchBox-slideBox">
                    <div class="searchBox-slideList">
                        <div class="searchBox-slideContent">
                                <a href="#" class="fontColor"><span >책번호1</span></a>
                                <a href="#" class="fontColor"><span>책번호2</span></a>
                                <a href="#"  class="fontColor"><span>책번호3</span></a>
                                <a href="#"  class="fontColor"><span >책번호4444444444</span></a>
                        </div>   
                        <div class="searchBox-slideContent">
                                <a href="#" class="fontColor"><span class="text-deco">책번호5</span></a>
                                <a href="#" class="fontColor"><span >책번호6</span></a>
                                <a href="#" class="fontColor"><span >책번호7</span></a>
                                <a href="#" class="fontColor"><span >책번호8</span></a>
                        </div>   
                    </div>
                </div>
                <div class="slide-pagination"></div>
                <button class="searchBox-slideBtn-prev"><</button>
                <button class="searchBox-slideBtn-next">></button>
                </div>
                <div class="flex searchBox-box">
                    <div>
                        <input type="text" class="searchBox-input">
                    </div>
                    <button class="searchBox-btn" value="검색">
                        <img src="../components/image/dotbo.png" alt="" 
                        class="dotbo">
                    </button>
                </div>
            </div> -->
            <!-- 딱딱해 보이는 슬라이드  -->
            <!-- <div class="slide-box">
                <div class="slide-list">
                    <div class="slide-content">
                        <a href="#"><img src="../components/image/배너1.png" alt=""></a><span class="header-slide-explan">책은 마음의 양식.</span>                   
                    </div>
                    <div class="slide-content">
                        <a href="#"><img src="../components/image/배너2.jpg" alt=""></a>
                        <span class="header-slide-explan">양식은 언양식 불고기.</span>
                    </div>
                    <div class="slide-content">
                        <a href="#"><img src="../components/image/캔들.jpg" alt=""></a>
                                <span class="header-slide-explan">흰 배경 캔들 사세요.</span>
                    </div>
                    <div class="slide-content">
                        <a href="#"><img src="../components/image/캔들2.jpg" alt=""></a>
                                <span class="header-slide-explan">검은 배경 캔들 사세요.</span>
                    </div>
                </div>
            </div>
            <div class="flex slide-button">
                <div class="slide-pagination"></div>
                <button class="slide-button-prev"><span><</span></button>
                <button class="slide-button-next"><span>></span></button>
            </div>  -->
        </div>
  
    <div class="header-bottom">
        <div class="header-bottom-div">
            <!-- <div style="background-color: #353f67;">
                <a href="#"><img src="../components/image/작은삼선2.png" alt="" style="
                padding-top: 10px; 
                padding-left: 10px; 
                padding-right: 10px;
                "></a>
            </div> -->
            <div class="header-menuBar1">
                <ul class="flex">
                    <li>
                    	<a href="${path}/sellbookController/sellbook.do"><div>문곰도서▼</div></a>
                     	<ul class="eBook">
                            <li><a href="#">아동 도서</a></li>
                            <li><a href="#">초등 도서</a></li>
                            <li><a href="#">중등 도서</a></li>
                        </ul>
                    </li>
                   <!--  <li><a href="#">외국도서</a></li> -->
                    <li>
                        <a href="${path}/ebook/pageEbook.do"><div>문곰e북 ▼</div></a>
                        <ul class="eBook">
                            <li><a href="#">일반도서</a></li>
                            <li><a href="#">판타지/무협</a></li>
                            <li><a href="#">로맨스</a></li>
                            <li><a href="#">코믹스</a></li>
                            <li><a href="#">오디오북</a></li>
                        </ul>
                    </li>
                    <li class="item">
                    	<a href="${path }/gift/giftView.do">문곰템 ▼</a>
                    	<ul class="giftTab">
                            <li><a href='${path }/gift/moreThing.do?giftCate=e'>전자기기</a></li>
                            <li><a href='${path }/gift/moreThing.do?giftCate=s'>수납/정리</a></li>
                            <li><a href='${path }/gift/moreThing.do?giftCate=r'>독서 필수템</a></li>
                            <li><a href="${path }/gift/moreThing.do?giftCate=g">잡화</a></li>
                        </ul>
                    </li>
                    <li><a href="${path}/usedboard/usedboardList.do">중고</a></li>
                     <li><a href="${path}/auction/auction.do">경매</a></li>
                </ul>
            </div>
            <div class="header-menuBar2">
                <ul class="flex">
                    <c:if test="${loginMember==null }">
                	<li class="login"><a href="${path }/member/loginPage.do">로그인</a></li>
                	<li><a href="${path }/member/enrollPage.do">회원가입</a></li>
                </c:if>
                <c:if test="${loginMember!=null }">
                	<li class="user1"><a href="${path }/member/myroom.do">${loginMember.memberName }님 (${loginMember.memberGradeNo}) ▽</a></li>
                	<%-- <li><a href="${path }/myroom/memberGradeGo.do">(${loginMember.memberGrade}) ▽</a></li> --%>
                	<li><a href="${path }/member/logout.do">로그아웃</a></li>
                	
                </c:if>
                    <li><a href="${path }/member/myroom/main.do">마이룸</a></li>
                    <li><a href="${path }/admin/adminPage.do">관리자전용페이지</a></li>
                	<li><a href="${path }/service/servicePage.do">고객센터</a></li>
                </ul>
            </div>
            <div></div>
        </div>
    </div>
</div>
<script>
    let item = $('.item');
    let tab = $('.giftTab');
    $(function(){
        $(item).mouseover(function(){
            // tab.slideDown(500);
            tab.css('display',"flex");   
            $(tab).mouseover(function(){
                tab.css('display',"flex"); 
            })
        })
        $(tab).mouseout(function(){
            tab.css('display',"none");
        }) 
        $(item).mouseout(function(){
            tab.css('display',"none");
        }) 
    });
</script>
</body>
</html>