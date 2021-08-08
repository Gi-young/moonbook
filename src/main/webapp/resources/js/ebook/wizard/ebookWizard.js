let currentSort = "ALL";

let cPage = 2;

let pendingLoading = false;

let isFinalLoad = false;

window.onload = function() {
    getMyEbooks(1, 18);
    
    listMySorts();

    selectSort();
}

function getMyEbooks(cPage, numPerPage) {
    pendingLoading = true;
    
    loader();

    window.setTimeout(() => {
    $.ajax({
        url: contextPath + "/ebook/getMyEbooks.do",
        type: "GET",
        data: {
            memberId: loginMemberId,
            cPage: cPage,
            numPerPage: numPerPage
        },
        success: data => {
            console.log(data);

            if (data.length < 18) {
                isFinalLoad = true;
                document.getElementById("scrollIndicator").classList.add("display-none");
            }
            
            document.querySelector("div.loaderBox").remove();

            let pseudoBox = document.querySelector("div.pseudo-box");
            
            data.forEach((v, i) => {
                let ebookItem = document.createElement("div");
                let coverImg = document.createElement("img");
                let title = document.createElement("p");
                let checkbox = document.createElement("input");
                let embodyMarker = document.createElement("div");

                ebookItem.classList.add("ebookItem");
                coverImg.classList.add("coverImg");
                title.classList.add("title");
                embodyMarker.classList.add("embodyMarker");

                coverImg.addEventListener("click", (event) => {
                    let categoryCode = v.CATEGORY_CODE;

                    if (categoryCode !== "111111") {
                        event.preventDefault();
                        alert("해당 도서는 아직 e북으로 구현되지 않았습니다. 다른 도서를 선택해주세요");
                    } else {
                        location.assign(contextPath + "/ebook/pageEbookReader.do?bindNo=" + v.BIND_NO);
                    }
                });

                coverImg.src = v.IMAGE;

                if (v.TITLE.indexOf("(") != -1) {
                    let editedTitle = v.TITLE.substring(0, v.TITLE.indexOf("("));
                    title.innerText = editedTitle;
                } else {
                    title.innerText = v.TITLE;
                }

                checkbox.type = "checkbox";
                checkbox.value = v.BIND_NO;

                embodyMarker.innerText = "ebook 구현";
                
                ebookItem.appendChild(coverImg);
                ebookItem.appendChild(title);
                ebookItem.appendChild(checkbox);

                if (v.CATEGORY_CODE === "111111") {
                    ebookItem.appendChild(embodyMarker);
                }

                pseudoBox.appendChild(ebookItem);
            });

            pendingLoading = false;
        }
    })
    }, 1000);
}

let section = document.getElementsByTagName("section")[0];
let pseudoBox = document.querySelector("div.pseudo-box");

section.addEventListener("scroll", () => {
    let clientHeight = section.clientHeight;
    let scrollHeight = section.scrollHeight;
    let scrollTop = section.scrollTop;

    if (pendingLoading === false && !isFinalLoad) {
        if (pendingLoading === false && scrollTop > scrollHeight - clientHeight - 10) {
            if (currentSort === "ALL") {
                getMyEbooks(cPage, 18);
    
                cPage++;
            } else {
                changeBookshelf(cPage, 18, currentSort);

                cPage++;
            }
        }
    }
});

function loader() {
    let loaderBox = document.createElement("div");
    let loader = document.createElement("div");
    let message = document.createElement("span");

    loaderBox.classList.add("loaderBox");
    loader.classList.add("loader");
    message.classList.add("message");

    message.innerText = "잠시만 기다려주세요";

    loaderBox.appendChild(loader);
    loaderBox.appendChild(message);

    pseudoBox.appendChild(loaderBox);
}

function createSort() {
    let sortName = document.getElementById("sortName").value.trim();

    if (sortName !== "") {
        $.ajax({
            url: contextPath + "/ebook/listMySorts.do",
            type: "GET",
            data: {
                memberId: loginMemberId
            },
            success: data => {
                console.log(data);
    
                let flag = true;

                data.forEach((v, i) => {
                    if (v === sortName) {
                        flag = false;
                    }
                });

                if (flag) {
                    $.ajax({
                        url: contextPath + "/ebook/createSort.do",
                        type: "GET",
                        data: {
                            memberId: loginMemberId,
                            sortName: sortName
                        },
                        success: data => {
                            console.log(data);
            
                            if (data > 0) {
                                listMySorts();

                                selectSort();
                            } else {
                                alert("분류 생성에 실패하였습니다. 다시 시도해주세요");
                            }
                        }
                    });
                } else {
                    alert("이미 존재하는 분류 이름입니다");
                }
            }
        });
    } else {
        alert("분류 이름을 입력해주세요");
    }
}

function listMySorts() {
    $.ajax({
        url: contextPath + "/ebook/listMySorts.do",
        type: "GET",
        data: {
            memberId: loginMemberId
        },
        success: data => {
            console.log(data);

            let sortList = document.getElementById("sortList");
            
            while (sortList.children.length > 1) {
                sortList.removeChild(sortList.lastChild);
            }

            $.ajax({
                url: contextPath + "/ebook/dataCountAll.do",
                type: "GET",
                data: {
                    memberId: loginMemberId
                },
                success: data => {
                    let listAll = sortList.children[0];

                    if (listAll.innerText.indexOf("[") !== -1) {
                        listAll.innerText = listAll.innerText.substring(0, listAll.innerText.indexOf("[")) + "[" + data + "]";
                    } else {
                        listAll.innerText += "[" + data + "]";
                    }
                }
            });

            data.forEach((v, i) => {
                if (v !== null) {
                    $.ajax({
                        url: contextPath + "/ebook/dataCountFromSort.do",
                        type: "GET",
                        data: {
                            memberId: loginMemberId,
                            sortName: v
                        },
                        success: data => {
                            console.log(data);

                            let li = document.createElement("li");
                            li.innerText = v + "[" + data + "]";

                            li.addEventListener("click", function() {
                                let pseudoBox = document.querySelector("div.pseudo-box");

                                while (pseudoBox.children.length > 0) {
                                    pseudoBox.removeChild(pseudoBox.lastChild);
                                }
                                
                                changeBookshelf(1, 18, v);

                                listMySorts();

                                selectSort();
                                
                                isFinalLoad = false;
                                document.getElementById("scrollIndicator").classList.remove("display-none");

                                cPage = 2;
                                currentSort = v;
                            });

                            sortList.appendChild(li);
                            let lists = sortList.children;

                            for (let i = 0; i < lists.length; i ++) {
                                if (currentSort === "ALL") {
                                    lists[0].classList.add("underline");
                                } else {
                                    if (lists[i].innerText.substring(0, lists[i].innerText.indexOf("[")) === currentSort) {
                                        lists[i].classList.add("underline");
                                    } else {
                                        lists[i].classList.remove("underline");
                                    }
                                }
                            }
                        }
                    });
                }
            });
        }
    });
}

function selectSort() {
    $.ajax({
        url: contextPath + "/ebook/listMySorts.do",
        type: "GET",
        data: {
            memberId: loginMemberId
        },
        success: data => {
            console.log(data);

            let selectSort = document.getElementById("selectSort");

            while (selectSort.children.length > 0) {
                console.log(selectSort.children.length);
                selectSort.removeChild(selectSort.lastChild);
            }

            data.forEach((v, i) => {
                if (v !== null) {
                    let option = document.createElement("option");
                    option.innerText = v;
                    option.value = v;

                    selectSort.appendChild(option);
                }
            });
        }
    });
}

function changeSort() {
    let selectedSort = document.getElementById("selectSort").value;

    let selectedEbookArr = new Array();

    let checkboxes = document.querySelectorAll("section input[type=checkbox]");

    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedEbookArr.push(checkboxes[i].value);
        }
    }

    if (selectedEbookArr.length !== 0) {
        $.ajax({
            url: contextPath + "/ebook/changeSort.do",
            type: "GET",
            data: {
                memberId: loginMemberId,
                selectedSort: selectedSort,
                selectedEbookArr: selectedEbookArr.toString()
            },
            success: data => {
                if (data > 0) {
                    alert(data + "개의 e북이 [" + selectedSort + "]분류로 이동하였습니다");

                    listMySorts();

                    selectSort();

                    if (currentSort !== "ALL") {
                        for (let i = 0; i < checkboxes.length; i++) {
                            if (checkboxes[i].checked) {
                                checkboxes[i].parentElement.remove();
                            }
                        }
                    }
                } else {
                    alert("e북 이동에 실패하였습니다");
                }
            }
        });
    } else {
        alert("대상 e북을 하나 이상 선택해주세요");
    }
}

function deleteSort() {
    let selectedSort = document.getElementById("selectSort").value;

    $.ajax({
        url: contextPath + "/ebook/deleteSort.do",
        type: "GET",
        data: {
            memberId: loginMemberId,
            selectedSort: selectedSort
        },
        success: data => {
            if (data > 0) {
                listMySorts();

                selectSort();
            } else {
                alert("분류 삭제에 실패하였습니다. 다시 시도해주세요");
            }
        }
    });
}

let sortAll = document.querySelector("#sortList>li");

if (sortAll != null) {
    sortAll.addEventListener("click", function() {
        let pseudoBox = document.querySelector("div.pseudo-box");

        while (pseudoBox.children.length > 0) {
            pseudoBox.removeChild(pseudoBox.lastChild);
        }
        
        getMyEbooks(1, 18);

        listMySorts();

        selectSort();

        cPage = 2;

        isFinalLoad = false;
        document.getElementById("scrollIndicator").classList.remove("display-none");

        currentSort = "ALL";
    });
}

function changeBookshelf(cPage, numPerPage, sortName) {
    pendingLoading = true;

    loader();
    
    window.setTimeout(() => {
        $.ajax({
            url: contextPath + "/ebook/changeBookshelf.do",
            type: "GET",
            data: {
                memberId: loginMemberId,
                sortName: sortName,
                cPage: cPage,
                numPerPage: numPerPage
            },
            success: data => {
                console.log(data);

                if (data.length < 18) {
                    isFinalLoad = true;
                    document.getElementById("scrollIndicator").classList.add("display-none");
                }

                document.querySelector("div.loaderBox").remove();

                let pseudoBox = document.querySelector("div.pseudo-box");
                
                data.forEach((v, i) => {
                    let ebookItem = document.createElement("div");
                    let coverImg = document.createElement("img");
                    let title = document.createElement("p");
                    let checkbox = document.createElement("input");

                    ebookItem.classList.add("ebookItem");
                    coverImg.classList.add("coverImg");
                    title.classList.add("title");

                    coverImg.addEventListener("click", (event) => {
                        let categoryCode = v.CATEGORY_CODE;

                        if (categoryCode !== "111111") {
                            event.preventDefault();
                            alert("해당 도서는 아직 e북으로 구현되지 않았습니다. 다른 도서를 선택해주세요");
                        } else {
                            location.assign(contextPath + "/ebook/pageEbookReader.do?bindNo=" + v.BIND_NO);
                        }
                    });

                    coverImg.src = v.IMAGE;

                    if (v.TITLE.indexOf("(") != -1) {
                        let editedTitle = v.TITLE.substring(0, v.TITLE.indexOf("("));
                        title.innerText = editedTitle;
                    } else {
                        title.innerText = v.TITLE;
                    }

                    checkbox.type = "checkbox";
                    checkbox.value = v.BIND_NO;
                    
                    ebookItem.appendChild(coverImg);
                    ebookItem.appendChild(title);
                    ebookItem.appendChild(checkbox);

                    pseudoBox.appendChild(ebookItem);
                });

                pendingLoading = false;
            }
        });
    }, 1000);
}

function liftFromSort() {
    let checkBoxes = document.querySelectorAll("div.pseudo-box div.ebookItem input[type=checkbox]");

    console.log(checkBoxes);

    let checkedArr = new Array();

    for (let i = 0; i < checkBoxes.length; i ++) {
        if (checkBoxes[i].checked) {
            checkedArr.push(checkBoxes[i].value);
        }
    }

    console.log("test");
    console.log(checkedArr);

    if (checkedArr.length > 0) {
        $.ajax({
            url: contextPath + "/ebook/liftFromSort.do",
            type: "GET",
            data: {
                memberId: loginMemberId,
                sortName: currentSort,
                checkedArr: checkedArr.toString()
            },
            success: data => {
                if (data > 0) {
                    for (let i = 0; i < checkBoxes.length; i ++) {
                        if (checkBoxes[i].checked) {
                            checkBoxes[i].parentElement.remove();
                        }
                    }
    
                    listMySorts();
    
                    selectSort();
                } else {
                    alert("분류로부터의 제거에 실패하였습니다. 다시 시도해주세요");
                }
            }
        });
    }
}