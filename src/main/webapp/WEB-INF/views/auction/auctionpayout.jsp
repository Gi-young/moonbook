<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>경매 선금 충전</title>
	<link rel="icon" href="${path}/resources/images/ebook/favicon.png" sizes="16x16">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionpay.css">
</head>
<body>

	<div id="wrap">
		<div id="container">
			<div class="auctionPay">
				<p>출금신청</p>
				
				<form action="${path }/auction/auctionpayoutEnd.do" onsubmit="return check();">
					<div>
						<input type="hidden" name="bidId" value="${member.memberId }">
						<label>내포인트</label>
						<span> ${member.memberPoint }</span> <br>
						<label>은행 선택</label><br>
						<c:forEach items="${bank }" var="b">
						<input type="radio" name="bankName" value="${b.bankName }" required="required">${b.bankName }
						<input type="hidden"  value="${b.bankCharge }">		
						</c:forEach>
						<br>
						
						<label>계좌변호</label><input type="text" name="transactionNumber" placeholder="-을빼고 입력해주세요" required="required" >	<br>
						<label>수수료</label><span id="charge">  0 </span><br>			
						<label>출금할 금액 : </label>
						<input type="number" name="price" placeholder="금액(원)">	<br>
						<label>출금할 되는 금액 : </label><span id="transactionPrice"></span><br>
						
						<input type="hidden" name="bidPrice" value=""> 
						
						<p>최소 만원 이상부터 출금이 가능합니다.</p>
						<p>수수료를 제외한 금액이 입급됩니다</p> 
					<input type="submit" value="보내라">
					</div>			
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		$("input[name=bankName]").click(e=>{
			let charge=$(e.target).next("input").val();
			let price=$("input[name=price]").val()-charge;
			console.log(price);
			$("#transactionPrice").text(price);
			$("input[name=bidPrice]").val(price);
			$("#charge").text(charge);
		})
		$("input[name=price]").keyup(e=>{
			let charge=$("#charge").text();
			let price=$("input[name=price]").val()-charge;
			$("#transactionPrice").text(price);
			$("input[name=bidPrice]").val(price);
			console.log(parseInt($("input[name=bidPrice]").val())>parseInt(${member.memberPoint}))
		})
		
		const check=()=>{
			if(parseInt($("input[name=transactionPrice]").val())<10000){
				alert('10000원 이상부터 출금가능합니다');
				return false;
			}else if(parseInt($("input[name=transactionPrice]").val())>parseInt(${member.memberPoint})){
				alert('금액 보유 미만');
				return false;
				}
		}

	</script>


</body>
</html>