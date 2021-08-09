// PDJ.JS
let bindNo = Number(document.getElementById("bindNo").value);
let filepath = document.getElementById("filepath").value;

let url = contextPath + "/resources/ebook/" + filepath;

let pdfjsLib = window['pdfjs-dist/build/pdf'];
pdfjsLib.GlobalWorkerOptions.workerSrc = '//mozilla.github.io/pdf.js/build/pdf.worker.js';

let book = document.getElementById("book");
let moveToPage = document.getElementById("moveToPage");
let moveToPageBtn = document.getElementById("moveToPageBtn");
let markList = document.getElementById("markList");

let pageFlippingSound = new Audio(contextPath + '/resources/audio/ebook/pageFlipping.wav');
pageFlippingSound.volume = 0.5;

let pdfDoc = null;
let pageNum = 1;
let pageRendering = false;
let pageNumPending = null;
let leftCanvas = document.getElementById('left-canvas');
let rightCanvas = document.getElementById('right-canvas');
let leftCtx = leftCanvas.getContext('2d');
let rightCtx = rightCanvas.getContext('2d');

let section = document.getElementsByTagName("section")[0];

let autoplay = document.getElementById("autoplay").value;
let grantAutoplay = document.getElementById("grantAutoplay");
let musicTitleArr = new Array();
let musicArr = new Array();
let musicTitle = document.querySelector("span.music-title");
let musicController = document.getElementById("musicController");

console.log(section.clientHeight);

console.log("autoplay : " + autoplay);

window.onload = function() {
    playMusic();

    if (autoplay === "false") {
        grantAutoplay.checked = true;
    } else {
        grantAutoplay.checked = false;
    }

    getReadPage();

    getReadTime();

    //loadBookmarkList();
}

function renderLeftPage(num) {
    pageRendering = true;

    pdfDoc.getPage(num).then(function(page) {
        let desiredHeight = section.clientHeight - 20;
        let viewport = page.getViewport({ scale: 1 });
        let scale = desiredHeight / viewport.height;
        let scaledViewport = page.getViewport({ scale: scale });
        leftCanvas.width = scaledViewport.width;
        leftCanvas.height = scaledViewport.height;

        let renderContext = {
            canvasContext: leftCtx,
            viewport: scaledViewport
        };
        let renderTask = page.render(renderContext);

        renderTask.promise.then(function() {
            pageRendering = false;
            if (pageNumPending !== null) {
                renderLeftPage(pageNumPending);
                pageNumPending = null;
            }
        });

        let bindingWidth = leftCanvas.width / 7;
        let bindingXPos = leftCanvas.width - bindingWidth / 2.6;
        let bindingYPos = leftCanvas.height / 40;

        $('#binding>img').css('width', bindingWidth + 'px')
        $('#binding').css('left', bindingXPos + 'px');
        $("#binding").css("top", bindingYPos);
    });

    moveToPage.value = num;
}

function renderRightPage(num) {
    pageRendering = true;

    pdfDoc.getPage(num).then(function(page) {
        let desiredHeight = section.clientHeight - 20;
        let viewport = page.getViewport({ scale: 1 });
        let scale = desiredHeight / viewport.height;
        let scaledViewport = page.getViewport({ scale: scale });
        rightCanvas.width = scaledViewport.width;
        rightCanvas.height = scaledViewport.height;

        let renderContext = {
            canvasContext: rightCtx,
            viewport: scaledViewport
        };
        let renderTask = page.render(renderContext);

        renderTask.promise.then(function() {
            pageRendering = false;
            if (pageNumPending !== null) {
                renderRightPage(pageNumPending);
                pageNumPending = null;
            }
        });
    });
}

function queueRenderPage(num) {
    pageFlippingSound.play();

    if (pageRendering) {
        pageNumPending = num;
    } else {
        renderLeftPage(num);
        num++;
        renderRightPage(num);
    }
}

function onPrevPage() {
    if (pageNum <= 1) {
        return;
    }
    pageNum-=2;
    queueRenderPage(pageNum);
}
document.getElementById('left-canvas').addEventListener('click', onPrevPage);


function onNextPage() {
    if (pageNum + 1 >= pdfDoc.numPages) {
        return;
    }

    countReadPage();

    pageNum+=2;
    queueRenderPage(pageNum);
}
document.getElementById('right-canvas').addEventListener('click',onNextPage);

if (moveToPageBtn !== null && moveToPage !== null) {
    moveToPageBtn.addEventListener("click", () => {
        let targetPageNum = Number(moveToPage.value);

        if (targetPageNum % 2 === 0) {
            pageNum = targetPageNum - 1;

            if (pageNum > pdfDoc.numPages) {
                alert("책의 총 페이지 수를 넘어섰습니다");
                return;
            }

            queueRenderPage(pageNum);
        } else if (targetPageNum % 2 === 1) {
            pageNum = targetPageNum;
            
            if (pageNum > pdfDoc.numPages) {
                alert("책의 총 페이지 수를 넘어섰습니다");
                return;
            }

            queueRenderPage(pageNum);
        } else {
            alert("1이상의 정수만 입력 가능합니다");
            return;
        }

    });
}

pdfjsLib.getDocument(url).promise.then(function(pdfDoc_) {
    pdfDoc = pdfDoc_;
    document.getElementById('page-count').textContent = pdfDoc.numPages;

    renderLeftPage(pageNum);
    renderRightPage(pageNum+1);

    window.setTimeout(function() {
        document.getElementById("bookLoaderBox").style.display = "none";
        book.style.opacity = 1;
    }, 1000);
});

window.addEventListener('resize',() => {
    renderLeftPage(pageNum);
    renderRightPage(pageNum+1);
});

// TESEERACT.JS
document.getElementById("pageToTextBtn").addEventListener("click", () => {

    let pseudoBox = document.getElementById("pseudoBox");
    let tesseractLoaderBox = document.getElementById("tesseractLoaderBox");
    let parsedTextData = document.getElementById("parsedTextData");

    tesseractLoaderBox.style.display = "flex";
    pseudoBox.style.opacity = 0.3;

    console.log("working OCR");

    let leftCanvas = document.getElementById("left-canvas");
    let rightCanvas = document.getElementById("right-canvas");

    let leftDataURI = leftCanvas.toDataURL();
    let rightDataURI = rightCanvas.toDataURL();

    let leftCanvasImg = document.getElementById("left-canvas-img");
    let rightCanvasImg = document.getElementById("right-canvas-img");

    leftCanvasImg.src = leftDataURI;
    rightCanvasImg.src = rightDataURI;

    leftCanvasImg.style.display = "none";
    rightCanvasImg.style.display = "none";

    Tesseract.recognize(
        leftDataURI,
        'kor',
        { logger: m => console.log(m) }
    ).then(({ data: { text }}) => {
        console.log(text);
        parsedTextData.innerText = "===== 왼쪽 페이지 =====\n\n" + text + "\n";
    });

    Tesseract.recognize(
        rightDataURI,
        'kor',
        { logger: m => console.log(m) }
    ).then(({ data: { text } }) => {
        tesseractLoaderBox.style.display = "none";
        pseudoBox.style.opacity = "1";

        console.log(text);
        parsedTextData.innerText += "===== 오른쪽 페이지 =====\n\n" + text;
    });
});

// SPEECH SYNTHESIS UTTRERANCE
let utterance;

document.getElementById("textToSpeechBtn").addEventListener("click", () => {
    let targetText = document.getElementById("parsedTextData").innerText;
    targetText = targetText.replace("===== 왼쪽 페이지 =====", "");
    targetText = targetText.replace("===== 오른쪽 페이지 =====", "");

    console.log(targetText);

    utterance = new SpeechSynthesisUtterance(targetText);
    utterance.rate = 1;
    window.speechSynthesis.speak(utterance);
});

document.getElementById("stopSpeechBtn").addEventListener("click", () => {
    if (utterance !== undefined) {
        window.speechSynthesis.cancel(utterance);
    }
});

// NORMAL JAVASCRIPT
function showBookMark() {
    document.getElementById("bookMark").style.display = "flex";
    document.getElementById("textTurmoil").style.display = "none";
}

function showTesseract() {
    document.getElementById("bookMark").style.display = "none";
    document.getElementById("textTurmoil").style.display = "flex";
}

function playMusic() {

    $.ajax({
        url: contextPath + "/ebook/loadMusic.do",
        type: "GET",
        success: data => {
            console.log(data);

            data.forEach((v, i) => {
                musicTitleArr.push(v.TITLE);
                musicArr.push(new Audio(contextPath + "/resources/audio/ebook/randomClassicalMusic/" + v.FILEPATH));
            });

            if (autoplay !== "false") {
                musicArr[0].play();
            }
            musicTitle.innerText = musicTitleArr[0];
        
            let icon = document.createElement("i");
            icon.classList.add("fas");
            
            if (musicArr[0].paused) {
                icon.classList.add("fa-play");
            } else {
                icon.classList.add("fa-pause");
            }

            icon.addEventListener("click", (event) => {
                let index = musicTitleArr.indexOf(musicTitle.innerText);

                if (event.target.classList.contains("fa-play")) {
                    musicArr[index].play();
                    
                    event.target.classList.remove("fa-play");
                    event.target.classList.add("fa-pause");
                } else {
                    musicArr[index].pause();
                    
                    event.target.classList.remove("fa-pause");
                    event.target.classList.add("fa-play");
                }
            });

            musicController.prepend(icon);

            musicArr.forEach((v, i) => {
                v.addEventListener("ended", () => {
                    if (i !== musicArr.length - 1) {
                        musicArr[i + 1].play();
                        musicTitle.innerText = musicTitleArr[i + 1];
                    } else {
                        musicArr[0].play();
                        musicTitle.innerText = musicTitleArr[0];
                    }
                });
            });
        }
    });
}

let backward = document.getElementById("backward");
let forward = document.getElementById("forward");

backward.addEventListener("click", () => {
    let index = musicTitleArr.indexOf(musicTitle.innerText);
    
    musicArr[index].pause();
    musicArr[index].currentTime = 0;

    if (index !== 0) {
        musicArr[index - 1].play();
        musicTitle.innerText = musicTitleArr[index - 1];
    } else {
        musicArr[musicArr.length - 1].play();
        musicTitle.innerText = musicTitleArr[musicArr.length - 1];
    }
});

forward.addEventListener("click", () => {
    let index = musicTitleArr.indexOf(musicTitle.innerText);

    musicArr[index].pause();
    musicArr[index].currentTime = 0;

    if (index !== musicArr.length - 1) {
        musicArr[index + 1].play();
        musicTitle.innerText = musicTitleArr[index + 1];
    } else {
        musicArr[0].play();
        musicTitle.innerText = musicTitleArr[0];
    }
});

grantAutoplay.addEventListener("change", (event) => {
    if (event.target.checked) {
        setAutoplay("false");
    } else {
        setAutoplay("true");
    }
});

function setAutoplay(flag) {
    $.ajax({
        url: contextPath + "/ebook/setAutoplay.do",
        type: "GET",
        data: {
            setValue: flag
        }
    });
}

function countReadPage() {
    $.ajax({
        url: contextPath + "/ebook/countReadPage.do",
        type: "GET",
        data: {
            loginMemberId: loginMemberId
        },
        success: data => {
            console.log(data);

            getReadPage();
        }
    });
}

function getReadPage() {
    $.ajax({
        url: contextPath + "/ebook/getReadPage.do",
        type: "GET",
        data: {
            loginMemberId: loginMemberId
        },
        success: data => {
            console.log(data);

            document.getElementById("readPage").innerText = data;
        }
    });
}

function getReadTime() {
    $.ajax({
        url: contextPath + "/ebook/getReadTime.do",
        type: "GET",
        data: {
            loginMemberId: loginMemberId
        },
        success: data => {
            console.log(data);

            document.getElementById("readTime").innerText = data;
        }
    });
}

function countReadTime() {
    $.ajax({
        url: contextPath + "/ebook/countReadTime.do",
        type: "GET",
        data: {
            loginMemberId: loginMemberId
        },
        success: data => {
            console.log(data);

            getReadTime();
        }
    });
}

window.setInterval(countReadTime, 1000 * 60);

function getBasicBookMarks() {
    return new Promise((resolve, reject) => {

    });
}

function createCustomBookMark() {
    let bookMarkName = document.getElementById("bookMarkName").value;
    let targetPage = document.getElementById("bookMarkTargetPage").value;
    
    $.ajax({
        url: contextPath + "/ebook/createCustomBookMark.do",
        type: "GET",
        data: {
            loginMemberId: loginMemberId,
            bindNo: bindNo,
            bookMarkName: bookMarkName,
            targetPage: targetPage
        },
        success: data => {
            console.log(data);

            loadBookmarkList();
        }
    });
}

// function loadBookmarkList() {
//     return new Promise((resolve, reject) => {
//         $.ajax({
//             url: contextPath + "/ebook/getBasicBookMarks.do",
//             type: "GET",
//             data: {
//                 bindNo: bindNo
//             },
//             success: data => {
//                 console.log(data);

//                 let ul = document.createElement("ul");
                
//                 data.forEach((v, i) => {
//                     let li = document.createElement("li");
//                     let textNode = document.createTextNode(" " + v.BOOKMARK_NAME + "..." + v.PAGE);

//                     li.addEventListener("click", (event) => {
//                         let rowUl = event.target.children[0];

//                         console.log(rowUl.style.display);

//                         if (rowUl.style.display !== "block") {
//                             rowUl.style.display = "block";
//                         } else {
//                             rowUl.style.display = "none";
//                         }
//                     });

//                     let lowRankUl = document.createElement("ul");
//                     let lowRankLi = document.createElement("li");
//                     lowRankUl.classList.add("lowRankUl");
//                     lowRankLi.innerText = "하위 북마크 요소가 아직 없습니다";
                    
//                     lowRankUl.appendChild(lowRankLi);

//                     li.appendChild(textNode);
//                     li.appendChild(lowRankUl);

//                     ul.appendChild(li);
//                 });

//                 markList.appendChild(ul);
//             }
//         });
//     });
// }

// function getCustomBookmarks() {
//     $.ajax({
//         url: contextPath + "/ebook/getCustomBookmark.do",
//         type: "GET",
//         data: {
//             loginMemberId: loginMemberId,
//             bindNo: bindNo
//         },
//         success: data => {
//             console.log(data);

//             let basicMarks = document.querySelectorAll("#markList>ul>li");

//             for (let i = 0; i < basicMarks.length; i ++) {
                
//             }






//             data.forEach((v, i) => {
//                 let customBookmark = document.createElement("li");
//                 let customTextNode = document.createTextNode(w.BOOKMARK_NAME + "..." + w.PAGE);
//                 let openBtn = document.createElement("button");
//                 let deleteBtn = document.createElement("button");

//                 openBtn.innerText = "찾기";
//                 deleteBtn.innerText = "삭제";

//                 customBookmark.appendChild(customTextNode);
//                 customBookmark.appendChild(openBtn);
//                 customBookmark.appendChild(deleteBtn);

//                 if (i !== data.length - 1) {
//                     if (data[i].PAGE <= w.PAGE < data[i + 1].PAGE) {
//                         if (lowRankUl.children[0].innerText === "하위 북마크 요소가 아직 없습니다") {
//                             lowRankUl.children[0].remove();
//                         }
//                         lowRankUl.appendChild(customBookmark);
//                     }
//                 } else {
//                     if (v.PAGE <= w.PAGE) {
//                         if (lowRankUl.children[0].innerText === "하위 북마크 요소가 아직 없습니다") {
//                             lowRankUl.children[0].remove();
//                         }
//                         lowRankUl.appendChild(customBookmark);
//                     }
//                 }
//             });
//         }
//     });
// }