let contextPath = document.getElementById("contextPath").value;
let loginMemberId = document.getElementById("memberId").value;
let currentFocus = document.getElementById("currentFocus").value;

console.log("currentFocus : " + currentFocus);

function moonbookDatabind() {
    let flag = confirm("정말 API에서 데이터를 받아오시겠습니까?\n\n(진행 상황은 브라우저 개발자 툴을 통해 확인하실 수 있습니다.\n\n타깃 테이블의 내용이 계속 변하여 NOT ENOUGH VALUES에러가 날 가능성이 있습니다.\n\n그럴 경우에는 INSERT문을 확인해주세요.\n\n서버에서 UNIQUE CONSTRAINT가 발생할 경우 해당 데이터가 해당 테이블에 이미 들어 있는 경우입니다.)");

    if (flag) {
        let keywordStr = "";
        keywordStr += "가나다라마바사아자차카타파하";
        keywordStr += "갸냐댜랴먀뱌샤야쟈챠캬탸퍄햐";
        keywordStr += "거너더러머버서어저처커터퍼허";
        keywordStr += "겨녀뎌려며벼셔여져쳐켜텨펴혀";
        keywordStr += "고노도로모보소오조초코토포호";
        keywordStr += "교뇨됴료묘뵤쇼요죠쵸쿄툐표효";
        keywordStr += "구누두루무부수우주추쿠투푸후";
        keywordStr += "규뉴듀류뮤뷰슈유쥬츄큐튜퓨휴";
        keywordStr += "그느드르므브스으즈츠크트프흐";
        keywordStr += "기니디리미비시이지치키티피히";
        keywordStr += "개내대래매배새애재채캐태패해";
        keywordStr += "게네데레메베세에제체케테페헤";
        keywordStr += "의희";
        keywordStr += "과놔봐솨와좌촤화";
        keywordStr += "귀뉘뒤쉬위튀휘";
        keywordStr += "둬뭐워줘훠";
        keywordStr += "괴뇌되뢰뫼뵈쇠외죄최쾨퇴푀회";
        keywordStr += "걔얘";
        keywordStr += "계례예폐혜";
        keywordStr += "각낙닥락막박삭악작착칵탁팍학";
        keywordStr += "략약";
        keywordStr += "걱덕럭먹벅석억적척컥턱퍽헉";
        keywordStr += "강낭당랑망방상앙장창캉탕팡항";
        keywordStr += "책꿈민현진권열술입몰옛백철표전중활양동문선집헌법음략문명엠";
        
        keywordStr += "0123456789";
        keywordStr += "abcdefghijklmnopqrstuvwxyz";

        let timeout = 400;

        for(let i=0;i<keywordStr.length;i++) {
            // 한국고전소설
            window.setTimeout(() => {databind("100020010", keywordStr[i])}, timeout * i);
            // 세계문학
            window.setTimeout(() => {databind("100020020", keywordStr[i])}, timeout * keywordStr.length * 1 + timeout * i);
            // 세계고전
            window.setTimeout(() => {databind("100020030", keywordStr[i])}, timeout * keywordStr.length * 2 + timeout * i);
            // 청소년 문학
            window.setTimeout(() => {databind("300050", keywordStr[i])}, timeout * keywordStr.length * 3 + timeout * i);
            // 한국그림책(0~3세)
            window.setTimeout(() => {databind("310010010", keywordStr[i])}, timeout * keywordStr.length * 4 + timeout * i);
            // 외국그림책(0~3세)
            window.setTimeout(() => {databind("310010020", keywordStr[i])}, timeout * keywordStr.length * 5 + timeout * i);
            // 한국그림책(4~7세)
            window.setTimeout(() => {databind("310020010", keywordStr[i])}, timeout * keywordStr.length * 6 + timeout * i);
            // 외국그림책(4~7세)
            window.setTimeout(() => {databind("310020020", keywordStr[i])}, timeout * keywordStr.length * 7 + timeout * i);
            // 세계 명작 동화(유아)
            window.setTimeout(() => {databind("310040010", keywordStr[i])}, timeout * keywordStr.length * 8 + timeout * i);
            // 한국 전래 동화(유아)
            window.setTimeout(() => {databind("310040020", keywordStr[i])}, timeout * keywordStr.length * 9 + timeout * i);
            // 국내 창작 동화(유아)
            window.setTimeout(() => {databind("310040030", keywordStr[i])}, timeout * keywordStr.length * 10 + timeout * i);
            // 다른나라 그림책(유아)
            window.setTimeout(() => {databind("310040040", keywordStr[i])}, timeout * keywordStr.length * 11 + timeout * i);
            // 어린이동화(초등 1~2학년)
            window.setTimeout(() => {databind("320010010", keywordStr[i])}, timeout * keywordStr.length * 12 + timeout * i);
            // 어린이동화(초등 3~4학년)
            window.setTimeout(() => {databind("320020010", keywordStr[i])}, timeout * keywordStr.length * 13 + timeout * i);
            // 어린이동화(초등 5~6학년)
            window.setTimeout(() => {databind("320030010", keywordStr[i])}, timeout * keywordStr.length * 14 + timeout * i);
            // 어린이동화(공통)
            window.setTimeout(() => {databind("320040010", keywordStr[i])}, timeout * keywordStr.length * 15 + timeout * i);
        }
    }
}

function databind(groupId, keyword) {
    $.ajax({
        url: contextPath + "/ebook/getBookDataFromAPI.do",
        data: {
            groupId: groupId,
            keyword: keyword
        },
        success: data => {
            let dataJSON = new X2JS().xml_str2json(data);
            console.dir(dataJSON);
            let item = dataJSON.rss.channel.item;

            console.log(dataJSON);
            console.log("dataJSON : " + dataJSON);
            console.log("item : " + dataJSON.rss.channel.item);
            console.dir(dataJSON.rss.channel.item);

            if(item !== undefined) {
                if(Array.isArray(item)) {
                    item.forEach((v,i) => {
                        $.ajax({
                            url: contextPath + "/ebook/insertBookDataIntoDatabase.do",
                            data: {
                                author: v.author,
                                description: v.description,
                                image: v.image,
                                isbn: v.isbn,
                                link: v.link,
                                price: v.price,
                                pubdate: v.pubdate,
                                publisher: v.publisher,
                                title: v.title,
                                groupId: groupId
                            },
                            success: data => {
                                console.log(data);
                            }
                        });
                    });
                } else {
                    $.ajax({
                        url: contextPath + "/ebook/insertBookDataIntoDatabase.do",
                        data: {
                            author: item.author,
                            description: item.description,
                            image: item.image,
                            isbn: item.isbn,
                            link: item.link,
                            price: item.price,
                            pubdate: item.pubdate,
                            publisher: item.publisher,
                            title: item.title,
                            groupId: groupId
                        },
                        success: data => {
                            console.log(data);
                        }
                    });
                }
            }
        }
    });
}

function uploadEbook() {
    let url = contextPath + "/ebook/pageUploadEbook.do";
    let windowWidth = window.screen.width;
    let windowHeight = window.screen.height;
    let width = 400;
    let height = 300;
    let status = "left = " + (windowWidth - width) / 2 + ", top = " + (windowHeight - height) / 2 + ",width = " + width + ", height = " + height;

    window.open(url, "uploadEbook", status);
}

function login() {
    let url = contextPath + "/ebook/pageLogin.do";
    let windowWidth = window.screen.width;
    let windowHeight = window.screen.height;
    let width = 400;
    let height = 300;
    let status = "left = " + (windowWidth - width) / 2 + ", top = " + (windowHeight - height) / 2 + ", width = " + width + ", height = " + height;

    window.open(url, "loginFromEbookPage", status);
}
    
function logout() {
    location.replace(contextPath + "/ebook/logout.do");
}

let shoppingBasketLoginCheck = document.getElementById("shoppingBasketLoginCheck").value;
if(shoppingBasketLoginCheck === "denied") {
	login();
	
	location.replace(contextPath + "/ebook/pageEbook.do");
}

let ebookDetailLoginCheck = document.getElementById("ebookDetailLoginCheck").value;
if (ebookDetailLoginCheck === "denied") {
    login();

    location.replace(contextPath + "/ebook/pageEbook.do");
}

function openEbookWizard() {
    let memberId = document.getElementById("memberId").value;
    console.log("header : " + memberId);
    console.log(typeof memberId);
    if (memberId !== "") {
            let windowHeight = window.screen.height;
            let windowWidth = window.screen.width;
            let readerWidth = windowWidth * 0.9;
            let readerHeight = windowHeight * 0.9;
            let url = contextPath + "/ebook/openEbookWizard.do";
            let status = "width = "+ readerWidth + ", height = " + readerHeight;
            var reader = window.open(url, "ebookReader", status);
            reader.moveTo((windowWidth - readerWidth) / 2, (windowHeight - readerHeight) / 2);
    } else {
        login();

        location.replace(contextPath + "/ebook/pageEbook.do");
    }
};

highlightCurrentPage(currentFocus);

function highlightCurrentPage(currentFocus) {
    let lists = document.querySelectorAll("ul.navbar-menu>li");

    for (let i = 0; i < lists.length; i ++) {
        lists[i].style.backgroundColor = "none";
    }

    switch (currentFocus) {
        case "": lists[0].classList.add("navbar-menu-highlight"); break;
        case "child": lists[1].classList.add("navbar-menu-highlight"); break;
        case "elementary": lists[2].classList.add("navbar-menu-highlight"); break;
        case "middle": lists[3].classList.add("navbar-menu-highlight"); break;
        case "ebook": lists[4].classList.add("navbar-menu-highlight"); break;
    }
}

function manageBanner() {
    let windowWidth = window.screen.width;
    let windowHeight = window.screen.height;
    let width = 700;
    let height = 600;

    let status = "left = " + (windowWidth - width) / 2 + ", top = " + (windowHeight - height) / 2 + ", width = " + width + ", height = " + height;

    let url = contextPath + "/ebook/pageManageBanner.do";

    window.open(url, "manageBanner", status);
}