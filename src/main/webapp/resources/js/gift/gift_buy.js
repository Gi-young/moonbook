IMP.init("imp26745696");





	
$(".btnPay").click(e=> {
	
	let couponNo = document.getElementById("couponNo").value;
	let couponAmount = document.getElementById("couponAmount").value;
	let originPrice = document.getElementById("originPrice").value;
	let deliveryFee = document.getElementById("deliveryFee").value;
	let giftNo = document.getElementById("giftNo").value;
	let btnPay = document.getElementsByClassName("btnPay");
	let refundBtn = document.getElementById("refundBtn");
	let loginMember = document.getElementById("loginMember").value;
	let contextPath = document.getElementById("contextPath").value;
	let sellStock = document.getElementById("sellStock").value;
	
	let stock = document.getElementById("stock").value;

	let totalPrice = document.getElementById("totalPrice").value;
	
	let point = originPrice*0.1;
	
	
	if(!(Number(stock)<=Number(sellStock))){
		console.log("stock==="+Number(stock));
		console.log("sellStock==="+Number(sellStock));
		alert('주문 가능한 수량을 초과하였습니다.');
	}else{
		e.preventDefault();
	    //let totalPrice = Number(document.getElementById("totalPrice").innerText);
	    //let purchaseArr = new Array();
	    //document.querySelectorAll("input[name=selectEbook]").forEach((v, i) => {
	    //   if (v.checked) {
	    //     purchaseArr.push(v.value);
	    //    }
	    //}); 
		//let sellStock = document.getElementById("sellStock").value;
		//let bookPrice09 = document.getElementById("bookPrice09").value;
		//let totalPrice = bookVolume * bookPrice09;
	
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
                    console.log(merchant_uid);
                    IMP.request_pay(
                        {
                            pg: "html5_inicis",
                            pay_method: "card",
                            merchant_uid: merchant_uid,
                            buyer_name: buyerName,
                            buyer_email: buyerEmail,
                            name: "문곰템",
                            amount: totalPrice
                        }, function(rsp) {                       	                 	
                            if (rsp.success) {
                                $.ajax({                                                     
                                    url: contextPath + "/gift/writePurchaseLog.do",
                                    type: "POST",
                                    data: {
					                	impUid: rsp.imp_uid,
						                merchantUid: rsp.merchant_uid,
						                memberId: loginMember,
						                payMethod: rsp.pay_method,
						                paidAmount: rsp.paid_amount,
						                paidAt: rsp.paid_at,
						                pgProvider: rsp.pg_provider,
						                receiptUrl: rsp.receipt_url,
						                deliveryFee: deliveryFee,
						                stock: stock,
						                totalPrice: totalPrice,
						                point: point,
						                couponNo: couponNo
					                },
                                    success: data => {
                                    	$.ajax({
                                    		url: contextPath + "/gift/salesVolumeAdd.do",
                                    		type: "POST",
                                    		data: {
                                    			stock: stock,
                                    			giftNo: giftNo,
                                    			memberId: loginMember,
                                    			totalPrice: totalPrice,
                                    			merchantUid: rsp.merchant_uid,
                                    			point: point,
                                    			couponNo: couponNo
                                    		},
                                    		success: data => {
		                                        console.log("결제 로그 추가 결과 : " + data);
		                                        alert("결제에 성공했습니다. 감사합니다");   
		                                       	history.go(-4);                                                                  		
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
