let clubName = document.getElementById("clubName");

window.onload = function() {
    showMyClubList();

    getReadingRecord();
}

if (clubName != null) {
    clubName.addEventListener("keyup", (event) => {
        let clubName = event.target.value;
        let noticeBoard = document.querySelector("#noticeBoard");
        let clubNameCheck = document.querySelector("#noticeBoard>div.clubNameCheck");

        if (clubNameCheck !== null) {
            clubNameCheck.remove();
        }
        
        if (clubName.length > 15) {
            let div = document.createElement("div");
            div.innerText = "클럽 이름이 너무 길어요";
            div.classList.add("clubNameCheck");
            div.style.color = "red";
            noticeBoard.appendChild(div);
        } else {
            $.ajax({
                url: contextPath + "/ebook/checkClubName.do",
                type: "GET",
                data: {
                    clubName: clubName
                },
                success: data => {
                    let div = document.createElement("div");

                    if (data > 0) {
                        div.innerText = "중복된 클럽 이름이 존재합니다";
                        div.classList.add("clubNameCheck");
                        div.style.color = "red";
                    } else {
                        div.innerText = "사용 가능한 클럽 이름입니다";
                        div.classList.add("clubNameCheck");
                        div.style.color = "green";
                    }

                    noticeBoard.appendChild(div);
                }
            });
        }
    });
}

function createClub() {
    let clubName = document.getElementById("clubName").value;

    let clubNameCheck = document.querySelector("#noticeBoard>div.clubNameCheck");
    let check;
    if (clubNameCheck !== null) check = clubNameCheck.innerText;

    let noticeBoard = document.getElementById("noticeBoard");
    
    if(clubName !== "" && check !== undefined && check === "사용 가능한 클럽 이름입니다") {
        $.ajax({
            url: contextPath + "/ebook/createClub.do",
            type: "GET",
            data: {
                memberId: loginMemberId,
                clubName: clubName
            },
            success: data => {
                let div = document.createElement("div");

                if (data > 0) {
                    div.innerText = "[" + clubName + "] 생성에 성공하였습니다";
                    div.style.color = "green";
                    showMyClubList();
                } else {
                    div.innerText = "클럽 생성에 실패했습니다. 다시 시도해주세요";
                    div.style.color = "red";
                }

                noticeBoard.appendChild(div);
            }
        });
    } else {
        let div = document.createElement("div");

        div.innerText = "클럽 이름을 확인해주세요";
        div.style.color = "red";

        noticeBoard.appendChild(div);
    }
}

function showMyClubList() {
    $.ajax({
        url: contextPath + "/ebook/showMyClubList.do",
        type: "GET",
        data: {
            memberId: loginMemberId
        },
        success: data => {
            console.log(data);
            let selectClub = document.getElementById("selectClub");
            
            document.querySelectorAll("#selectClub>option").forEach((v, i) => {
                v.remove();
            });
            
            data.forEach((v, i) => {
                let option = document.createElement("option");
                option.innerText = v.CLUB_NAME;
                option.value = v.CLUB_NAME;
                
                selectClub.appendChild(option);
            });

            if (data.length === 0) {
                let totalMember = document.getElementById("totalMember");
                totalMember.innerText = 0;
            }

            showClubInfo();

            loadBoard();

            loadNextDebate();

            openSesame();
        }
    });
}

function showClubInfo() {
    let infoRows = document.querySelectorAll("div.club-box table tbody td");
    if (infoRows != null) {
        infoRows.forEach((v, i) => {
            v.remove();
        });
    }

    let selected;

    document.querySelectorAll("#selectClub>option").forEach((v, i) => {
        if (v.selected) {
            selected = v.value;
        }
    });

    console.log(selected);

    if (selected != null) {
        $.ajax({
            url: contextPath + "/ebook/showClubInfo.do",
            type: "GET",
            data: {
                clubName: selected
            },
            success: data => {
                console.log("showClubInfo");
                console.log(data);

                data.forEach((v, i) => {
                    if(v.LEADER === v.MEMBER_ID) {
                        appendDataIntoTable(v);
                    }
                });

                data.forEach((v, i) => {
                    if(v.LEADER !== v.MEMBER_ID) {
                        appendDataIntoTable(v);
                    }
                })

                let totalMember = document.getElementById("totalMember");
                totalMember.innerText = data.length;
                totalMember.style.textAlign = "center";
            }
        });
    }
}

let selectClub = document.getElementById("selectClub");

if (selectClub != null) {
    selectClub.addEventListener("change", showClubInfo);
    selectClub.addEventListener("change", loadBoard);
    selectClub.addEventListener("change", loadNextDebate);
    selectClub.addEventListener("change", openSesame);
}

function deleteClub() {
    let deleteFlag = window.confirm("정말 클럽을 해체하시겠습니까?");
    
    if (deleteFlag) {
        let selected;

        document.querySelectorAll("#selectClub>option").forEach((v, i) => {
            if (v.selected) {
                selected = v.value;
            }
        });
    
        $.ajax({
            url: contextPath + "/ebook/checkAuthority.do",
            type: "POST",
            data: {
                clubName: selected
            },
            success: data => {
                if (data.LEADER === loginMemberId) {
                    $.ajax({
                        url: contextPath + "/ebook/deleteClub.do",
                        type: "POST",
                        data: {
                            clubName: selected
                        },
                        success: data => {
                            console.log(data);
                            showMyClubList();
                        }
                    });
                } else {
                    alert("클럽의 리더만 팀을 해체할 수 있습니다");
                }
            }
        });
    }
}

function appendDataIntoTable(v) {
    let tr = document.createElement("tr");
                        
    let id = document.createElement("td");
    id.innerText = v.MEMBER_ID;
    let name = document.createElement("td");
    name.innerText = v.MEMBER_NAME;
    let gender = document.createElement("td");
    gender.innerText = v.MEMBER_GENDER;
    let email = document.createElement("td");
    email.innerText = v.MEMBER_EMAIL;
    let address = document.createElement("td");
    address.innerText = v.MEMBER_ADDRESS;
    let leader = document.createElement("td");
    if (v.LEADER === v.MEMBER_ID) leader.innerText = "O";
    else leader.innerText = "X";
    let deport = document.createElement("td");
    let deportBtn;
    if (v.LEADER !== v.MEMBER_ID) {
        deportBtn = document.createElement("button");
        deportBtn.innerText = "강퇴하기";
        deportBtn.addEventListener("click", () => {
            let confirm = window.confirm("정말 " + v.MEMBER_ID + " 회원을 추방하시겠습니까?");
            
            if (confirm) {
                if(v.LEADER !== loginMemberId) {
                    alert("클럽 리더에게만 추방 권한이 있습니다");
                } else {
                    $.ajax({
                        url: contextPath + "/ebook/deportMember.do",
                        type: "GET",
                        data: {
                            clubName: v.CLUB_NAME,
                            memberId: v.MEMBER_ID
                        },
                        success: data => {
                            showClubInfo();
                            sockWizard.send("deport," + v.MEMBER_ID + "," + v.CLUB_NAME);
                        }
                    });
                }
            }
        });
        deport.appendChild(deportBtn);
    }
    tr.appendChild(id);
    tr.appendChild(name);
    tr.appendChild(gender);
    tr.appendChild(email);
    tr.appendChild(address);
    tr.appendChild(leader);
    tr.appendChild(deport);

    document.querySelector("div.club-box table tbody").appendChild(tr);
}

let searchClubName = document.getElementById("searchClubName");

if (searchClubName != null) {
    searchClubName.addEventListener("keyup", (event) => {
        let clubName = event.target.value;
        let noticeBoard = document.getElementById("noticeBoard");
        let checkJoin = document.querySelector("#noticeBoard>div.checkJoin");

        if (checkJoin !== null) {
            checkJoin.remove();
        }

        $.ajax({
            url: contextPath + "/ebook/checkClubName.do",
            type: "GET",
            data: {
                clubName: clubName
            },
            success: data => {
                console.log(data);

                if (data > 0) {
                    let joinedFlag = false;

                    $.ajax({
                        url: contextPath + "/ebook/showClubInfo.do",
                        type: "POST",
                        data: {
                            clubName: clubName
                        },
                        success: data => {
                            let div = document.createElement("div");
                            div.classList.add("checkJoin");

                            data.forEach((v, i) =>{
                                if (v.LEADER == loginMemberId || v.MEMBER_ID == loginMemberId) {
                                    console.log("testFlag");
                                    joinedFlag = true;
                                }
                            });

                            if (joinedFlag) {
                                div.innerText = "이미 가입한 클럽입니다";
                                div.style.color = "red";
                            } else {
                                div.innerText = "존재하는 클럽입니다";
                                div.style.color = "green";
                            }

                            noticeBoard.appendChild(div);
                        }
                    });
                } else {
                    let div = document.createElement("div");
                    div.classList.add("checkJoin");
                    div.innerText = "존재하지 않는 클럽입니다";
                    div.style.color = "red";

                    noticeBoard.appendChild(div);
                }
            }
        });
    });
}

function joinClub() {
    let noticeBoard = document.getElementById("noticeBoard");
    let searchClubName = document.getElementById("searchClubName").value;
    let checkJoin = document.querySelector("#noticeBoard>div.checkJoin");
    let div = document.createElement("div");

    if (checkJoin !== null && checkJoin.innerText !== "존재하는 클럽입니다") {
        div.innerText = "클럽 이름을 다시 한 번 확인해주세요";
        div.style.color = "red";
    } else {
        sockWizard.send("join," + loginMemberId + "," + searchClubName);

        div.innerText = "가입 신청에 성공하였습니다";
        div.style.color = "green";
    }

    noticeBoard.appendChild(div);
}

function getReadingRecord() {
    let totalReadingTime = document.getElementById("totalReadingTime");
    let totalReadingPage = document.getElementById("totalReadingPage");

    $.ajax({
        url: contextPath + "/ebook/getReadingRecord.do",
        type: "GET",
        data: {
            loginMemberId: loginMemberId
        },
        success: data => {
            console.log(data);

            totalReadingTime.innerText = data.TOTAL_READ_TIME_IN_MINUTES;
            totalReadingPage.innerText = data.TOTAL_READ_PAGE;
        }
    });
}

function openWriteBoard() {
    let selectClub = document.getElementById("selectClub").value;
    let boardType = document.getElementById("boardType").value;

    let clubName;

    if (boardType === "club") {
        clubName = selectClub;
    } else {
        clubName = "_recruit";
    }

    let windowWidth = window.screen.width;
    let windowHeight = window.screen.height;
    let width = 400;
    let height = 300;

    let status = "left = " + (windowWidth - width) / 2 + ", top = " + (windowHeight - height) / 2 + ", width = " + width + ", height = " + height;

    window.open(contextPath + "/ebook/openWriteBoard.do?clubName=" + clubName, "writeBoard", status);

}

function loadBoard() {
    let selectClub = document.getElementById("selectClub").value;
    let boardType = document.getElementById("boardType").value;
    let tbody = document.querySelector("div.club-board table tbody");

    console.log(selectClub);
    console.log(boardType);
    console.log(tbody);

    if (selectClub !== "") {
        if (boardType === "club") {
            $.ajax({
                url: contextPath + "/ebook/loadBoard.do",
                type: "POST",
                data: {
                    clubName: selectClub
                },
                success: data => {
                    console.log(data);

                    for(let i = 0; i < tbody.children.length; i ++) {
                        tbody.children[i].remove();
                    }

                    data.forEach((v, i) => {
                        let tr = document.createElement("tr");
                        tr.classList.add("append-tr");

                        tr.addEventListener("click", () => {
                            let contentBox = document.getElementById("contentBox");
                            
                            for (let i = 0; i < contentBox.children.length; i ++) {
                                contentBox.children[i].remove();
                            }
                            
                            let p = document.createElement("p");
                            p.innerText = v.CONTENT;

                            contentBox.appendChild(p);

                            $.ajax({
                                url: contextPath + "/ebook/addBoardVisit.do",
                                type: "GET",
                                data: {
                                    boardNo: v.BOARD_NO
                                },
                                success: data => {
                                    console.log(data);

                                    if (data > 0) {
                                        loadBoard();
                                    }
                                }
                            });
                        });

                        let boardNo = document.createElement("td");
                        boardNo.innerText = v.BOARD_NO;

                        let writer = document.createElement("td");
                        writer.innerText = v.TITLE;

                        let content = document.createElement("td");
                        content.innerText = v.WRITER;

                        let boardDate = document.createElement("td");
                        let d = new Date(v.BOARD_DATE);
                        boardDate.innerText = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();

                        let visit = document.createElement("td");
                        visit.innerText = v.VISIT;

                        tr.appendChild(boardNo);
                        tr.appendChild(writer);
                        tr.appendChild(content);
                        tr.appendChild(boardDate);
                        tr.appendChild(visit);

                        tbody.appendChild(tr);
                    });
                }
            });
        } else {
            $.ajax({
                url: contextPath + "/ebook/loadBoard.do",
                type: "POST",
                data: {
                    clubName: boardType
                },
                success: data => {
                    console.log(data);

                    for(let i = 0; i < tbody.children.length; i ++) {
                        tbody.children[i].remove();
                    }

                    data.forEach((v, i) => {
                        let tr = document.createElement("tr");
                        tr.classList.add("append-tr");

                        tr.addEventListener("click", () => {
                            let contentBox = document.getElementById("contentBox");
                            
                            for (let i = 0; i < contentBox.children.length; i ++) {
                                contentBox.children[i].remove();
                            }
                            
                            let p = document.createElement("p");
                            p.innerText = v.CONTENT;

                            contentBox.appendChild(p);

                            $.ajax({
                                url: contextPath + "/ebook/addBoardVisit.do",
                                type: "GET",
                                data: {
                                    boardNo: v.BOARD_NO
                                },
                                success: data => {
                                    console.log(data);

                                    if (data > 0) {
                                        loadBoard();
                                    }
                                }
                            });
                        });

                        let boardNo = document.createElement("td");
                        boardNo.innerText = v.BOARD_NO;

                        let writer = document.createElement("td");
                        writer.innerText = v.TITLE;

                        let content = document.createElement("td");
                        content.innerText = v.WRITER;

                        let boardDate = document.createElement("td");
                        let d = new Date(v.BOARD_DATE);
                        boardDate.innerText = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();

                        let visit = document.createElement("td");
                        visit.innerText = v.VISIT;

                        tr.appendChild(boardNo);
                        tr.appendChild(writer);
                        tr.appendChild(content);
                        tr.appendChild(boardDate);
                        tr.appendChild(visit);

                        tbody.appendChild(tr);
                    });
                }
            })
        }
    }
}

let boardType = document.getElementById("boardType");

if (boardType !== null) {
    boardType.addEventListener("change", () => {
        loadBoard();
    });
}

function designateNextDate() {
    let selectClub = document.getElementById("selectClub").value;
    let nextDate = document.getElementById("nextDate").value;
    let nextTime = document.getElementById("nextTime").value;

    let dateArr = nextDate.split("-");
    let timeArr = nextTime.split(":");

    let next = new Date(Number(dateArr[0]), Number(dateArr[1]) - 1, Number(dateArr[2]), Number(timeArr[0]), Number(timeArr[1]), 0).getTime();
    let today = Date.now();

    if (nextDate !== "" && nextTime !== "") {
        $.ajax({
            url: contextPath + "/ebook/nextDate.do",
            type: "GET",
            data: {
                clubName: selectClub,
                nextTime: next
            },
            success: data => {
                openSesame();
            }
        });
    } else {
        alert("날짜와 시간을 모두 입력해주세요");
    }
}

function designateNextEbook() {
    let selectClub = document.getElementById("selectClub").value;
    let bindNo = document.getElementById("bindNo").value;
    let coverImgBox = document.querySelector("div.cover-img-box");

    console.log("bindNo : " + bindNo);
    
    if (selectClub !== "" && bindNo !== "") {
        $.ajax({
            url: contextPath + "/ebook/checkBindNo.do",
            type: "GET",
            data: {
                bindNo: bindNo
            },
            success: data => {
                console.log("checkBindNo");
                console.log(data);

                if (data !== null) {
                    $.ajax({
                        url: contextPath + "/ebook/nextEbook.do",
                        type: "GET",
                        data: {
                            clubName: selectClub,
                            bindNo: bindNo
                        },
                        success: data2 => {
                            if (data2 > 0) {
                                console.log("coverImgBox.children");
                                console.log(coverImgBox.children);

                                let repeatNum = coverImgBox.children.length;

                                console.log(repeatNum);

                                for (let i = 0; i < repeatNum; i ++) {
                                    coverImgBox.lastElementChild.remove();
                                }

                                let img = document.createElement("img");
                                img.src = data.IMAGE;

                                let title =document.createElement("div");
                                title.classList.add("next-ebook-title");
                                title.innerText = data.TITLE.split("(")[0];

                                coverImgBox.appendChild(img);
                                coverImgBox.appendChild(title);
                            } else {
                                alert("다음 토론의 책 지정에 실패하였습니다. 다시 시도해주세요");
                            }
                        }
                    });
                } else {
                    alert("지정하신 일련번호에 해당하는 e북이 없습니다");
                }
            }
        });
    } else {
        alert("클럽과 일련번호를 모두 지정해주세요");
    }
}

function loadNextDebate() {
    let selectClub = document.getElementById("selectClub").value;

    let bindNo = document.getElementById("bindNo");
    let coverImgBox = document.querySelector("div.cover-img-box");

    let nextDate = document.getElementById("nextDate");
    let nextTime = document.getElementById("nextTime");

    $.ajax({
        url: contextPath + "/ebook/loadNextDebate.do",
        type: "GET",
        data: {
            clubName: selectClub
        },
        success: data => {
            console.log("data");
            console.log(data);
            console.log(data.DEBATE_DATE);
            console.log(data.EBOOK_NO);

            if (data.DEBATE_DATE !== undefined) {
                let next = new Date(data.DEBATE_DATE);

                let year = next.getFullYear();
                let month = next.getMonth() + 1;
                if (month >= 1 && month <= 9) month = "0" + month;

                let date = next.getDate();
                if (date >= 1 && date <= 9) date = "0" + date;

                let hours = next.getHours();
                if (hours >= 1 && hours <= 9) hours = "0" + hours;

                let minutes = next.getMinutes();
                if (minutes >= 1 && minutes <= 9) minutes = "0" + minutes;

                nextDate.value = year + "-" + month + "-" + date;

                nextTime.value = hours + ":" + minutes;
            } else {
                nextDate.value = "";
                nextTime.value = "";
            }

            if (data.EBOOK_NO !== undefined) {
                bindNo.value = data.EBOOK_NO;

                $.ajax({
                    url: contextPath + "/ebook/getEbook.do",
                    type: "GET",
                    data: {
                        bindNo: data.EBOOK_NO
                    },
                    success: data2 => {
                        let repeatNum = coverImgBox.children.length;

                        for (let i = 0; i < repeatNum; i ++) {
                            coverImgBox.lastElementChild.remove();
                        }

                        let img = document.createElement("img");
                        img.src = data2.IMAGE;

                        let title = document.createElement("div");
                        title.classList.add("next-ebook-title");
                        title.innerText = data2.TITLE;

                        coverImgBox.appendChild(img);
                        coverImgBox.appendChild(title);
                    }
                });
            } else {
                bindNo.value = "";

                let repeatNum = coverImgBox.children.length;

                for (let i = 0; i < repeatNum; i ++) {
                    coverImgBox.lastElementChild.remove();
                }

                let p = document.createElement("p");
                p.innerText = "토론할 책을 지정해주세요";

                coverImgBox.appendChild(p);
            }
        }
    });
}

let interval;

function openSesame() {
    let selectClub = document.getElementById("selectClub").value;
    let debateText = document.getElementById("debateText");
    let debateSubmit = document.getElementById("debateSubmit");
    let debateEnd = document.getElementById("debateEnd");

    let debateBox = document.querySelector("div.debate-box");

    let remaining = document.getElementById("remaining");
    
    $.ajax({
        url: contextPath + "/ebook/loadNextDebate.do",
        type: "GET",
        data: {
            clubName: selectClub
        },
        success: data => {
            console.log("test");
            console.log(data.DEBATE_DATE);

            if (data.DEBATE_DATE === undefined) {
                console.log("in if");

                debateText.readOnly = true;
                debateSubmit.disabled = true;
                debateEnd.disabled = true;

                console.dir(debateText);
                console.log(debateText);

                remaining.style.display = "block";

                debateBox.style.opacity = 0.2;

                if (interval !== undefined) clearInterval(interval);
                remaining.innerText = "책을 읽었으면 토론을!! 다음 날짜를 지정해주세요";
            } else if (Date.now() < data.DEBATE_DATE) {
                debateText.readOnly = true;
                debateSubmit.disabled = true;
                debateEnd.disabled = true;

                remaining.style.display = "block";

                debateBox.style.opacity = 0.2;

                if (interval !== undefined) clearInterval(interval);
                remainTime(data.DEBATE_DATE);
                interval = window.setInterval(function () {remainTime(data.DEBATE_DATE)}, 1000);
            } else {
                debateText.readOnly = false;
                debateSubmit.disabled = false;
                debateEnd.disabled = false;

                if (interval !== undefined) clearInterval(interval);
                remaining.style.display = "none";
                
                debateBox.style.opacity = 1;
            }
        }
    });
}

function remainTime(time) {
    let remaining = document.getElementById("remaining");

    let remainingTime = time - Date.now();

    let date = parseInt(remainingTime / (1000 * 60 * 60 * 24));

    let hours = parseInt((remainingTime - date * (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));

    let minutes = parseInt((remainingTime - date * (1000 * 60 * 60 * 24) - hours * (1000 * 60 * 60)) / (1000 * 60));

    let seconds = parseInt((remainingTime - date * (1000 * 60 * 60 * 24) - hours * (1000 * 60 * 60) - minutes * (1000 * 60)) / (1000));

    console.log(date);
    console.log(hours);
    console.log(minutes);
    console.log(seconds);

    remaining.innerText = "남은 시간 : " + date + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
}

document.getElementById("debateEnd").addEventListener("click", () => {
    let selectClub = document.getElementById("selectClub").value;

    $.ajax({
        url: contextPath + "/ebook/debateEnd.do",
        type: "GET",
        data: {
            clubName: selectClub
        },
        success: data => {
            openSesame();
        }
    });
});