IMP.init("imp26745696");


let btnPay = document.getElementsByClassName("btnPay");
let refundBtn = document.getElementById("refundBtn");
let loginMember = document.getElementById("loginMember").value;
let contextPath = document.getElementById("contextPath").value;
let sellStock = document.getElementById("sellStock").value;
let totalPrice = document.getElementById("totalPrice").value;
console.log("시작시작시작시자ㅣㄱ시작시작시작");
console.log(btnPay );
console.log(loginMember);
console.log(contextPath);
console.log(sellStock);
console.log(totalPrice);
console.log("ㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲㄲ");

$(".btnPay").click(e=> {

	e.preventDefault();
    //let totalPrice = Number(document.getElementById("totalPrice").innerText);

    //let purchaseArr = new Array();
    //document.querySelectorAll("input[name=selectEbook]").forEach((v, i) => {
     //   if (v.checked) {
       //     purchaseArr.push(v.value);
    //    }
    //});
    
	let sellStock = document.getElementById("sellStock").value;
	let bookPrice09 = document.getElementById("bookPrice09").value;
	//let totalPrice = bookVolume * bookPrice09;
	
	
    $.ajax({
        url: contextPath + "/sellpart/checkMember.do",
        type: "POST",
        data: { 
        memberId: loginMember
        },
        success: data => {
        
        console.log("수량"+sellStock);
		console.log("할인가"+bookPrice09);
		//console.log("총금액"+totalPrice);
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
                    console.log(merchant_uid);
                    IMP.request_pay(
                        {
                            pg: "html5_inicis",
                            pay_method: "card",
                            merchant_uid: merchant_uid,
                            buyer_name: buyerName,
                            buyer_email: buyerEmail,
                            name: "문곰템",
                            amount: Number(totalPrice)
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
                                        purchaseEbookNoList: "1,2"
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


//refundBtn.addEventListener("click", () => {
//    $.ajax({
//        url: contextPath + "/ebook/cancelPayment.do",
 //       type: "POST",
  //      data: {
 //           impUid: "imp_223195009712"
  //      },
  //      success: () => {
  //          console.log("환불 성공");
 //       }
 //   });
// });
