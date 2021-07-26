console.log("test");

IMP.init("imp47672833");

let payBtn = document.getElementById("payBtn");

payBtn.addEventListener("click", () => {
    console.log("test2");
    console.log(IMP);
    IMP.request_pay(
        {
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "ORD20180131-0000011",
            name: "안나 카레니나",
            amount: 500,
            buyer_email: "tnsks710@naver.com",
            buyer_name: "김기영",
            buyer_tel: "010-4645-8986",
            buyer_addr: "서울특별시 은평구 진관4로 48-50",
            buyer_postcode: "03303"
        }, function(rsp) {
            if (rsp.success) {
                console.log("success");
            } else {
                console.log(rsp.error_msg);
                console.log("fail");
            }
        }
    );
});