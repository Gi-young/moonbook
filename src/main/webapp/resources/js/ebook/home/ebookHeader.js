const contextPath = $("#contextPath").val();

function openEbookWizard() {
	let windowHeight = window.screen.height;
    let windowWidth = window.screen.width;
	let readerWidth = windowWidth * 0.9;
	let readerHeight = windowHeight * 0.9;
    let url = contextPath + "/ebook/openEbookWizard.do";
    let status = "width = "+ readerWidth + ", height = " + readerHeight;
    var reader = window.open(url, "ebookReader", status);
	reader.moveTo((windowWidth - readerWidth) / 2, (windowHeight - readerHeight) / 2);
};