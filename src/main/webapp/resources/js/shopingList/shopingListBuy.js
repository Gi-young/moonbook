IMP.init("imp26745696");
	
$(".btnPay").click(e=> {

//  북 정보들, 고른 개수들
	let bookNo = document.getElementsByClassName("bookNo");
	
	let bookCount = document.getElementsByClassName("bookCount");
//  이북
	let eBookNo = document.getElementsByClassName("eBookNo");
//  기프트 정보들, 고른 개수들
	let giftNo = document.getElementsByClassName("giftNo");
	let giftCount = document.getElementsByClassName("giftCount");

	let originPrice = document.getElementById("originPrice").value;
	
	let deliveryFee = document.getElementById("deliveryFee").value;
	
	let btnPay = document.getElementsByClassName("btnPay");
	
	//let refundBtn = document.getElementById("refundBtn");
	
	let loginMember = document.getElementById("loginMemberId").value;
	
	let contextPath = document.getElementById("contextPath").value;
	
	let totalPrice = document.getElementById("totalPrice").value;
	
	let point = originPrice*0.1;

for(let n=0; n<giftNo.length; n++){
	if(giftNo[n].value != undefined){
		console.log(giftNo.value);
		console.log(giftNo[n].value);
	}else{
	 	console.log("기프트 언디파인드");
	}
}
	//console.log("이북 번호 "+eBookNo);
	//console.dir(eBookNo);
	//console.log("도서 번호 "+bookNo[0].value);
	//console.log("도서 개수 "+bookCount[0].value);
	//console.log("기프트 번호 "+giftNo[0].value);
	//console.log("기프트 개수 "+giftCount[0].value);
	//console.log("적립할 포인트"+point);
	//console.log("배송비 "+deliveryFee);
	//console.log(contextPath);
	//console.log("총 원가 "+originPrice);
	//console.log("배송비 포함 총 가격 "+totalPrice);
	//console.log(stock);
	//console.log(sellStock);
	//console.log(Number(stock)<=Number(sellStock));
	
	if(false){
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
                            name: "문곰책방",
                            amount: totalPrice
                        }, function(rsp) {                       	                 	
                            if (rsp.success) {
                                $.ajax({                                                     
                                    url: contextPath + "/shopingList/writePurchaseLog.do",
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
						                totalPrice: totalPrice,
						                point: point
					                },        
                                    success: data => {
                                 for(let i=0; i<bookNo.length; i++){
                                  if(bookNo[i].value != undefined){
	                                  console.log("도서 있음");
                                    	$.ajax({
                                    		url: contextPath + "/shopingList/salesVolumeAddBook.do",
                                    		type: "POST",
                                    		data: {
                                    			
                                    			bookNo: bookNo[i].value,
                                    			bookCount: bookCount[i].value,                              
                                    			memberId: loginMember,
                                    			totalPrice: totalPrice,
                                    			merchantUid: rsp.merchant_uid,
                                    			point: point
                                    		},
                                    		success: data => {
		                                        console.log("결제 로그 추가 결과 : " + data);
		                                        alert("결제에 성공했습니다. 감사합니다");   
		                                       	history.go(-4);                                                                  		
                                    		}
                                    	});
                                    
                                 }  else{
                                 		console.log("도서 없음");
                                 	$.ajax({
                                    		url: contextPath + "/shopingList/salesVolumeAddBook.do",
                                    		type: "POST",
                                    		data: {
                                    			
                                    			bookNo: 123456, 
                                    			bookCount: 0,                              
                                    			memberId: loginMember,
                                    			totalPrice: totalPrice,
                                    			merchantUid: rsp.merchant_uid,
                                    			point: point
                                    		},
                                    		success: data => {
		                                        console.log("결제 로그 추가 결과 : " + data);
		                                        alert("결제에 성공했습니다. 감사합니다");   
		                                       	history.go(-4);                                                                  		
                                    		}
                                    	});
                                 }	
                                } 
                                   for(let e=0; e<eBookNo.length; e++){
	                                 if(eBookNo[e].value != undefined){
                                 			console.log("이북 있음");
                                    	$.ajax({
                                    		url: contextPath + "/shopingList/salesVolumeAddEbook.do",
                                    		type: "POST",
                                    		data: {	
                                    			eBookNo: eBookNo[e].value,
                                    			memberId: loginMember,
                                    			totalPrice: totalPrice,
                                    			merchantUid: rsp.merchant_uid,
                                    			point: point
                                    		},
                                    		success: data => {
		                                        console.log("결제 로그 추가 결과 : " + data);
		                                        alert("결제에 성공했습니다. 감사합니다");   
		                                       	history.go(-4);                                                                  		
                                    		}
                                    	});
                                    
                                  }else{
                                  console.log("이북 없음");
                                  	$.ajax({
                                    		url: contextPath + "/shopingList/salesVolumeAddEbook.do",
                                    		type: "POST",
                                    		data: {	
                                    			
                                    			memberId: loginMember,
                                    			totalPrice: totalPrice,
                                    			merchantUid: rsp.merchant_uid,
                                    			point: point
                                    		},
                                    		success: data => {
		                                        alert("결제에 성공했습니다. 감사합니다");   
		                                       	history.go(-4);                                                                  		
                                    		}
                                    	});
                                  } 	
                                }  
                                for(let g=0; g<giftNo.length; g++){
                                  if(giftNo[g].value != undefined){
                                 	console.log("기프트있음"+giftNo[g].value);
                                 	console.log("개수도있음"+giftCount[g].value);
                                    	$.ajax({
                                    		url: contextPath + "/shopingList/salesVolumeAddGift.do",
                                    		type: "POST",
                                    		data: {
                                    		
                                    			giftNo: giftNo[g].value,
                                    			giftCount: giftCount[g].value,
                                    			memberId: loginMember,
                                    			totalPrice: totalPrice,
                                    			merchantUid: rsp.merchant_uid,
                                    			point: point
                                    		},
                                    		success: data => {
                                    			console.log("기프트 통과"+data);
		                                        console.log("결제 로그 추가 결과 : " + data);
		                                        alert("결제에 성공했습니다. 감사합니다");   
		                                        history.go(-4);                                                                  		
                                    		}
                                    	});
                                      
                                     }else{
                                      console.log("기프트 없음");
                                     	$.ajax({
                                    		url: contextPath + "/shopingList/salesVolumeAddGift.do",
                                    		type: "POST",
                                    		data: {
                                    			giftNo: 123456,
                                    			giftCount: 0,		
                                    			memberId: loginMember,
                                    			totalPrice: totalPrice,
                                    			merchantUid: rsp.merchant_uid,
                                    			point: point
                                    		},
                                    		success: data => {
		                                        console.log("결제 로그 추가 결과 : " + data);
		                                        alert("결제에 성공했습니다. 감사합니다");   
		                                       	window.location.reload();                                                           		
                                    		}
                                    	});
                                     } 
                                   }   
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

