let sockDebate = new SockJS("http://localhost:9090" + contextPath + "/debate");

let debateBox = document.getElementById("debateBox");
let debateMessage = document.getElementById("debateMessage");

sockDebate.onopen = (e) => {
    console.log(e);
}

sockDebate.onmessage = (i) => {
    console.log(i);
    let messageFeed = document.createElement("div");
    let message = document.createTextNode(i.data);
    messageFeed.append(message);
    debateBox.append(messageFeed);
}

sockDebate.onclose = (e) => {
    console.log(e);
}

let submitBtn = document.getElementById("submitBtn");

if (submitBtn != null) {
    document.getElementById("submitBtn").addEventListener("click", () => {
        console.log(debateMessage.value);
        sockDebate.send(debateMessage.value);
    });
}