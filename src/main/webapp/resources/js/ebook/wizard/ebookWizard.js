window.onload = function() {
    getMyEbooks(1, 18);
}

let pendingLoading = false;

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

            document.querySelector("div.loaderBox").remove();

            let pseudoBox = document.querySelector("div.pseudo-box");
            
            data.forEach((v, i) => {
                let ebookItem = document.createElement("div");
                let coverImg = document.createElement("img");
                let title = document.createElement("p");

                ebookItem.classList.add("ebookItem");
                coverImg.classList.add("coverImg");
                title.classList.add("title");

                ebookItem.addEventListener("click", (event) => {
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
                
                ebookItem.appendChild(coverImg);
                ebookItem.appendChild(title);

                pseudoBox.appendChild(ebookItem);

                pendingLoading = false;
            });
        }
    })
    }, 2000);
}

let section = document.getElementsByTagName("section")[0];
let pseudoBox = document.querySelector("div.pseudo-box");
let cPage = 2;

section.addEventListener("scroll", () => {
    let clientHeight = section.clientHeight;
    let scrollHeight = section.scrollHeight;
    let scrollTop = section.scrollTop;

    if (pendingLoading === false) {
        if (pendingLoading === false && scrollTop > scrollHeight - clientHeight - 10) {
            getMyEbooks(cPage, 18);
    
            cPage++;
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

