<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>     
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value=""/>
</jsp:include>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${path }/resources/css/gift.css">
<div class="wrap">
    <!-- 전체를 감싸고 있는 div -->
    <div class="hotTracks">
    <!-- 상단 핫트랙스 메뉴바 -->
        <div class="category-open">
            <img src="${path }/resources/images/gift/기프트헤더로고.png" alt="" style="height: 50px;">
        </div>
        <div class="hotTracks-menu">
            <ul>
                <!-- 페이지 전환할 때 스크립트로 전환 -->
                <li>
                    <a style="color:#696969;">전자기기</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#696969;">수납/정리</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#696969;">독서 필수템</a>
                </li>
                <p>·</p>
                <li>
                    <a style="color:#696969;">잡화</a> 
                </li>
            </ul>
        </div>
    </div>
    <div class="slide-container">
        <!-- 리스트를 담고 있는 박스 -->
       <div class="firstSlide-list">
           <!-- 길게 늘어뜨린 리스트 -->
           <div class="firstSlide-content">
               <!-- 리스트 안 각각의 컨텐츠  -->
            <div class="first">
            </div>     
           </div>
           <div class="firstSlide-content">
            <!-- 리스트 안 각각의 컨텐츠  -->
            <div class="second">
            </div> 
           </div>
           <div class="firstSlide-content">
            <!-- 리스트 안 각각의 컨텐츠  -->
            <div class="third">    
               
            </div>   
           </div>
        </div>
        <div class="heads-pagination"></div>    
        <div class="btn-box"> 
            <div class="pageBar">
            <span class="bold first-num"></span>
            <span class="second-num"></span>
            </div>
            <div class="slide-btn-box">
                <a class="slide-btn headsBtn-prev">〈</a>
                <a class="slide-btn headsBtn-next">〉</a>
            </div>
        </div>
        <a href="#">
            <div class="slide-modal"></div>
        </a> 
        <div class="modal-pop-back">
        </div>
    </div> 
    <div class="modal-pop-content">
        <a href="#" class="exit-modal">
            <span class="modal-exitBtn">✕</span>
        </a>
        <div class="modal-img">
            <a href="#">
                <img src="../components/image/modal1.jpg" alt="">
            </a>
        </div>
        <div class="modal-img">
            <a href="#">
                <img src="../components/image/modal1.jpg" alt="">
            </a>
        </div>
        <div class="modal-img">
            <a href="#">
                <img src="../components/image/modal1.jpg" alt="">
            </a>
        </div>
        <div class="modal-img">
            <a href="#">
                <img src="../components/image/modal1.jpg" alt="">
            </a>
        </div>
        <div class="modal-img">
            <a href="#">
                <img src="../components/image/modal1.jpg" alt="">
            </a>
        </div>
        <div class="modal-img">
            <a href="#">
                <img src="../components/image/modal1.jpg" alt="">
            </a>
        </div>
        <div class="modal-img">
            <a href="#">
                <img src="../components/image/modal1.jpg" alt="">
            </a>
        </div>
        <div class="modal-img">
            <a href="#">
                <img src="../components/image/modal1.jpg" alt="">
            </a>
        </div>
    </div>
    <div class="wrap">
        <!-- 맨 위 슬라이드 배너를 제외한 나머지 부분을 감싸고 있는 div -->
        <div class="giftFooter">
            <!-- 기프트 하단 -->
                <ul class="gfBar">
                    <li>
                        전자기기
                    </li>
                    <li>
                       수납/정리
                    </li>
                    <li>
                        독서 필수템
                    </li>
                    <li>
                        잡화
                    </li>
                </ul>
                    <div class="gf-content">
                        <!-- 상품 테마 설명 -->
                        <!-- 테마별 대표 상품 사진 -->
                        <div class="gf-content-circle"></div>
                            <a href="#" class="gf-content-left">
                                <span class="gf-content-discount">~33%</span>
                                <div>
                                    <div class="gf-left">
                                        <p class="gf-left-title">시원한 마린시티로 떠나볼까요~?</p>
                                        <p class="gf-left-subTitle">덤덤프렌즈 여름 신상 출시! 전품목 할인!</p>
                                        <p class="gf-left-date">2021.07.09 ~ 2021.07.29</p>
                                    </div>
                                    <img src="${path }/resources/images/마린시티스티커.jpg" alt="">
                                </div>
                            </a>
                        <div class="gf-content-right">
                            <ul class="flex">
                                <li>
                                    <img src="${path }/resources/image/과자집씰스티커.jpg" alt="">
                                    <p style="font-weight: 800; padding-top: 20px;">과자집 씰스티커</p>
                                    <div class="flex" style="margin-top: 30px;">
                                        <p class="discount">10%</p>
                                        <p class="price">2,430</p>
                                    </div>
                                </li>
                                <li>
                                    <img src="../components/image/과자집씰스티커.jpg" alt="">
                                    <p style="font-weight: 800; padding-top: 20px;">과자집 씰스티커</p>
                                    <div class="flex" style="margin-top: 30px;">
                                        <p class="discount">10%</p>
                                        <p class="price">2,430</p>
                                    </div>
                                </li>
                            </ul>
                            <ul class="flex">
                                <li>
                                    <img src="../components/image/과자집씰스티커.jpg" alt="">
                                    <p style="font-weight: 800; padding-top: 20px;">과자집 씰스티커</p>
                                    <div class="flex" style="margin-top: 30px;">
                                        <p class="discount">10%</p>
                                        <p class="price">2,430</p>
                                    </div>
                                </li>
                                <li>
                                    <img src="../components/image/과자집씰스티커.jpg" alt="">
                                    <p style="font-weight: 800; padding-top: 20px;">과자집 씰스티커</p>
                                    <div class="flex" style="margin-top: 30px;">
                                        <p class="discount">10%</p>
                                        <p class="price">2,430</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
           
            </div>
        <div class="container">
            <div class='left-cont'>
                    <p class="todayPop-title">오늘만 특가 〉</p>
                    <div class="timer-img">
                        <img src="../components/image/hourglass.png" alt="" style="width: 25px; height: 25px;">
                        <p class="timer"></p>
                    </div>
                    <div class="remain-timeBox">
                        <!-- 남은시간 줄어드는 그래프 -->
                        <div>
                            <p class="remain-time">남은시간</p>
                            <div class="timeBar"> 
                                <div class="innerBar"></div>
                            </div>  
                        </div>               
                    <div class="toSale-main">
                        <div style="width: 350px;">
                            <a href='#'>
                                <img src="../components/image/넥밴드선풍기.jpg" alt="" class="toSale-mainImg">
                                <div class="freeship-wrap">
                                    <span class="freeship">무료배송</span>
                                </div>
                                    <p class="toSale-mainEx">아이리버 STORM NF-1400 넥밴드 선풍기</p>
                                <div class="toSale-price">
                                    <p class="price" style="font-size: 32px;">24,900</p>
                                </div>
                            </a>
                        </div>
                        <div class="toSale-sub">
                            <ul class="toSale-ul">
                                <li>
                                    <img src="../components/image/버섯조명jpg.jpg" alt="">
                                    <p class="toSale-dc">할인율</p>
                                </li>
                                <li>
                                    <img src="../components/image/라핀선크림.png" alt="">
                                    <p class="toSale-dc">할인율</p>
                                </li>
                                <li>
                                    <img src="../components/image/전신거울스탠드.jpg" alt="">
                                    <p class="toSale-dc">할인율</p>
                                </li>
                                <li>
                                    <img src="../components/image/led스탠드레드.jpg" alt="">
                                    <p class="toSale-dc">할인율</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-cont">
                    <p class="todayPop-title">인기베스트 〉</p>
                    <p class="todayPop-cg">문구/기프트</p>
                    <hr class="cg-line"></hr>
                    <!-- 아마도 카테고리는 특정 시간마다 바뀌는듯, 아니면 문구/기프트 
                        고정-->
                    <div class="todayPop-contentList">
                        <ul>
                            <li>
                                <a href="#" class="todayPop-contentTop">
                                    <p style="font-style: italic; font-weight: 900;">1</p>
                                    <img src="../components/image/까사니.jpg" alt="">
                                    <div class="todayPop-contentEnd">
                                        <p class="endFont-top">[까사니]스텐 양면도마</p>
                                        <div class="flex" style="padding-top: 10px;">
                                            <p class="endFont-mid">90%</p>
                                            <p class="endFont-bot">19,900</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="todayPop-content">
                                    <p style="font-style: italic; font-weight: 900;">2</p>
                                    <img src="../components/image/주방가위.jpg" alt="">
                                    <div class="todayPop-contentEnd">
                                        <p class="endFont-top">주방가위</p>
                                        <div class="flex" style="padding-top: 10px;">
                                            <p class="endFont-mid">90%</p>
                                            <p class="endFont-bot">19,900</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="todayPop-content">
                                    <p style="font-style: italic; font-weight: 900;">3</p>
                                    <img src="../components/image/갤럭시핏.jpg" alt="">
                                    <div class="todayPop-contentEnd">
                                        <p class="endFont-top">갤럭시핏</p>
                                        <div class="flex" style="padding-top: 10px;">
                                            <p class="endFont-mid">90%</p>
                                            <p class="endFont-bot">19,900</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="todayPop-content">
                                    <p style="font-style: italic; font-weight: 900;">4</p>
                                    <img src="../components/image/폰거치대.jpg" alt="">
                                    <div class="todayPop-contentEnd">
                                        <p class="endFont-top">다관절 거치대</p>
                                        <div class="flex" style="padding-top: 10px;">
                                            <p class="endFont-mid">90%</p>
                                            <p class="endFont-bot">19,900</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="todayPop-content">
                                    <p style="font-style: italic; font-weight: 900;">5</p>
                                    <img src="../components/image/아이스쿨팩.jpg" alt="">
                                    <div class="todayPop-contentEnd">
                                        <p class="endFont-top">아이스 쿨팩</p>
                                        <div class="flex" style="padding-top: 10px;">
                                            <p class="endFont-mid">90%</p>
                                            <p class="endFont-bot">19,900</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
            </div>
        </div>  
        <!-- <div class="event-container">
            <ul class="event-ul">
                <li style="float: left;">
                    <a class="info-cont" href="#">
                        <div>
                            <img src="../components/image/곰도리.jpg" alt="" class="event-img" onerror="this.src='http://image.kyobobook.co.kr/images/no_image.gif;'" style="border: 1px solid black;">
                        </div>
                        <span class="event-percent"> ~10%</span>
                        <h2 class="prod-ex">처키가 가지고 놀던 그 곰인형이 돌아왔어요!</h2>
                        <h3 class="prod-ex2">THIS IS NOT A MOSCHINO TOY</h3>
                    </a>
                </li>
                <li>
                    <a>
                        <div>
                            <img src="../components/image/송하영.jpg" alt="" class="event-img">
                        </div>
                        <h2 class="prod-ex">송하영 개이쁨</h2>
                        <h3 class="prod-ex2">설명창 부분</h3>
                    </a>
                </li>
            </ul>
            <ul class="event-ul">  
                <li>
                    <a>
                        <div>
                            <img src="../components/image/라멘.jpg" alt="" class="event-img">
                        </div>
                        <span class="event-percent">~70%</span>
                        <h2 class="prod-ex">대전에 있는 한 라멘집! 라멘 먹고싶다!</h2>
                        <h3 class="prod-ex2">대전 어딘가</h3>
                    </a>
                </li>
                <li>
                    <a>
                        <div>
                            <img src="../components/image/한소희.jpg" alt="" class="event-img">
                        </div>
                        <span class="event-percent"></span>
                        <h2 class="prod-ex">한소희 개이쁨</h2>
                        <h3 class="prod-ex2">설명창 부분</h3>
                    </a>
                </li>
            </ul>  
            <ul class="event-ul">    
                <li>
                    <a>
                        <div>
                            <img src="../components/image/유니콘.jpg" alt="" class="event-img">
                        </div>
                        <span class="event-percent">~45%</span>
                        <h2 class="prod-ex">유니콘</h2>
                        <h3 class="prod-ex2">다시 돌아온 유니콘</h3>
                    </a>
                </li>
                <li>
                    <a>
                        <div>
                            <img src="../components/image/iu.jpg" alt="" class="event-img">
                        </div>
                        <span class="event-percent"></span>
                        <h2 class="prod-ex">아이유 개이쁨</h2>
                        <h3 class="prod-ex2">설명창 부분</h3>
                    </a>
                </li>
            </ul>
        </div> -->
        <div class="container3">
            <h2 style="font-size: 45px; font-weight: lighter;">
                <strong style="font-size: 45px; font-weight: 800;">지금,</strong>
                <br>
                <div class="space"></div>
                이 상품을
                <span class="cont3-font">
                가장 많이
                </span>
                보고 있어요
             
            </h2>
            <div class="cont3-slide-wrap">
                <div class="cont3-slide-box">
                    <div class="cont3-slide-list">
                        <div class="cont3-slide-content">
                            <ul>
                                <div class="img-container">
                                    <li>
                                        <a href="#">
                                            <div class="cont3-img-info">
                                                <img src="../components/image/노란우산.jpg" alt="" class="cont3-img">
                                                <div class="img-info dis-none">
                                                    <p>태풍을 이기는 우산 블런트 메트로2</p>
                                                    <p>
                                                        <span class="img-info-per">36%</span>
                                                        54,800
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="cont3-img-info margin-left24">
                                                <img src="../components/image/핑크우산.jpg" alt="" class="cont3-img">
                                                <div class="img-info dis-none">
                                                    <p>태풍을 이기는 우산 블런트 메트로2</p>
                                                    <p>
                                                        <span class="img-info-per">36%</span>
                                                        54,800
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </div>
                                <div class="img-container">
                                    <li>
                                        <a href="#">
                                            <div class="cont3-img-info">
                                                <img src="../components/image/블랙우산.jpg" alt="" class="cont3-img">
                                                <div class="img-info dis-none">
                                                    <p>태풍을 이기는 우산 블런트 메트로2</p>
                                                    <p>
                                                        <span class="img-info-per">36%</span>
                                                        54,800
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="cont3-img-info margin-left24">
                                                <img src="../components/image/체크우산.jpg" alt="" class="cont3-img">
                                                <div class="img-info dis-none">
                                                    <p>태풍을 이기는 우산 블런트 메트로2</p>
                                                    <p>
                                                        <span class="img-info-per">36%</span>
                                                        54,800
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </div>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="cont3-btn">
                    <div></div>
                    <span style="margin-right: 10px; color:black; font-weight: 700; font-size: 24px;">1</span>5
                    <div class="flex" style="align-items: center;">
                        <input class="cont3-left-btn" type="button" value="〈">
                        <div style="font-size: 22px; padding-bottom: 2px;">│</div>
                        <input class="cont3-right-btn" type="button" value="〉">
                    </div>
                </div>
            </div>
        </div>
        <div class="container4">
            <h2 class="recommend-font">내게 맞는 추천 상품</h2>
            <div class="reco-product">
                <!-- 나에게 맞는 추천 상품 -->
                <ul class="reco-product-ul">
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                </ul>
                <ul class="reco-product-ul">    
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                </ul>
                <ul class='reco-product-ul'>                    
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                    <li>
                        <a class="reco-a">
                            <div>
                                <img src="" alt="" class="reco-img">
                            </div> 
                            <p style="margin-top: 25px; font-weight: 550;">아에르 어드밴스드 라이트핏 KF80 마스크 핑크 10매</p>
                            <p style="font-size: 24px; font-weight: 800; margin-top: 10px;">
                                <!-- 할인율 -->
                                <span style="color: red; font-weight: 800; font-size: 24px; margin-right: 10px;">67%</span>  
                                9,900
                            </p>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- 더보기 버튼 -->
            <div class="add-product">
                <a class="add-product-a">
                    <p class="add-product-font">더보기 <span style="font-size: 28px; font-weight: 500;">+</span></p>
                </a>
            </div>
        </div>
        <!-- <div class="wrap">
        에디터 추천 
        <h2 class="edit-title">에디터 추천</h2>
        <div class="edit-banner">
            <div class="edit-slide">
                <ul class="edit-ul">
                    <li class="edit-li">
                        <a class="edit-content" href="#">
                           <img class="edit-img" src="../components/image/소형오븐.jpg"> 
                           <div class="edit-font-div">
                                <div>
                                    <p class="edit-font">[미니주방] 복고 가정용 소형 전기오븐</p>
                                </div>
                                <div class="edit-saleBox">
                                    <p class='discount'>31%</p>
                                    <p class="price">136000</p>
                                </div>
                           </div>
                        </a>                  
                        <a class="edit-content"  href="#">
                            <img class="edit-img" src="../components/image/스팀다리미.jpg"> 
                            <div class="edit-font-div">
                                <div>
                                    <p class="edit-font">[가전] 스팀 다리미</p>
                                </div>
                                <div class="edit-saleBox">
                                    <p class="discount">20%</p> 
                                    <p class="price">86000</p>
                                </div>
                            </div>
                         </a>
                    </li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
                <div class="edit-pagination"></div>
                <div class="edit-btnBox">
                    <p class="edit-count">1</p>
                    <p class="edit-subcount">5</p>
                    <input type="button" class="edit-btn edit-prevBtn" value="〈">
                    <div style="font-size: 18px; padding-bottom:4px; font-weight: lighter;">|</div>
                    <input type="button" class="edit-btn edit-nextBtn" value="〉">  
                </div>
            </div>
        </div>
        </div> -->
        <!-- <div class="wrap updown-slide">
        세로 스크롤 슬라이드
            <div class="updown-box">
                <ul class="updown-list">
                    <li class="updown-content">
                            <pre class="updown-font">너무 더워서 이걸로는 택도 없지만!<br>레트로 선풍기!
                            </pre>
                        <div class="updown-img">
                            <p class="updown-num">
                                01
                            </p>
                            <a>   
                                <img src="../components/image/레트로선풍기.jpg" alt="" style="width: 650px; height: 500px;">
                                <div class="updown-imgDate">
                                    <p style="padding-right: 25px; font-size: 16px;   font-weight: 550;">2 0 2 1 . 0 4 . 1 5  ~  2 0 2 1 . 0 7 . 1 5</p>
                                </div>
                            </a>
                        </div>       
                    </li>
                    <li class="updown-content">
                        <pre class="updown-font">너무 더워서 이걸로는 택도 없지만!<br>레트로 선풍기!
                        </pre>
                    <div class="updown-img">
                        <p class="updown-num">
                            01
                        </p>
                        <a>   
                            <img src="../components/image/레트로선풍기.jpg" alt="" style="width: 650px; height: 500px;">
                            <div class="updown-imgDate">
                                <p style="padding-right: 25px; font-size: 16px;   font-weight: 550;">2 0 2 1 . 0 4 . 1 5  ~  2 0 2 1 . 0 7 . 1 5</p>
                            </div>
                            </a>
                        </div>       
                    </li>
                    <li class="updown-content">
                        <pre class="updown-font">너무 더워서 이걸로는 택도 없지만!<br>레트로 선풍기!
                        </pre>
                    <div class="updown-img">
                        <p class="updown-num">
                            01
                        </p>
                        <a>   
                            <img src="../components/image/레트로선풍기.jpg" alt="" style="width: 650px; height: 500px;">
                            <div class="updown-imgDate">
                                <p style="padding-right: 25px; font-size: 16px;   font-weight: 550;">2 0 2 1 . 0 4 . 1 5  ~  2 0 2 1 . 0 7 . 1 5</p>
                            </div>
                        </a>
                    </div>       
                </li>
                <li class="updown-content">
                    <pre class="updown-font">너무 더워서 이걸로는 택도 없지만!<br>레트로 선풍기!
                        </pre>
                    <div class="updown-img">
                        <p class="updown-num">
                            01
                        </p>
                        <a>   
                            <img src="../components/image/레트로선풍기.jpg" alt="" style="width: 650px; height: 500px;">
                            <div class="updown-imgDate">
                                <p style="padding-right: 25px; font-size: 16px;   font-weight: 550;">2 0 2 1 . 0 4 . 1 5  ~  2 0 2 1 . 0 7 . 1 5</p>
                            </div>
                        </a>
                    </div>       
                </li>
                <ul class="updown-pagination">
                </ul>
                <div class="updownBtn-prev"></div>
                <div class="updownBtn-next"></div>
                </ul>
            </div>
        </div> -->
        <div class="edit-season">
        <!-- 계절별 추천 -->
            <div class="season-barBox">
                <p class="seasonbox-num">01</p>
                <div class="seasonbox">
                    <ul class="seasonbox-ul">
                        <!-- ajax -->
                        <li>
                            <a href="#" class="seasonbox-a">인테리어</a>
                        </li>
                        <li>
                            <a href="#" class="seasonbox-a">홈트레이닝</a>
                        </li>
                        <li>
                            <a href="#" class="seasonbox-a">여름 홈 웨어</a>
                        </li>
                        <li>
                            <a href="#" class="seasonbox-a">쿨매트</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="season-img">
                <img src="../components/image/미니세탁기.jpg" alt="" >
                <div class="season-imgExplan">
                    <div class="flex" style="justify-content: flex-end;">
                        <p class="discount">~20%</p>
                        <p class="price">36000</p>
                    </div>    
                    <p class="season-imgEx">미니미니한 미니세탁기</p>
                </div>
            </div>
        </div>
        <div class="attSlide">
        <!-- 기획상품 -->
            <p style="font-style: italic; color: orangered; font-size: 26px; padding-left: 50px;">Attention</p>
            <div class="att-font">
                <p style="margin-bottom: 20px;">주목!</p>
                <p style="margin-bottom: 20px;">놓칠 수 없는</p>
                <p>소식</p>
            </div>
            <div class="att-slideBox">
            <!-- 기획 상품 슬라이드 부분 -->
                <div class="att-slideList">
                    <div class="att-slideContent">
                            <div class="att-img">
                                <a href="#">
                                    <img src="../components/image/카프3.jpg" alt="">
                                    <p># 홍대에 있는 라이언 팜</p>
                                </a>
                            </div>
                            <div class="att-img" style="margin-left: 10px;">
                                <a href="#">
                                    <img src="../components/image/카프2.jpg" alt="" >
                                    <p># 이름 모르는 애들</p>
                                </a>
                            </div>
                    </div>
                </div>
            </div>
            <div>
                <hr style="width: 1000px;">
                <div class="att-btnBox">
                    <div class="att-pagination"></div>
                    <p class="edit-count">1</p>
                    <p class="edit-subcount">6</p>
                    <input type="button" class="edit-btn edit-prevBtn" value="〈" style="padding-left: 20px;">
                    <div style="font-size: 18px; padding-bottom:4px; font-weight: lighter;">|</div>
                    <input type="button" class="edit-btn edit-nextBtn" value="〉">  
                </div>
            </div>
        </div>
        <!-- <div class="spEdit">
        스페셜에디션; 
            <p class="spEdit-title">스페셜에디션;</p>
            <div class="spEdit-box">
                <div class="hotPB">
                    <p class="hotPB-symbol">◉</p>
                    <p class="hotPB-font">핫트랙스PB</p>
                </div>
                <div class="spEdit-explan">
                    <p class="spEdit-explanTitle">KAKAO 라이언 쓰레빠</p>
                    <pre class="spEdit-explanCon">
                        100% 폐타이어<br>
                        카카오프렌즈샵에서 훔쳐옴
                    </pre>
                    <div class="explan-imgBox">
                        <a href="#">
                            <img src="../components/image/카프1.jpg" alt="">
                        </a>
                    </div>
                    
                        <div class="explan-imgBox">
                            <a href="#">
                                <img src="../components/image/카프2.jpg" alt="">
                            </a> 
                            <a href="#">
                                <img src="../components/image/카프3.jpg" alt="">
                            </a>
                        </div>
                    
                </div>
                <div class="spEdit-bigImgBox">
                    <div class="spEdit-bigImg">
                        <a href="#">
                            <img src="../components/image/카프4.jpg" alt="" style="width: 484px; height: 520px;">
                        </a>
                    </div>
                    <div class="spEdit-btn">
                        <div class="att-pagination"></div>
                        <div class="spEdit-btnBox">
                            <p class="edit-count">1</p>
                            <p class="edit-subcount">6</p>
                            <input type="button" class="edit-btn edit-prevBtn" value="〈" style="padding-left: 20px;">
                            <div style="font-size: 18px; padding-bottom:4px; font-weight: lighter;">|</div>
                            <input type="button" class="edit-btn edit-nextBtn" value="〉"> 
                        </div> 
                    </div>
                </div>
            </div>
        </div> -->
        <div class="notice-footer">
        <!-- 공지사항 -->
            <div class="notice flex">
                <p class="noticeTitle">공지사항 〉</p>
                <ul class="notice-ul">
                    <li class="notice-li">공지사항1</li>
                    <div class="notice-line"></div>
                    <li class="notice-li">공지사항2</li>
                    <div class="notice-line"></div>
                    <li class="notice-li">공지사항3</li>
                    <div class="notice-line"></div>
                    <li class="notice-li">공지사항4</li>
                </ul>
            </div>
            <div class="footer-hotTracks">
                <p class="htTitle">핫트랙스 서비스</p>
                <ul class="ht-ul">
                    <li class="footer-hotTracksImg">
                        <a href="#">
                            <img src="../components/image/free-icon-gps-73364.svg" alt="" style="width: 60px; height: 60px;" class="htImg">
                            <p class="htFont">매장안내</p>
                        </a>
                    </li>
                    <li class="footer-hotTracksImg">
                        <a href="#">
                            <img src="../components/image/vip.svg" alt="" style="width: 60px; height: 60px;" class="htImg">
                            <p class="htFont">멤버십 혜택</p>
                        </a>
                    </li>
                    <li class="footer-hotTracksImg">
                        <a href="#">
                            <img src="../components/image/대량구매.svg" alt="" style="width: 60px; height: 60px;" class="htImg">
                            <p class="htFont">대량구매</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div> 
</div> 

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value=""/>
</jsp:include>
<div class="quickBar"></div>

<script>
    // 가장 많이 보는 상품 이미지 hover 될 때 js
    let imgIn;
    $(".cont3-img-info").hover(function(e){
        let imgInfo=$(e.target).next();
        //console.log(imgInfo);
        imgInfo.css({"display":"flex"});  
        imgIn=imgInfo;
        // console.log(this);  
    },function(){
        imgIn.css({"display":"none"});
    });
    // 이미지 영역 hover시 이미지 바뀌는 연출
    $(".cont3-img").hover(function(e){
        console.log($(e.target).css);
        //$(e.target).css();
    });
    // 현재 스크롤 위치
    // $(window).scroll(function(){
    //     var height=$(document).scrollTop();
    //     console.log(height);
    // })
    $(document).ready(function(){
        // 사이드 퀵메뉴바
        $(".quickBar").load("../html/quickBar.html");
    })
    $(".slide-modal").click(function(){
        console.log("모달창 실행");
        let modal = $(".modal-pop-content");
        let modalBack = $(".modal-pop-back");
        $(".wrap:first").css("height","3474px");
        $(".wrap:first").css("overflow","hidden");
        modalBack.css("display","block");
        modal.css("display","block");
    })
    $(".exit-modal").click(function(){
        console.log("모달창 종료");
        let modal = $(".modal-pop-content");
        let modalBack = $(".modal-pop-back");
        $(".wrap:first").css("height","");
        $(".wrap:first").css("overflow","");
        modalBack.css("display","none");
        modal.css("display","none");
    })
    var lnb = $(".hotTracks").offset().top;
    $(window).scroll(function() {
        var window = $(this).scrollTop();
        if(lnb <= window) {
        $(".hotTracks").addClass("fixed");
        } else {
        $(".hotTracks").removeClass("fixed");
        }
}) 
</script>
<script src="../js/gift_headBanner.js"></script>
<script src="../js/gift_moreView.js"></script>
<script src="../js/timer.js"></script>
<script src="../js/gift_updownScroll.js"></script>
</body>
</html>