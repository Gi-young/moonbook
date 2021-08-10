<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/inputCoupon3.css">

<div class="addProduct-container">
	<div class="addProduct-box1">
		<div class="addProduct-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="addProduct-box2">
			<div class="addProduct-box4">
				<p>쿠폰 발급</p>
			</div>
			<!-- <div class="addProduct-container2">
				<form action="" method="post">
					<table class="ChooseTable1">
						<tr>
							<th>타입</th>
							<td>
								<input class="chooseBookAdd" type="radio" name="chooseBookAdd" id="book" value="book" checked><label for="book" class="chooseBookAdd3">책등록</label>
								<input class="chooseBookAdd6" type="radio" name="chooseBookAdd" id="gift" value="gift"><label for="gift" class="chooseBookAdd5">gift</label>
							</td>
						</tr>
					</table>
				</form>
			</div> -->
			<div class="addProduct-container3">
				<form action="${path}/admin/inputCouponAdminGrade.do" method="post" id="couponGroup">
					<table class="ChooseTable1">
						<!--자동 넘버처리 -->
						<!-- <tr>
							<th>도서 번호</th>
							<td>
								<input type="number" min="1" name="BOOK_NO">
							</td>
						</tr> -->
						<tr>
							<th>회원 등급</th>
							<td>
								<input type="text" name="memberGradeNo" class="memberGradeNo" value="${memberGrade}" required><span class="colorChange"></span>
							</td>
						</tr>
						
						<tr>
							<th>발급할 쿠폰 종류</th>
							<td>
								<input type="number" min="1" name="couponCouponListNo" class="couponCouponListNoC" required>
							</td>
						</tr>
						
					
						<tr>
							<th>사용가능 여부</th>
							<td>
								<input class="chooseBookAdd" type="radio" name="couponCanuse" id="Y" value="Y" checked><label for="Y" class="chooseBookAdd3">Y</label>
								<input class="chooseBookAdd2" type="radio" name="couponCanuse" id="N" value="N"><label for="N" class="chooseBookAdd4">N</label>
							</td>
						</tr>
						<tr>
							<th>만료기간</th>
							<td>
								<input type="number" min="1" value=""  name="couponinvalid" >
							</td>
						</tr>
						<!-- <tr>
							<th>쿠폰이미지</th>
							<td>
								<input type="text"  name="couponImg" required>
							</td>
						</tr> -->
						<tr>
							<td colspan="2">
								<input type="submit" value="발급" onclick="return checkCouponNum(event);">
							</td>
						</tr>
					</table>
				</form>	
 
			</div>
			
			
			
		</div>
	</div>
</div>


<script>
	$("input[name=chooseBookAdd]").click(e=>{
		$("input[name=chooseBookAdd]").each((i,v)=>{
			if(v.checked){
				if(v.value=="book"){
					
					$(".addProduct-container5").css("display","none");
					$(".addProduct-container3").css("display","block");
				}else if(v.value=="gift"){
					$(".addProduct-container3").css("display","none");
					$(".addProduct-container5").css("display","block");
				}
			}
		})
	})
	/* $(".memberGradeNo").keyup(e =>{ 
		let id=$(e.target).val();
		let searchGrade=$(e.target).next().val();
		console.log("id 체크 : "+ id);
		$.ajax({
			url:"${path}/admin/searchGrade.do",
			data:{
				id:id
			},
			success: data=>{
				//let grade=JSON.parse(data);
				console.log(data.memberGradeNo);
				
				if(data.memberGradeNo==1){
					$(e.target).next().text("브론즈 : 1");
					$(e.target).next().css("color","c49c48");
				}else if(data.memberGradeNo===2){
					$(e.target).next().text("실버 : 2");
					$(e.target).next().css("color","808080");
				}else if(data.memberGradeNo===3){
					$(e.target).next().text("골드 : 3");
					$(e.target).next().css("color","gold");
				}else if(data.memberGradeNo===4){
					$(e.target).next().text("플래티넘 : 4");
					$(e.target).next().css("color","A0B2C6");
				} 
				
				
			}
			
		})
		
	}); */
	/*<img src="{path}/images/icon_level_1_s.png"> 브론곰 */
	/*<img src="{path}/images/icon_level_2_s.png"> 실버곰  */
	/*<img src="/21PM_moonbook_final/resources/images/icon_level_3_s.png">  골드곰 */
	/* <img src="/21PM_moonbook_final/resources/images/icon_level_4_s.png"> 플래곰 */
	
	/* 발급할 쿠폰 종류가 있으면 지정해줌 만료기간과 쿠폰이미지 */
	$(".couponCouponListNoC").keyup(e =>{ 
		
		let couponlistNum=$(e.target).val();
		let couponInvalid =document.getElementsByName("couponinvalid")[0];
		let couponImg=document.getElementsByName("couponImg")[0];
		
		
		
		$.ajax({
			url:"${path}/admin/searchInvalidNImg.do",
			data:{
				couponlistNum:couponlistNum,
				/* couponInvalid:couponInvalid */
			},
			success: data=>{
				
				
				couponInvalid.value =data.couponlistInvalid;
				
				/* if(couponlistNum=== "1"){
					couponImg.value="/21PM_moonbook_final/resources/images/icon_level_1_s.png";
				}else if(couponlistNum==="2"){
					couponImg.value="/21PM_moonbook_final/resources/images/icon_level_2_s.png";
				}else if(couponlistNum==="3"){
					couponImg.value="/21PM_moonbook_final/resources/images/icon_level_3_s.png";
				}else if(couponlistNum==="4"){
					couponImg.value="/21PM_moonbook_final/resources/images/icon_level_4_s.png";
				} */
			}
		})
		
	});
	/* 발급할 쿠폰 종류가 있으면 지정해줌 만료기간과 쿠폰이미지 */
	$(".couponCouponListNoC").change(e =>{ 
		
		let couponlistNum=$(e.target).val();
		let couponInvalid =document.getElementsByName("couponinvalid")[0];
		let couponImg=document.getElementsByName("couponImg")[0];
		
		$.ajax({
			url:"${path}/admin/searchInvalidNImg.do",
			data:{
				couponlistNum:couponlistNum,
				
			},
			success: data=>{
				couponInvalid.value =data.couponlistInvalid;
				
				/* if(couponlistNum=== "1"){
					couponImg.value="/21PM_moonbook_final/resources/images/icon_level_1_s.png";
				}else if(couponlistNum==="2"){
					couponImg.value="/21PM_moonbook_final/resources/images/icon_level_2_s.png";
				}else if(couponlistNum==="3"){
					couponImg.value="/21PM_moonbook_final/resources/images/icon_level_3_s.png";
				}else if(couponlistNum==="4"){
					couponImg.value="/21PM_moonbook_final/resources/images/icon_level_4_s.png";
				} */
			}
		})
		
	});
	
	
	function checkCouponNum(event){
		 event.preventDefault();
		couponlistNo=document.getElementsByName("couponCouponListNo")[0].value;
		
		$.ajax({
			url:"${path}/admin/searchCoupon.do",
			data:{
				couponlistNo:couponlistNo
			},
			success: data=>{
				if(data){
					$("#couponGroup").submit();
					/* return true; */
					
				}else if(!data){
					alert("발급할 쿠폰번호가 존재하지 않습니다");
					/* return false; */
				}
			}
		})
	}
	
	
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>