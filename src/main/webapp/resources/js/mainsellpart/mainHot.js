(function () {
const slideList = document.querySelector('.hotslide_list'); // Slide parent dom
const slideContents = document.querySelectorAll('.hotslide_content'); // each slide dom
const slideBtnNext = document.querySelector('.hotslide_btn_next'); // next button
const slideBtnPrev = document.querySelector('.hotslide_btn_prev'); // prev button
const slideLen = slideContents.length; // slide length
const pagination = document.querySelector('.hotslide_pagination');

const slideWidth = 817; // slide width
const slideSpeed = 300; // slide speed
const startNum = 0; // initial slide index (0 ~ 4)
slideList.style.width = slideWidth * (slideLen + 2) + "px";
// Copy first and last slide
let firstChild = slideList.firstElementChild;
let lastChild = slideList.lastElementChild;
let clonedFirst = firstChild.cloneNode(true);
let clonedLast = lastChild.cloneNode(true);
// Add copied Slides
slideList.appendChild(clonedFirst);
slideList.insertBefore(clonedLast, slideList.firstElementChild);
slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";
let curIndex = startNum; // current slide index (except copied slide)
let curSlide = slideContents[curIndex]; // current slide dom
curSlide.classList.add('slide_active');
let pageChild = '';
for (var i = 0; i < slideLen; i++) {
pageChild += '<div class="bannerbtn dot';
pageChild += (i === startNum) ? ' dot_active' : '';
pageChild += '" data-index="' + i + '"><a href="#"></a></div>';
}
pagination.innerHTML = pageChild;
const pageDots = document.querySelectorAll('.dot'); // each dot from pagination


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
curSlide = slideContents[++curIndex];
curSlide.classList.add('slide_active');
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
curSlide = slideContents[--curIndex];
curSlide.classList.add('slide_active');
});



/** Pagination Button Event */
let curDot;
Array.prototype.forEach.call(pageDots, function (dot, i) {
dot.addEventListener('mouseover', function (e) {
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