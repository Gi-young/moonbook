let bindNo = document.getElementById("bindNo").value;

window.onload = checkLoved;

function checkLoved() {
    let checkLoved = document.getElementById("checkLoved");
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
                checkLoved.checked = true;
            } else {
                checkLoved.checked = false;
            }
        }
    });
}

function loveOrUnlove() {
    let checkLoved = document.getElementById("checkLoved");
    if (checkLoved.checked) {
        $.ajax({
            url: contextPath + "/ebook/unloveBook.do",
            type: "GET",
            data: {
                loginMemberId: loginMemberId,
                bindNo: bindNo
            },
            success: data => {
                console.log("unlove result: " + data);
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
            }
        });
    }
    checkLoved.checked = !checkLoved.checked;
}

function putInShoppingBasket() {

}