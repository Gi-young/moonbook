let contextPath = document.getElementById("contextPath").value;

let sock = new SockJS("http://localhost:9090" + contextPath + "/debate");

let debateBox = document.getElementById("debateBox");
let debateMessage = document.getElementById("debateMessage");

sock.onopen = (e) => {
    console.log(e);
}

sock.onmessage = (i) => {
    console.log(i);
    let messageFeed = document.createElement("div");
    let message = document.createTextNode(i.data);
    messageFeed.append(message);
    debateBox.append(messageFeed);
}

sock.onclose = (e) => {
    console.log(e);
}

document.getElementById("submitBtn").addEventListener("click", () => {
    console.log(debateMessage.value);
    sock.send(debateMessage.value);
});