(function slideTest() {
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
    })
})();
