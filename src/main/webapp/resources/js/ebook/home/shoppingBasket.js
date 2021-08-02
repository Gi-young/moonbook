window.onload = function() {
    getMyBooksFromBasket();
}

function getMyBooksFromBasket() {
    $.ajax({
        url: contextPath + "/ebook/getMyBooksFromBasket.do",
        type: "GET",
        data: {
            loginMemberId: loginMemberId
        },
        success: data => {
            console.log(data);
            let main = document.getElementsByTagName("main")[0];
            
            data.forEach((v, i) => {
                let ebookBox = document.createElement("div");
                ebookBox.classList.add("ebookBox");
                
                let ebookImg = document.createElement("img");
                ebookImg.src = v.IMAGE;
                
                let checkbox = document.createElement("input");
                checkbox.type = "checkbox";
                checkbox.name = "selectEbook"
                checkbox.value = v.BIND_NO;
                checkbox.addEventListener("change", () => {
                    let totalPrice = 0;
                    document.querySelectorAll("input[name=selectEbook]").forEach((w, j) => {
                        if (w.checked) {
                            totalPrice += parseInt(w.nextElementSibling.nextElementSibling.innerText);
                        }
                    });
                    document.getElementById("totalPrice").innerText = totalPrice;
                });

                let ebookTitle = document.createElement("p");
                ebookTitle.innerText = v.TITLE;

                let ebookPrice = document.createElement("p");
                ebookPrice.innerText = v.PRICE;

                ebookBox.appendChild(ebookImg);
                ebookBox.appendChild(checkbox);
                ebookBox.appendChild(ebookTitle);
                ebookBox.appendChild(ebookPrice);

                main.appendChild(ebookBox);
            });
        }
    });
}

IMP.init("imp47672833");

let payBtn = document.getElementById("payBtn");
let refundBtn = document.getElementById("refundBtn");

payBtn.addEventListener("click", () => {
    let totalPrice = Number(document.getElementById("totalPrice").innerText);

    let purchaseArr = new Array();
    document.querySelectorAll("input[name=selectEbook]").forEach((v, i) => {
        if (v.checked) {
            purchaseArr.push(v.value);
        }
    });

    $.ajax({
        url: contextPath + "/ebook/getMemberInfo.do",
        type: "POST",
        data: {
            memberId: loginMemberId
        },
        success: data => {
            let buyerName;
            let buyerEmail;
            let merchant_uid;
            buyerName = data.memberName;
            buyerEmail = data.memberEmail;

            $.ajax({
                url: contextPath + "/ebook/getMerchantUid.do",
                type: "POST",
                success: data => {
                    merchant_uid = data;
                    IMP.request_pay(
                        {
                            pg: "html5_inicis",
                            pay_method: "card",
                            merchant_uid: merchant_uid,
                            buyer_name: buyerName,
                            buyer_email: buyerEmail,
                            name: "eBook",
                            amount: 100
                        }, function(rsp) {
                            if (rsp.success) {
                                $.ajax({
                                    url: contextPath + "/ebook/writePurchaseLog.do",
                                    type: "POST",
                                    data: {
                                        impUid: rsp.imp_uid,
                                        merchantUid: rsp.merchant_uid,
                                        memberId: loginMemberId,
                                        payMethod: rsp.pay_method,
                                        paidAmount: rsp.paid_amount,
                                        paidAt: rsp.paid_at,
                                        pgProvider: rsp.pg_provider,
                                        receiptUrl: rsp.receipt_url,
                                        purchaseEbookNoList: purchaseArr.toString()
                                    },
                                    success: data => {
                                        console.log("결제 로그 추가 결과 : " + data);

                                        $.ajax({
                                            url: contextPath + "/ebook/putPurchasedEbooksIntoDatabase.do",
                                            type: "POST",
                                            data: {
                                                loginMemberId: loginMemberId,
                                                purchaseList: purchaseArr.toString()
                                            }
                                        });

                                        document.querySelectorAll("div.ebookBox").forEach((v, i) => {
                                            if(purchaseArr.includes($(v).find("input[name=selectEbook]").val())) {
                                                v.remove();
                                            }
                                        });

                                        alert("결제에 성공했습니다. 감사합니다");
                                    }
                                });
                            } else {
                                console.log(rsp.error_msg);
                                console.log("fail");
                            }
                        }
                    );
                }
            });
        }
    });
});

refundBtn.addEventListener("click", () => {
    $.ajax({
        url: contextPath + "/ebook/cancelPayment.do",
        type: "POST",
        data: {
            impUid: "imp_223195009712"
        },
        success: () => {
            console.log("환불 성공");
        }
    });
});

document.getElementById("checkAll").addEventListener("change", (event) => {
    let checkBoxes = document.querySelectorAll("input[name=selectEbook]");
    let totalPrice = 0;
    if (event.target.checked) {
        checkBoxes.forEach((v, i) => {
            v.checked = true;
        });
    } else {
        checkBoxes.forEach((v, i) => {
            v.checked = false;
        });
    }
    checkBoxes.forEach((v, i) => {
        if(v.checked) {
            totalPrice += parseInt(v.nextElementSibling.nextElementSibling.innerText);
        }
    });
    document.getElementById("totalPrice").innerText = totalPrice;
});

document.getElementById("payTest").addEventListener("click", () => {
    $.ajax({
        url: contextPath + "/ebook/writePurchaseLog.do",
        type: "POST",
        data: {
            impUid: "test",
            merchantUid: "test",
            memberId: "admin",
            payMethod: "test",
            paidAmount: 1000,
            paidAt: "test",
            pgProvider: "test",
            receiptUrl: "test",
            purchaseEbookNoList: "test"
        },
        success: data => {
            console.log("결제 로그 추가 결과 : " + data);
        }
    });
});