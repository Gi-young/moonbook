let contextPath = document.getElementById("contextPath").value;

let loginMemberId = document.getElementById("loginMemberId").value;
let bindNo = document.getElementById("bindNo").value;

window.onload = function() {
    checkLogedIn();
    
    checkLoved();
    
    //checkShopped();
}

function checkLogedIn() {
    console.log(loginMemberId);
    console.log(typeof loginMemberId);

    if (loginMemberId === "") {
        opener.location.replace(contextPath + "/ebook/pageEbook.do?ebookDetailLoginCheck=denied");

        window.close();
    }
}

function checkLoved() {
    let heart = document.getElementById("checkLoved");
    $.ajax({
        url: contextPath + "/ebook/checkLoved.do",
        type: "GET",
        data: {
            loginMemberId: loginMemberId,
            bindNo: bindNo
        },
        success: data => {
            console.log("loved : " + typeof data);
            if (data > 0) {
                heart.style.color = "red";
            } else {
                heart.style.color = "lightgrey";
            }
        }
    });

    $.ajax({
        url: contextPath + "/ebook/countLoved.do",
        type: "GET",
        data: {
            bindNo: bindNo
        },
        success: data => {
            console.log(data);

            document.getElementById("loveNumber").innerText = data;
        }
    });
}

// function checkShopped() {
//     let checkShopped = document.getElementById("checkShopped");
//     $.ajax({
//         url: contextPath + "/ebook/checkShopped.do",
//         type: "GET",
//         data: {
//             loginMemberId: loginMemberId,
//             bindNo: bindNo
//         },
//         success: data => {
//             console.log("shopped: " + data);
//             if(data > 0) {
//                 checkShopped.checked = true;
//             } else {
//                 checkShopped.checked = false;
//             }
//         }
//     });
// }

function loveOrUnlove() {
    let heart = document.getElementById("checkLoved");
    if (heart.style.color === "red") {
        $.ajax({
            url: contextPath + "/ebook/unloveBook.do",
            type: "GET",
            data: {
                loginMemberId: loginMemberId,
                bindNo: bindNo
            },
            success: data => {
                console.log("unlove result: " + data);

                checkLoved();
            }
        });
    } else {
        $.ajax({
            url: contextPath + "/ebook/loveBook.do",
            type: "GET",
            data: {
                loginMemberId: loginMemberId,
                bindNo: bindNo
            },
            success: data => {
                console.log("love result: " + data);

                checkLoved();
            }
        });
    }
}

// function putInShoppingBasket() {
//     let checkShopped = document.getElementById("checkShopped");
//     if (checkShopped.checked) {
//         $.ajax({
//             url: contextPath + "/ebook/putOutShoppingBasket.do",
//             type: "GET",
//             data: {
//                 loginMemberId: loginMemberId,
//                 bindNo: bindNo
//             },
//             success: data => {
//                 console.log("From basket: " + data);
//             }
//         });
//     } else {
//         $.ajax({
//             url: contextPath + "/ebook/putInShoppingBasket.do",
//             type: "GET",
//             data: {
//                 loginMemberId: loginMemberId,
//                 bindNo: bindNo
//             },
//             success: data => {
//                 console.log("To basket: " + data);
//             }
//         });
//     }
//     checkShopped.checked = !checkShopped.checked;
// }

function buyNow() {
    opener.location.replace(contextPath + "/EbookControllerSm/bookpayment.do?bindNo=" + bindNo);

    window.close();
}