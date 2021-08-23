IMP.init("imp26745696");


	
$(".btnPay").click(e=> {

	let bindNo = document.getElementsByClassName("bindNo");
	let btnPay = document.getElementsByClassName("btnPay");
	let refundBtn = document.getElementById("refundBtn");
	let loginMember = document.getElementById("loginMember").value;
	let contextPath = document.getElementById("contextPath").value;
	let sellStock = document.getElementById("sellStock").value;
	let stock = document.getElementById("stock").value;
	let totalPrice = document.getElementById("totalPrice").value;
	if(Number(stock)<Number(sellStock)){
		alert('주문 가능한 수량을 초과하였습니다.');
	}else{
	e.preventDefault();
	
	
    $.ajax({
        url: contextPath + "/sellpart/checkMember.do",
        type: "POST",
        data: { 
        memberId: loginMember
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
                            name: "문곰도서",
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
                                        purchaseEbookNoList: "1,2"
                                    },
                                    success: data => {
                                        alert("결제에 성공했습니다. 감사합니다");
                                        let sellStockInt = document.getElementById("sellStock").value;
                                        
                                         $.ajax({
                                         	url: contextPath + "/SellbookController/salesVolumeAdd.do",
                                    		type: "POST",
                                    		data:{
                                    			sellstockInt : Number(sellStockInt),
                                    			bindNo : Number(bindNo)
                                    		}, success: data => {
                                    			alert("판매량 추가 완료");
                                    		
                                    		}
                                    		
                                         });
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
    }
});
