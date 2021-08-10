let contextPath = document.getElementById("contextPath").value;
let loginMemberId = document.getElementById("loginMemberId").value;
let currentPageIndex = document.getElementById("currentPageIndex").value;

console.log(loginMemberId);
console.log(currentPageIndex);

document.querySelectorAll("header li").forEach((v, i) => {
    if (i === Number(currentPageIndex)) {
        v.classList.add("selectedBranch");
    } else if (Number(currentPageIndex) === 7 && i === 0) {
        v.classList.add("selectedBranch");
    }
});

let sockWizard = new SockJS("http://localhost:9090" + contextPath + "/wizard");

sockWizard.onopen = e => {
    console.log(e);
    
    loadMessage();

    sockWizard.send("tada," + loginMemberId);
}

sockWizard.onmessage = i => {
    console.log(i);

    let noticeBoard = document.getElementById("noticeBoard");
    let arr = i.data.split(",");

    if (arr[0] === "join") {
        let feed = document.createElement("div");
        feed.innerText = arr[1] + "님이 " + arr[2] + "의 멤버 가입을 신청하였습니다";
        
        let joinBtn = document.createElement("button");
        joinBtn.innerText = "승인";
        joinBtn.addEventListener("click", (event) => {
            $.ajax({
                url: contextPath + "/ebook/joinClub.do",
                type: "GET",
                data: {
                    memberId: arr[1],
                    clubName: arr[2]
                },
                success: data => {
                    if (data > 0) {
                        deleteMessage(i.data);

                        event.target.parentElement.remove();
                        
                        let noticeAlert = document.getElementById("noticeAlert");
                        noticeAlert.innerText = Number(noticeAlert.innerText) - 1;

                        showMyClubList();
                        
                        sockWizard.send("admit," + arr[1] + "," + arr[2]);
                    } else {
                        alert("이미 등록된 회원이거나 잘못된 방식으로 접근하셨습니다");
                    }
                }
            });
        });

        let refuseBtn = document.createElement("button");
        refuseBtn.innerText = "거부";
        refuseBtn.addEventListener("click", (event) => {
            deleteMessage(i.data);
            
            event.target.parentElement.remove();

            let noticeAlert = document.getElementById("noticeAlert");
            noticeAlert.innerText = Number(noticeAlert.innerText) - 1;
            
            sockWizard.send("reject," + arr[1] + "," + arr[2]);
        });
        
        feed.appendChild(joinBtn);
        feed.appendChild(refuseBtn);

        let appendFlag = true;

        if (noticeBoard != null) {
            let feeds = noticeBoard.children;

            for (let i = 0; i < feeds.length; i++) {
                if (feeds[i].innerText === feed.innerText) {
                    appendFlag = false;
                }
            }
    
            if (appendFlag) {
                let noticeAlert = document.getElementById("noticeAlert");
                noticeAlert.innerText = Number(noticeAlert.innerText) + 1;

                noticeBoard.appendChild(feed);
            }
        }
    }

    if (arr[0] === "tada") {
        let feed = document.createElement("div");
        feed.innerText = arr[1] + "님이 e북 마법사에 입장하였습니다";
        feed.style.color = "blue";

        let appendFlag = true;

        if (noticeBoard != null) {            
            let feeds = noticeBoard.children;

            for (let i = 0; i < feeds.length; i++) {
                if (feeds[i].innerText === feed.innerText) {
                    appendFlag = false;
                }
            }
    
            if (appendFlag) noticeBoard.appendChild(feed);
        }
    }

    if (arr[0] === "admit") {
        let feed = document.createElement("div");
        feed.innerText = "축하합니다! " + arr[2] + "에 성공적으로 가입되었습니다"
        feed.style.color = "blue";
        
        let confirmBtn = document.createElement("button");
        confirmBtn.innerText = "확인";
        confirmBtn.addEventListener("click", (event) => {
            deleteMessage(i.data);

            event.target.parentElement.remove();

            let noticeAlert = document.getElementById("noticeAlert");
            noticeAlert.innerText = Number(noticeAlert.innerText) - 1;

            showMyClubList();
        });

        feed.appendChild(confirmBtn);

        let appendFlag = true;

        if (noticeBoard != null) {
            let feeds = noticeBoard.children;

            for (let i = 0; i < feeds.length; i++) {
                if (feeds[i].innerText === feed.innerText) {
                    appendFlag = false;
                }
            }

            if (appendFlag) {
                let noticeAlert = document.getElementById("noticeAlert");
                noticeAlert.innerText = Number(noticeAlert.innerText) + 1;

                noticeBoard.appendChild(feed);
            }
        }
    }

    if (arr[0] === "reject") {
        let feed = document.createElement("div");
        feed.innerText = arr[2] + " 가입이 거부되었습니다";
        feed.style.color = "red";

        let confirmBtn = document.createElement("button");
        confirmBtn.innerText = "확인";
        confirmBtn.addEventListener("click", (event) => {
            deleteMessage(i.data);

            event.target.parentElement.remove();

            let noticeAlert = document.getElementById("noticeAlert");
            noticeAlert.innerText = Number(noticeAlert.innerText) - 1;
        });

        feed.appendChild(confirmBtn);

        let appendFlag = true;

        if (noticeBoard != null) {
            let feeds = noticeBoard.children;

            for (let i = 0; i < feeds.length; i++) {
                if (feeds[i].innerText === feed.innerText) {
                    appendFlag = false;
                }
            }

            if (appendFlag) {
                let noticeAlert = document.getElementById("noticeAlert");
                noticeAlert.innerText = Number(noticeAlert.innerText)+ 1;

                noticeBoard.appendChild(feed);
            }
        }
    }

    if (arr[0] === "deport") {
        let feed = document.createElement("div");
        feed.innerText = arr[1] + "님이 " + arr[2] + "에서 추방되었습니다";
        feed.style.color = "red";

        let confirmBtn = document.createElement("button");
        confirmBtn.innerText = "확인";
        confirmBtn.addEventListener("click", (event) => {
            deleteMessage(i.data);

            event.target.parentElement.remove();

            let noticeAlert = document.getElementById("noticeAlert");
            noticeAlert.innerText = Number(noticeAlert.innerText) - 1;

            showMyClubList();
        });

        feed.appendChild(confirmBtn);

        let appendFlag = true;

        if (noticeBoard != null) {
            let feeds = noticeBoard.children;

            for (let i = 0; i < feeds.length; i++) {
                if (feeds[i].innerText === feed.innerText) {
                    appendFlag = false;
                }
            }

            if (appendFlag) {
                let noticeAlert = document.getElementById("noticeAlert");
                noticeAlert.innerText = Number(noticeAlert.innerText) + 1;

                noticeBoard.appendChild(feed);
            }
        }
    }
}

sockWizard.onclose = e => {
    console.log(e);
}

function saveMessage(message) {
    $.ajax({
        url: contextPath + "/ebook/saveMessage.do",
        type: "POST",
        data: {
            memberId: loginMemberId,
            message: message
        },
        success: data => {
            if (data > 0) {
                console.log("메시지 저장 성공");
            } else {
                console.log("메시지 저장 실패");
            }
        }
    });
}

function deleteMessage(message) {
    $.ajax({
        url: contextPath + "/ebook/deleteMessage.do",
        type: "POST",
        data: {
            memberId: loginMemberId,
            message: message
        },
        success: data => {
            if (data > 0) {
                console.log("메시지 삭제 성공");
            } else {
                console.log("메시지 삭제 실패");
            }
        }
    });
}

function loadMessage() {
    let noticeBoard = document.getElementById("noticeBoard");
    
    $.ajax({
        url: contextPath + "/ebook/loadMessage.do",
        type: "POST",
        data: {
            memberId: loginMemberId
        },
        success: data => {
            data.forEach((v, i) => {
                console.log("loadMessage");
                console.log(v);
                sockWizard.send(v.MESSAGE);
            });
        }
    });
}