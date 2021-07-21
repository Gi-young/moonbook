const contextPath = $("#contextPath").val();

function openEbookReader() {
	let windowHeight = window.screen.height;
    let windowWidth = window.screen.width;
    let url = contextPath + "/ebook/openEbookReader.do";
    let windowName = "ebookReader";
    let status = "width=" + windowWidth + ",height=" + windowHeight;
    var reader = window.open(url,windowName,status);
};

document.addEventListener('dblclick',function() {
    document.documentElement.requestFullscreen().catch(e => console.log(e));
});