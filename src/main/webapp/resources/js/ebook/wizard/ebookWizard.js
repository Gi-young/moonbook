let contextPath = $('#contextPath').val();

document.getElementById('readBookBtn').addEventListener('click', () => {
    location.assign(contextPath + '/ebook/pageEbookReader.do');
});