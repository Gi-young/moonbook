(function() {
IMP.init("imp33769544");

let payBtn = document.getElementById("byBuy");
let memberId = document.getElementById("loginMemberId").value;
let contextPath = document.getElementById("contextPath").value; 

payBtn.addEventListener("click", () => {
    let totalPrice = Number(document.getElementById("totalPrice").innerText);
	console.log(totalPrice);
    let purchaseArr = new Array();
    console.log(purchaseArr);
    document.querySelectorAll("input[name=selectGift]").forEach((v, i) => {
        if (v.checked) {
            purchaseArr.push(v.value);
        }
    });

    $.ajax({
        url: contextPath + "/gift/searchMember.do",
        type: "POST",
        data: {
            memberId: memberId
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
})();
