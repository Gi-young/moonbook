// PDJ.JS
let filepath = document.getElementById("filepath").value;

let url = contextPath + "/resources/ebook/" + filepath;

let pdfjsLib = window['pdfjs-dist/build/pdf'];
pdfjsLib.GlobalWorkerOptions.workerSrc = '//mozilla.github.io/pdf.js/build/pdf.worker.js';

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

console.log(section.clientHeight);

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

        // bindingWidth = leftCanvas.width / 7;
        // bindingXPos = leftCanvas.width - bindingWidth / 2.5;
        // $('#binding>img').css('width', bindingWidth + 'px')
        // $('#binding').css('left', bindingXPos + 'px');

        // $('#bookController').css('height', leftCanvas.height);
        // $('#bookController').css('width', window.innerWidth - leftCanvas.width * 2.2);

        // $('#container').css('height', (window.innerHeight + 5) + 'px');
    });

    document.getElementById('page-num').textContent = num;
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
    if (pageNum >= pdfDoc.numPages) {
        return;
    }
    pageNum+=2;
    queueRenderPage(pageNum);
}
document.getElementById('right-canvas').addEventListener('click',onNextPage);

pdfjsLib.getDocument(url).promise.then(function(pdfDoc_) {
    pdfDoc = pdfDoc_;
    document.getElementById('page-count').textContent = pdfDoc.numPages;

    renderLeftPage(pageNum);
    renderRightPage(pageNum+1);
});

window.addEventListener('resize',() => {
    renderLeftPage(pageNum);
    renderRightPage(pageNum+1);
});

// TESEERACT.JS
document.getElementById("pageToTextBtn").addEventListener("click", () => {

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
        document.getElementById("parsedTextData").innerText = text;
    });
});

// SPEECH SYNTHESIS UTTRERANCE
document.getElementById("textToSpeechBtn").addEventListener("click", () => {
    let targetText = document.getElementById("parsedTextData").innerText;
    console.log(targetText);
    const utterance = new SpeechSynthesisUtterance(targetText);
    utterance.rate = 1;
    window.speechSynthesis.speak(utterance);
});

// NORMAL JAVASCRIPT
function showBookMark() {
    document.getElementById("bookMark").style.display = "block";
    document.getElementById("textTurmoil").style.display = "none";
}

function showTesseract() {
    document.getElementById("bookMark").style.display = "none";
    document.getElementById("textTurmoil").style.display = "block";
}