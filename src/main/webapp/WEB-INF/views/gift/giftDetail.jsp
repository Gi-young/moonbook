<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value=""/>
</jsp:include>      
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문곰책방 | 문곰템</title>
    <link rel="stylesheet" href="${path }/resources/css/gift/giftDetail.css">
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/plugin/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/plugin/slick/slick-theme.css"/>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/plugin/slick/slick.js"></script>
 <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="${path }/resources/js/gift/gift_detail.js"></script>
</head>
<!-- 문곰템의 모든 상품의 상세 보기는 여기서 -->
<body>
    <div class="wrap">
        <div class="hotTracks">
            <!-- 상단 핫트랙스 메뉴바 -->
            <div class="category-open">
                <img src="${path }/resources/images/gift/기프트헤더로고.png" alt="" style="height: 50px;">
            </div>
            <div class="hotTracks-menu">
                <ul>
                    <!-- 페이지 전환할 때 스크립트로 전환 -->
                    <li>
                        <a style="color:#696969;" class="hot" href="#">전자기기</a>
                    </li>
                    <p>·</p>
                    <li>
                        <a style="color:#696969;" class="hot" href="#">수납/정리</a>
                    </li>
                    <p>·</p>
                    <li>
                        <a style="color:#696969;" class="hot" href="#">독서 필수템</a>
                    </li>
                    <p>·</p>
                    <li>
                        <a style="color:#696969;" class="hot" href="#">잡화</a> 
                    </li>
                </ul>
            </div>
        </div>
        <div class="crossLine1"></div>
        <div class="proDetail-box">
            <div class="proDetail-img">
                <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
                <!-- 400x400 -->
                <div class="detailImg-box">
                    <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
                </div>
            </div>
            <div class="proDetail-exp">
                <p class="expTitle">[퍼펙트] 10분 플래너 100DAYS - 인피니티 </p>
                <div class="crossLine2"></div>
                <div class="expChoice">
                    <div>
                        <p>포인트 적립</p>
                    </div>
                    <div class="exp-couponBox">
                        <p>쿠폰등록</p>
                        <input type="button" value="내 쿠폰" name="coupon" id="coupon" onclick="window.open('${path}/gift/myCoupon.do','내 쿠폰','width=430, height=500, location=no, status=no, scrollbars=yes')">
                    </div>
                    <div class="exp-quanBox">
                        <p>구매수량</p>
                        <div class="exp-quan">
                            <input type="number" name="quan" id="quan" value="1" maxlength="3" min="1">
                            <span>
                                <a href=""></a>
                                <!-- 클릭시 수량 증가 -->
                                <a href=""></a>
                                <!-- 클릭시 수량 감소 -->
                            </span>
                            <span>개</span>
                        </div>
                    </div>
                </div>
                <div class="discount-price">
                    <p class="discount">할인율</p>
                    <p class="price">가격</p>
                </div>
                <div class="crossLine2"></div>
                <div class="purBtn-box">
                    <button>구매하기</button>
                    <button>장바구니</button>
                    <button>찜하기</button>
                </div>
                <div style="text-align: center; margin-top: 30px;">
                    <button class="naverPay" id="kakaoPay">[간편결제] 카카오페이</button>
                </div>
            </div>
        </div>
        <div class="crossLine3"></div>
        <div class="wrap">
            <div class="reco-product">
                <p class="reco-product-font">함께 볼 만한 문곰템</p>
            </div>
            <div id="slider-div">
                <div class="reco-content">
                    <img src="${path }/resources/images/gift/만년필1.jpg" alt="">
                    <p class="productName">독일산 만년필</p>
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/images/gift/만년필2.jpg" alt="">
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/images/gift/만년필3.jpg" alt="">
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/images/gift/만년필4.jpg" alt="">
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/images/gift/만년필1.jpg" alt="">
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/images/gift/만년필2.jpg" alt="">
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/images/gift/만년필3.jpg" alt="">
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/images/gift/만년필4.jpg" alt="">
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
    </div>
        <div class="crossLine3"></div>
        <div class="proDetail-bar">
            <p id="bar1">상품설명</p>
            <p id="bar2">상품리뷰</p>
            <p id="bar3">상품Q&A</p>
            <p id="bar4">알려드립니다</p>
        </div>
        <div class="product-exp">
            <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
            <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
            <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
            <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
        </div>
        <div class="product-review">
            <div class="writeBox">
                <button class="reviewWrite">상품 리뷰 작성하기</button>
            </div>
           <table class="review-exp">
               <tr>
                   <th style="width:105px;">번호</th>
                   <th style="width:145px;">만족도</th>
                   <th style="width:370px;">상품평</th>
                   <th style="width:165px;">작성자</th>
                   <th style="width:165px;">작성일</th>
               </tr>
               <tr class="review-text">
                   <td>0</td>
                   <td class="gpa">
                    <div class="gpa-circle">
                        <p>3</p>
                    </div>    
                </td>
                    <td>
                       <div class="review">
                        제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                       </div>
                    </td>
                   <td>관리자</td>
                   <td>SYSDATE or 수정일</td>
                </tr>
                <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                        <div class="gpa-circle">
                            <p>3</p>
                        </div>    
                    </td>
                    <td>
                        <div class="review">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                </tr>
                <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                        <div class="gpa-circle">
                            <p>3</p>
                        </div>    
                    </td>
                    <td>
                        <div class="review">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                </tr>
                <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                        <div class="gpa-circle">
                            <p>3</p>
                        </div>    
                    </td>
                    <td>
                        <div class="review">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                </tr>
                <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                        <div class="gpa-circle">
                            <p>3</p>
                        </div>    
                    </td>
                    <td>
                        <div class="review">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                </tr>
                <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                        <div class="gpa-circle">
                            <p>3</p>
                        </div>    
                    </td>
                    <td>
                        <div class="review">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                </tr>
                <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                        <div class="gpa-circle">
                            <p>3</p>
                        </div>    
                    </td>
                    <td>
                        <div class="review">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                </tr>
                <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                        <div class="gpa-circle">
                            <p>3</p>
                        </div>    
                    </td>
                    <td>
                        <div class="review">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                </tr>
                <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                        <div class="gpa-circle">
                            <p>3</p>
                        </div>    
                    </td>
                    <td>
                        <div class="review">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                </tr>
            </table>
            <div>&lt;pageBar&gt;</div>
        </div>
        <!-- 상품Q&A -->
        <div class="product-q_a">
            <div class="writeBox">
                <button class="reviewWrite">상품 리뷰 작성하기</button>
            </div>
            <table class="review-exp">
                <tr>
                    <th style="width:105px;">번호</th>
                    <th style="width:145px;">만족도</th>
                    <th style="width:370px;">상품평</th>
                    <th style="width:165px;">작성자</th>
                    <th style="width:165px;">작성일</th>
                </tr>
                <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                     <div class="gpa-circle">
                         <p>3</p>
                     </div>    
                 </td>
                     <td>
                        <div class="review">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                 </tr>
                 <tr class="review-text">
                     <td>0</td>
                     <td class="gpa">
                         <div class="gpa-circle">
                             <p>3</p>
                         </div>    
                     </td>
                     <td>
                         <div class="review">
                          제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                         </div>
                      </td>
                     <td>관리자</td>
                     <td>SYSDATE or 수정일</td>
                 </tr>
                 <tr class="review-text">
                     <td>0</td>
                     <td class="gpa">
                         <div class="gpa-circle">
                             <p>3</p>
                         </div>    
                     </td>
                     <td>
                         <div class="review">
                          제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                         </div>
                      </td>
                     <td>관리자</td>
                     <td>SYSDATE or 수정일</td>
                 </tr>
                 <tr class="review-text">
                     <td>0</td>
                     <td class="gpa">
                         <div class="gpa-circle">
                             <p>3</p>
                         </div>    
                     </td>
                     <td>
                         <div class="review">
                          제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                         </div>
                      </td>
                     <td>관리자</td>
                     <td>SYSDATE or 수정일</td>
                 </tr>
                 <tr class="review-text">
                     <td>0</td>
                     <td class="gpa">
                         <div class="gpa-circle">
                             <p>3</p>
                         </div>    
                     </td>
                     <td>
                         <div class="review">
                          제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                         </div>
                      </td>
                     <td>관리자</td>
                     <td>SYSDATE or 수정일</td>
                 </tr>
                 <tr class="review-text">
                     <td>0</td>
                     <td class="gpa">
                         <div class="gpa-circle">
                             <p>3</p>
                         </div>    
                     </td>
                     <td>
                         <div class="review">
                          제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                         </div>
                      </td>
                     <td>관리자</td>
                     <td>SYSDATE or 수정일</td>
                 </tr>
                 <tr class="review-text">
                     <td>0</td>
                     <td class="gpa">
                         <div class="gpa-circle">
                             <p>3</p>
                         </div>    
                     </td>
                     <td>
                         <div class="review">
                          제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                         </div>
                      </td>
                     <td>관리자</td>
                     <td>SYSDATE or 수정일</td>
                 </tr>
                 <tr class="review-text">
                     <td>0</td>
                     <td class="gpa">
                         <div class="gpa-circle">
                             <p>3</p>
                         </div>    
                     </td>
                     <td>
                         <div class="review">
                          제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                         </div>
                      </td>
                     <td>관리자</td>
                     <td>SYSDATE or 수정일</td>
                 </tr>
                 <tr class="review-text">
                     <td>0</td>
                     <td class="gpa">
                         <div class="gpa-circle">
                             <p>3</p>
                         </div>    
                     </td>
                     <td>
                         <div class="review">
                          제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                         </div>
                      </td>
                     <td>관리자</td>
                     <td>SYSDATE or 수정일</td>
                 </tr>
             </table>
             <div>&lt;pageBar&gt;</div>
        </div>
        <div class="notify">
            <img src="${path }/resources/images/gift/교환반품1.PNG" alt="">
            <img src="${path }/resources/images/gift/교환반품2.PNG" alt="">
            <img src="${path }/resources/images/gift/교환반품3.PNG" alt="">
            <img src="${path }/resources/images/gift/교환반품4.PNG" alt="">
            <img src="${path }/resources/images/gift/교환반품5.PNG" alt="">
        </div>
    </div>
</div>
    <!-- <div class="slide-wrap">
        <div class="product-slide">
            <ul class="slickTest">
                <li>slide1</li>
                <li>slide2</li>
                <li>slide3</li>
                 <li class="product-slideContent">
                    <div class="reco-product">
                        <img src="" alt="">
                    </div>
                    <div class="reco-product">
                        
                    </div>
                    <div class="reco-product">
                        
                    </div>
                    <div class="reco-product">
                        
                    </div>
                </li>
            </ul>
        </div> -->
	<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
		<jsp:param name="" value=""/>
	</jsp:include>

     <jsp:include page="/WEB-INF/views/common/quickBar.jsp">
			<jsp:param name="" value=""/> 
	 </jsp:include>    
<script>
      $('#slider-div').slick({
          slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
          infinite : true, 	//무한 반복 옵션	 
          slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
          slidesToScroll : 2,		//스크롤 한번에 움직일 컨텐츠 개수
          speed : 500,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
          arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
          dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
          autoplay : true,			// 자동 스크롤 사용 여부
          autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
          pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
          vertical : false,		// 세로 방향 슬라이드 옵션
          prevArrow : "<button type='button' class='slick-prev'>⊲</button>",		// 이전 화살표 모양 설정
          nextArrow : "<button type='button' class='slick-next'>⊳</button>",		// 다음 화살표 모양 설정
          dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
          draggable : true, 	//드래그 가능 여부 
        //   centerMode : true,
        //   variableWidth : true,
        //   focusOnSelect : true,
          pauseOnHover : true
          /* responsive: [ // 반응형 웹 구현 옵션
              {  
                  breakpoint: 1350, //화면 사이즈 960px
                  settings: {
                      //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                      slidesToShow:3 
                  } 
              },
              { 
                  breakpoint: 950, //화면 사이즈 768px
                  settings: {	
                      //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                      slidesToShow:2 
                  } 
              }
          ] */

      });
    let slickBtn = $('.slick-dots li>button');
    console.log(slickBtn);
    $(slickBtn).click(function(){
        $(this).css('transform',"rotate( 90deg )");
        $(this).css('transition',"all ease 0.5s");
    })
    let hot = $('.hot');
    console.log(hot);
    $(hot).mouseover(function(){
        $(this).css("color","black");
    })
    $(hot).mouseout(function(){
        $(this).css("color","#696969");
    })
    $("#kakaoPay").click(function(){
    	$.ajax({
    		url: '${path}/kakaopay.do',
    		dataType:'json',
    		success:function(data){   			
    			console.log("정상 실행 : "+data.tid);
    			window.open(data.next_redirect_pc_url);
    		},
    		error:function(error){
    			console.log("에러 : "+error);
    		}  		
    	})
    });
</script>
</body>
</html>
