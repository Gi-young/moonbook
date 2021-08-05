let clubName = document.getElementById("clubName");

window.onload = function() {
    showMyClubList();
}

if (clubName != null) {
    clubName.addEventListener("keyup", (event) => {
        let clubName = event.target.value;
        let checkClubName = document.querySelector("#checkClubName");

        checkClubName.style.fontSize = "13px";
        
        console.log(clubName.length);

        if (clubName.length > 15) {
            checkClubName.innerText = "클럽 이름이 너무 깁니다";
            checkClubName.style.color = "red";
            checkClubName.style.fontWeight = "bold";
        } else {
            $.ajax({
                url: contextPath + "/ebook/checkClubName.do",
                type: "GET",
                data: {
                    clubName: clubName
                },
                success: data => {
                    if (data > 0) {
                        checkClubName.innerText = "중복된 클럽 이름이 존재합니다";
                        checkClubName.style.color = "red";
                        checkClubName.style.fontWeight = "bold";
                    } else {
                        checkClubName.innerText = "사용 가능한 클럽 이름입니다";
                        checkClubName.style.color = "black";
                        checkClubName.style.fontWeight = "bold";
                    }
                }
            });
        }
    });
}

function createClub() {
    let clubName = document.getElementById("clubName").value;
    let check = document.getElementById("checkClubName").innerText;
    let createNotice = document.getElementById("createNotice");

    createNotice.style.fontSize = "13px";
    
    if(check === "사용 가능한 클럽 이름입니다") {
        $.ajax({
            url: contextPath + "/ebook/createClub.do",
            type: "GET",
            data: {
                memberId: loginMemberId,
                clubName: clubName
            },
            success: data => {
                console.log(data);
                if (data > 0) {
                    createNotice.innerText = clubName + "이(가) 생성되었습니다";
                    createNotice.style.color = "black";
                    createNotice.style.fontWeight = "bolder";
                    showMyClubList();
                } else {
                    createNotice.innerText = "클럽 생성에 실패했습니다. 다시 시도해주세요";
                    createNotice.style.color = "red";
                    createNotice.style.fontWeight = "normal";
                    createNotice.style.fontWeight = "bolder";
                }
            }
        });
    } else {
        createNotice.innerText = "클럽 이름을 확인해주세요";
        createNotice.style.color = "red";
        createNotice.style.fontWeight = "normal";
        createNotice.style.fontWeight = "bolder";
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
        let checkSearchClubName = document.getElementById("checkSearchClubName");
        checkSearchClubName.style.fontWeight = "bold";
        checkSearchClubName.style.fontSize = "13px";

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
                            data.forEach((v, i) =>{
                                console.log(v.LEADER);
                                console.log(v.MEMBER_ID);
                                console.log(loginMemberId);
                                if (v.LEADER == loginMemberId || v.MEMBER_ID == loginMemberId) {
                                    console.log("testFlag");
                                    joinedFlag = true;
                                }
                            });

                            if (joinedFlag) {
                                checkSearchClubName.innerText = "이미 가입한 클럽입니다";
                                checkSearchClubName.style.color = "red";
                            } else {
                                checkSearchClubName.innerText = "존재하는 클럽입니다";
                                checkSearchClubName.style.color = "black";
                            }
                        }
                    });
                } else {
                    checkSearchClubName.innerText = "존재하지 않는 클럽입니다";
                    checkSearchClubName.style.color = "red";
                }
            }
        });
    });
}

function joinClub() {
    let searchClubName = document.getElementById("searchClubName").value;
    let checkSearchClubName = document.getElementById("checkSearchClubName");
    let joinNotice = document.getElementById("joinNotice");
    joinNotice.style.fontWeight = "bold";
    joinNotice.style.fontSize = "13px";

    if (checkSearchClubName.innerText !== "존재하는 클럽입니다") {
        joinNotice.innerText = "클럽 이름을 다시 한 번 확인해주세요";
        joinNotice.style.color = "black";
    } else {
        sockWizard.send("join," + loginMemberId + "," + searchClubName);
        joinNotice.innerText = "가입 신청에 성공하였습니다";
        joinNotice.style.color = "black";
    }
}