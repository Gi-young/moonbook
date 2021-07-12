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
    <title>header</title> 
    <link rel="stylesheet" href="${path }/resources/css/style.css">
	<script type="text/javascript" src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    <%-- <script type="text/javascript" src="${path }/resources/js/header.js"></script> --%>
	<!-- <script type="text/javascript" src="/js/header(2).js"></script> -->
</head>
<body>
<div class="header">
    <div class="header-top">
        <ul class="header-top-info1">
        
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
                <li><a href="#"><img src="${path }/resources/images/baguni.svg" style="width: 24px; height: 24px;"></a></li>
            </ul>
    </div>
        <div class="info">
            <ul>
                <li><a href="#">강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</a></li>
                <li><a href="#">강남지원 2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 4F, 5F, 7F</a></li>
                <li><a href="#">강남지원 3관 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F</a></li>
                <li><a href="#">종로지원 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</a></li>
                <li><a href="#">당산지원 : 서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F, 20F</a></li>
                <li><a href="#">이태원지원 : 서울특별시 용산구 보광로 73 한국폴리텍제1대학</a></li>
            </ul>
        </div>
    
        <div class="header-mid">
            <h1 class="logo">
                <a href="#">
                    <img src="${path }/resources/images/kh문고 로고 final.png" style="width: 250px;">
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
                    <button class="searchBox-btn" value="검색" style="background-color:white;">
                        <img src="${path }/resources/images/dotbo.png" alt="" 
                        class="dotbo" style="width:30px; height:30px;">
                    </button>
                </div>
            </div>
            <!-- 딱딱해 보이는 슬라이드  -->
            <div class="slide-box">
                <div class="slide-list">
                    <div class="slide-content">
                        <a href="#"><img src="${path }/resources/images/배너1.png" alt=""></a><span class="header-slide-explan">책은 마음의 양식.</span>                   
                    </div>
                    <div class="slide-content">
                        <a href="#"><img src="${path }/resources/images/배너2.jpg" alt=""></a>
                        <span class="header-slide-explan">양식은 언양식 불고기.</span>
                    </div>
                    <div class="slide-content">
                        <a href="#"><img src="${path }/resources/images/캔들.jpg" alt=""></a>
                                <span class="header-slide-explan">흰 배경 캔들 사세요.</span>
                    </div>
                    <div class="slide-content">
                        <a href="#"><img src="${path }/resources/images/캔들2.jpg" alt=""></a>
                                <span class="header-slide-explan">검은 배경 캔들 사세요.</span>
                    </div>
                </div>
            </div>
            <div class="flex slide-button">
                <div class="slide-pagination"></div>
                <button class="slide-button-prev"><span><</span></button>
                <button class="slide-button-next"><span>></span></button>
            </div>
        </div>
  
    <div class="header-bottom">
        <div class="header-bottom-div">
            <div style="background-color: #353f67;">
                <a href="#"><img src="${path }/resources/images/작은삼선2.png" alt="" style="
                padding-top: 10px; 
                padding-left: 10px; 
                padding-right: 10px;
                "></a>
            </div>
            <div class="header-menuBar1">
                <ul class="flex">
                    <li><a href="#">국내도서</a></li>
                    <li><a href="#">외국도서</a></li>
                    <li>
                        <a href="#"><div>eBook ▼</div></a>
                        <ul class="eBook">
                            <li><a href="#">일반도서</a></li>
                            <li><a href="#">판타지/무협</a></li>
                            <li><a href="#">로맨스</a></li>
                            <li><a href="#">코믹스</a></li>
                            <li><a href="#">오디오북</a></li>
                        </ul>
                    </li>
                    <li><a href="#">기프트 ▼</a></li>
                    <li><a href="#">중고장터</a></li>
                </ul>
            </div>
            <div class="header-menuBar2">
                <ul class="flex">
                    <li><a href="#">베스트</a></li>
                    <li><a href="#">신상품</a></li>
                </ul>
            </div>
            <div></div>
        </div>
    </div>
</div>

<!-- 검색창 위 슬라이드 -->
<script>
(function () {
    const slideList = document.querySelector('.searchBox-slideList');  // Slide parent dom
    const slideContents = document.querySelectorAll('.searchBox-slideContent');  // each slide dom
    const slideBtnNext = document.querySelector('.searchBox-slideBtn-next'); // next button
    const slideBtnPrev = document.querySelector('.searchBox-slideBtn-prev'); // prev button
    const pagination = document.querySelector('.slide-pagination');
    const slideLen = slideContents.length;  // slide length
    const slideWidth = 400; // slide width
    const slideSpeed = 0; // slide speed
    const startNum = 0; // initial slide index (0 ~ 4)
    console.log(slideList);
    console.log(slideContents);
    console.log(slideBtnNext);
    console.log(slideBtnPrev);
    console.log(pagination);
    console.log(slideLen);
    slideList.style.width = slideWidth * (slideLen + 2) + "px";
    
    // Copy first and last slide
    let firstChild = slideList.firstElementChild;
    let lastChild = slideList.lastElementChild;
    let clonedFirst = firstChild.cloneNode(true);
    let clonedLast = lastChild.cloneNode(true);

    // Add copied Slides
    slideList.appendChild(clonedFirst);
    slideList.insertBefore(clonedLast, slideList.firstElementChild);

    // Add pagination dynamically
    let pageChild = '';
    
    for (var i = 0; i < slideLen; i++) {
      pageChild += '<li class="dot';
      pageChild += (i === startNum) ? ' dot_active' : '';
      pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
     
    }
    pagination.innerHTML = pageChild;
    const pageDots = document.querySelectorAll('.dot'); // each dot from pagination

    slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";

    let curIndex = startNum; // current slide index (except copied slide)
    let curSlide = slideContents[curIndex]; // current slide dom
    curSlide.classList.add('slide_active');

    /** Next Button Event */
    slideBtnNext.addEventListener('click', function() {
      if (curIndex <= slideLen - 1) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
      }
      if (curIndex === slideLen - 1) {
        setTimeout(function() {
          slideList.style.transition = "0ms";
          slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = -1;
      }
      curSlide.classList.remove('slide_active');
      pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
      curSlide = slideContents[++curIndex];
      curSlide.classList.add('slide_active');
      pageDots[curIndex].classList.add('dot_active');
    });

    /** Prev Button Event */
    slideBtnPrev.addEventListener('click', function() {
      if (curIndex >= 0) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
      }
      if (curIndex === 0) {
        setTimeout(function() {
          slideList.style.transition = "0ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = slideLen;
      }
      curSlide.classList.remove('slide_active');
      pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
      curSlide = slideContents[--curIndex];
      curSlide.classList.add('slide_active');
      pageDots[curIndex].classList.add('dot_active');
    });

    /** Pagination Button Event */
    let curDot;
    Array.prototype.forEach.call(pageDots, function (dot, i) {
      dot.addEventListener('click', function (e) {
        e.preventDefault();
        curDot = document.querySelector('.dot_active');
        curDot.classList.remove('dot_active');
        
        curDot = this;
        this.classList.add('dot_active');

        curSlide.classList.remove('slide_active');
        curIndex = Number(this.getAttribute('data-index'));
        curSlide = slideContents[curIndex];
        curSlide.classList.add('slide_active');
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
      });
    });
  })();
</script>
<!-- 검색창 오른쪽 배너 -->
<script>
(function () {
    const slideList = document.querySelector('.slide-list');  // 슬라이드 리스트 객체
    const slideContents = document.querySelectorAll('.slide-content');  // 슬라이드 컨텐츠 객체
    const slideBtnNext = document.querySelector('.slide-button-next'); // 다음 버튼
    const slideBtnPrev = document.querySelector('.slide-button-prev'); // 이전 버튼
    const pagination = document.querySelector('.slide-pagination');
    const slideLen = slideContents.length;  // 슬라이드 길이 지정 변수
    const slideWidth = 250; // 슬라이드 길이
    const slideSpeed = 0; // 슬라이드가 넘어갈 때 속도
    const startNum = 0; // 슬라이드 이니셜 인덱스 번호
    
    slideList.style.width = slideWidth * (slideLen + 2) + "px";
    
    // 처음과 마지막을 클론노드 
    let firstChild = slideList.firstElementChild;
    let lastChild = slideList.lastElementChild;
    let clonedFirst = firstChild.cloneNode(true);
    let clonedLast = lastChild.cloneNode(true);

    // 클론노드 한 슬라이드를 앞 뒤로 붙임
    slideList.appendChild(clonedFirst);
    slideList.insertBefore(clonedLast, slideList.firstElementChild);

    // 슬라이드 페이지네이션(페이지바)
    let pageChild = '';
    console.log(slideLen);
    for (var i = 0; i < slideLen; i++) {
      pageChild += '<li class="dot';
      pageChild += (i === startNum) ? ' dot_active' : '';
      pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
      console.log(pageChild);
    }
    pagination.innerHTML = pageChild;
    const pageDots = document.querySelectorAll('.dot'); // 페이지바 하나 하나

    slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";

    let curIndex = startNum; // 시작 슬라이드 인덱스
    let curSlide = slideContents[curIndex]; // 슬라이드 컨텐츠 인덱스
    curSlide.classList.add('slide_active');

    /** 다음 버튼 Event */
    slideBtnNext.addEventListener('click', function() {
      if (curIndex <= slideLen - 1) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
      }
      if (curIndex === slideLen - 1) {
        setTimeout(function() {
          slideList.style.transition = "0ms";
          slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = -1;
      }
      curSlide.classList.remove('slide_active');
      pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
      curSlide = slideContents[++curIndex];
      curSlide.classList.add('slide_active');
      pageDots[curIndex].classList.add('dot_active');
    });

    /** 이전 버튼 Event */
    slideBtnPrev.addEventListener('click', function() {
      if (curIndex >= 0) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
      }
      if (curIndex === 0) {
        setTimeout(function() {
          slideList.style.transition = "0ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = slideLen;
      }
      curSlide.classList.remove('slide_active');
      pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
      curSlide = slideContents[--curIndex];
      curSlide.classList.add('slide_active');
      pageDots[curIndex].classList.add('dot_active');
    });

    /** 페이지바 Event */
    let curDot;
    Array.prototype.forEach.call(pageDots, function (dot, i) {
      dot.addEventListener('click', function (e) {
        e.preventDefault();
        curDot = document.querySelector('.dot_active');
        curDot.classList.remove('dot_active');
        
        curDot = this;
        this.classList.add('dot_active');

        curSlide.classList.remove('slide_active');
        curIndex = Number(this.getAttribute('data-index'));
        curSlide = slideContents[curIndex];
        curSlide.classList.add('slide_active');
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
      });
    });
  })();
</script>

