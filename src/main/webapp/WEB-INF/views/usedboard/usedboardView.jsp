<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>

	<link rel="stylesheet" href="${path }/resources/css/usedboard/usedboardView.css">
	
	<section id="content">
	    <article id="ar">
	        <div class="divdivv">
	            <h3 class="tit_subject">${usedboard.usedboard_Title }</h3>
	            
	            <span class="spandd">
	                <a>
		                <h3 class="memberIdBox">
			                <img alt="" width="30" height="30" src="${path }/resources/images/usedboard/2.jpg">
			                &nbsp;
			                <c:out value="${usedboard.member_Id }"/>
		                </h3>
	                </a>
	                
	                <span class="numnum">${usedboard.usedboard_Date }</span>
	            </span>
	            
	            <span class="desc_subjeck">
	                <a href="${path}/usedboard/usedboardList.do" id="gomain" role="button" class="btnbtn_1" style="font-size: 15px; cursor: pointer;">목록</a>
	                
	                <c:if test="${loginMember.memberId==usedboard.member_Id }">
	                	<a href="${path}/usedboard/usedboardUpdate.do?no=${no}" role="button" class="btnbtn_2" style="font-size: 15px;">수정</a>
	                	<a href="${path}/usedboard/usedboardDelete.do?no=${no}" id="deletebtn" role="button" class="btnbtn_2" style="font-size: 15px; cursor: pointer;">삭제</a>
	                </c:if>
	                
                	<c:if test="${loginMember!=null }">
	                	<c:if test="${usedboard.usedboard_State=='y' }">
		                	<a href="${path}/usedboard/usedboardSingo.do?no=${no}&id=${loginMember.memberId}" role="button" class="btnbtn_2" style="font-size: 15px; cursor: pointer;">신고</a>
		                </c:if>
	                </c:if>
	            </span>
	        </div>
	        
	        <center class="item-img-box">
		        <div class="view_info">
			        <div id="slider-wrap">
				        <ul id="slider">
				        	<c:forEach var="b" items="${usedboard.usedboardfiles}">
				        		<c:set var="i" value="${i+1 }"/>
						        <li>
						            <img src="${path }/resources/upload/usedboard/${usedboard.usedboardfiles[i-1].usedboardfile_Rename}">
						        </li>
				        	</c:forEach>
			        	</ul>
			        	
			        	<div class="slider-btns" id="next"><span>▶</span></div>
					    <div class="slider-btns" id="previous"><span>◀</span></div>
					
					    <div id="slider-pagination-wrap">
					        <ul>
					        </ul>
					    </div>
					</div>
				</div>
			</center>
					
            <center class="item-info-box">
	            <div id="article" style="font-size: 20px;">책제목 : ${usedboard.usedboard_BookTitle } / 가격 : ${usedboard.usedboard_Price }원 / 거래상태 : 
		            <c:if test="${usedboard.usedboard_State == 'y' }">
		            	<span style="font-size: 20px; color: red;">
		                	거래중 
		                </span>
		            </c:if>
		            <c:if test="${usedboard.usedboard_State != 'y' }">
						<span style="font-size: 20px; color: blue;">
		                	거래완료
		                </span>
		            </c:if>
	            </div>
	            
	            <div class="item-content">${usedboard.usedboard_Content }</div>
            </center>
	            
            
            
            <c:if test="${loginMember!=null }">
	            <c:if test="${usedboard.usedboard_State=='y'}">
		            <center>
			            <div class="wrap">
							<button class="button">결제하기</button>
						</div>
					</center>
				</c:if>
			</c:if>
	        
	        <div class="viewrecom">
	            <div>
	                <ul class="tab_tt">
	                    <li class="on">
	                        <a class="ahref" style="font-size: 20px;">댓글<span class="num_total">/${replycount }</span></a>
	                    </li>
	                </ul>
	                <c:forEach var="r" items="${reply }">
		                <c:if test="${r.usedcomment_Level==1 }">
			                <ul class="level1">
			                    <li>
			                        <div class="reply_div">
			                            <span class="txt_info" style="font-size: 15px;">
			                                ${r.usedcomment_UserId }
			                                <span class="txt_bar" style="font-size: 15px;">|</span>
			                                <span class="txt_num" style="font-size: 15px;">${r.usedcomment_Date }</span>
			                            </span>
			                            <strong class="reply_st">
			                                <span class="txt_de" style="font-size: 20px;">${r.usedcomment_Content }</span>
			                            </strong>
			                            <c:if test="${loginMember!=null }">
			                            <button onclick="location.assign('${path}/usedboard/deleteUsedcomment.do?usedcomment_No=${r.usedcomment_No }&usedbaord_No=${no }');" class="btn-reply" style="font-size: 20px;" value="">삭제</button>
			                            <button class="btn-reply" style="font-size: 20px;" value="${r.usedcomment_No }">답글</button>
			                            </c:if>
			                        </div>
			                    </li>
			                </ul>
		                </c:if>
		                
		                <c:forEach var="r2" items="${reply }">
			                <c:if test="${r2.usedcomment_Level==2 }">
				                <c:if test="${r2.usedcomment_CommentRef==r.usedcomment_No }">
					                <ul class="level2">
					                    <li>
					                        <div style="margin-left: 10px" class="reply_div">
					                            <span class="txt_info" style="font-size: 15px;">
					                                ㄴ ${r2.usedcomment_UserId }
					                                <span class="txt_bar" style="font-size: 15px;">|</span>
					                                <span class="txt_num" style="font-size: 15px;">${r2.usedcomment_Date }</span>
					                            </span>
					                            <strong class="reply_st">
					                                <span class="txt_de" style="font-size: 20px;">${r2.usedcomment_Content }</span>
					                            </strong>
					                            <button onclick="location.assign('${path}/usedboard/deleteUsedcomment.do?usedcomment_No=${r2.usedcomment_No }&usedbaord_No=${no }');" class="btn-reply" style="font-size: 20px;" value="">삭제</button>
					                        </div>
					                    </li>
					                </ul>
				                </c:if>
			                </c:if>
		                </c:forEach>
	                </c:forEach>
	            </div>
	            
	            <c:if test="${loginMember!=null }">
	                <div class="comment-editor">
	                    <div class="inner-comment">
	                        <form action="${path }/usedboard/insertUsedcomment.do" method="post">
	                            <textarea name="usedcomment_Content" rows="3" cols="195" style="resize: none; width: 95%; height: 50px"></textarea>
	                            <input type="hidden" name="usedcomment_Level" value="1">
	                            <input type="hidden" name="usedbaord_No" value="${no }">
	                            <input type="hidden" name="usedcomment_CommentRef" value="0">
	                            <c:if test="${loginMember!=null }">
	                            	<input type="hidden" name="usedcomment_UserId" value="${loginMember.memberId }">
	                            </c:if>
	                            <button type="submit" value="등록" id="btn-insert">등록</button>
	                        </form>
	                    </div>
	                </div>
				</c:if>
	        </div>
	    </article>
	</section>

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		$(".button").click(function () {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp82349962');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
			pg: 'html5_inicis', // version 1.1.0부터 지원.
			/*
			'kakao':카카오페이,
			html5_inicis':이니시스(웹표준결제)
			'nice':나이스페이
			'jtnet':제이티넷
			'uplus':LG유플러스
			'danal':다날
			'payco':페이코
			'syrup':시럽페이
			'paypal':페이팔
			*/
			pay_method: 'card',
			/*
			'samsung':삼성페이,
			'card':신용카드,
			'trans':실시간계좌이체,
			'vbank':가상계좌,
			'phone':휴대폰소액결제
			*/
			merchant_uid: 'merchant_' + new Date().getTime(),
			/*
			merchant_uid에 경우
			https://docs.iamport.kr/implementation/payment
			위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			참고하세요.
			나중에 포스팅 해볼게요.
			*/
			name: '${usedboard.usedboard_BookTitle }',
			//결제창에서 보여질 이름
			amount: ${usedboard.usedboard_Price},
			//가격
			buyer_email: '${loginMember.memberEmail}',
			buyer_name: '${loginMember.memberName}',
			buyer_tel: '${loginMember.memberPhone}',
			buyer_addr: '${loginMember.memberAddress}',
			buyer_postcode: '123-456',
			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
			/*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			*/
			}, function (rsp) {
			console.log(rsp);
			if (rsp.success) {
				location.href="${path}/usedboard/usedboardPayment.do?no=${no}&title=${usedboard.usedboard_Title}&price=${usedboard.usedboard_Price}&id=${usedboard.member_Id}&impuid="+rsp.imp_uid+"&muid="+rsp.merchant_uid;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
			});
			});
	
			//slide-wrap
		var slideWrapper = document.getElementById('slider-wrap');
		//current slideIndexition
		var slideIndex = 0;
		//items
		var slides = document.querySelectorAll('#slider-wrap ul li');
		//number of slides
		var totalSlides = slides.length;
		//get the slide width
		var sliderWidth = slideWrapper.clientWidth;
		//set width of items
		slides.forEach(function (element) {
		    element.style.width = sliderWidth + 'px';
		})
		//set width to be 'x' times the number of slides
		var slider = document.querySelector('#slider-wrap ul#slider');
		slider.style.width = sliderWidth * totalSlides + 'px';
		
		// next, prev
		var nextBtn = document.getElementById('next');
		var prevBtn = document.getElementById('previous');
		nextBtn.addEventListener('click', function () {
		    plusSlides(1);
		});
		prevBtn.addEventListener('click', function () {
		    plusSlides(-1);
		});
		
		// hover
		slideWrapper.addEventListener('mouseover', function () {
		    this.classList.add('active');
		    clearInterval(autoSlider);
		});
		slideWrapper.addEventListener('mouseleave', function () {
		    this.classList.remove('active');
		    autoSlider = setInterval(function () {
		        plusSlides(1);
		    }, 3000);
		});
		
		
		function plusSlides(n) {
		    showSlides(slideIndex += n);
		}
		
		function currentSlides(n) {
		    showSlides(slideIndex = n);
		}
		
		function showSlides(n) {
		    slideIndex = n;
		    if (slideIndex == -1) {
		        slideIndex = totalSlides - 1;
		    } else if (slideIndex === totalSlides) {
		        slideIndex = 0;
		    }
		
		    slider.style.left = -(sliderWidth * slideIndex) + 'px';
		    pagination();
		}
		
		//pagination
		slides.forEach(function () {
		    var li = document.createElement('li');
		    document.querySelector('#slider-pagination-wrap ul').appendChild(li);
		})
		
		function pagination() {
		    var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
		    dots.forEach(function (element) {
		        element.classList.remove('active');
		    });
		    dots[slideIndex].classList.add('active');
		}
		
		pagination();
		var autoSlider = setInterval(function () {
		    plusSlides(1);
		}, 3000);
		
		
		$(".btn-reply").click(e=>{
			const ul=$("<ul>");
			const form=$(".inner-comment>form").clone();
			form.find("textarea").attr("rows","1");
			form.find("textarea").attr("cols","95");
			form.find("textarea").attr("name","usedcomment_Content");
			form.find("[name=usedcomment_Level]").val("2");
			form.find("[name=usedcomment_CommentRef]").val($(e.target).val());
			form.find("[name=usedbaord_No]").val(${no});
			console.log(${no});
			form.find("button").removeAttr("id").addClass("btn-insert2");
			console.log($(e.target).val());
			const li=$("<li>").attr("colspan","2");
			ul.append(li.append(form));
			ul.find("li").css("display","none");
			
			ul.insertAfter($(e.target).parents("ul")).children("li").slideDown(800);
			
			$(e.target).off("click");
		});
	</script>
	
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"></jsp:include>