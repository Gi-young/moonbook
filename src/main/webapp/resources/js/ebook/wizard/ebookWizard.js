let contextPath = $('#contextPath').val();

document.getElementById('readBookBtn').addEventListener('click', () => {
    location.assign(contextPath + '/ebook/pageEbookReader.do');
});

let sock = new SockJS("http://localhost:9090" + contextPath + "/wizard");

sock.onopen = e => {
    console.log(e);
}

sock.onmessage = i => {
    console.log(i);
}

sock.onclose = e => {
    console.log(e);
}