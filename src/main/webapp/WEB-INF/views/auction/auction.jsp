<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<div id="wrap">
<div id="container">
        <div class="auction_main line">
            <div class="auction_main_left line">배너</div>
            <div class="auction_main_right line">
            	<h2>정보란</h2>
            	<c:choose>
            	<c:when test="${sessionScope.loginMember!=null }">
 		
                <p><span>${member.memberName}</span>님 환영합니다.</p>
                <p>경매 포인트 :<span><fmt:formatNumber value="${member.memberPoint }" type="currency"/>point</span> </p> 
                <button onclick="location.assign('${path}/auction/auctionpay.do')">포인트 충전하기</button>
                <button onclick="location.assign('${path}/auction/auctionwrite.do')">물픔 등록하기</button>
                <button onclick="location.assign('${path}/auction/auctionmyselllist.do?memberId=${member.memberId} ')">내 판매 목록 확인</button>
   			    <button onclick="location.assign('${path}/auction/auctionmybuylist.do?bidId=${member.memberId} ')">내 구매 목록 확인</button>	
    		    </c:when>
    		    <c:otherwise>
    		    	<p style="font-size:12px">로그인후 이용가능합니다.</p>
    		    	<button>로그인</button>
    		    </c:otherwise>
              </c:choose>
            </div>
        </div>
        
        <div class="acution_category">
            
            <div class="acution_category_left">
                <div>
                    <a href="">도서</a>
                    <div>
       			      <c:forEach items="${auctioncate }" var="a">
	                    	<c:if test="${a.auctioncateName=='도서' }">
	                    		 <a href="${path }/auction/auctionlist?auctioncateFrist=${a.auctioncateFirst}&auctioncateName=${a.auctioncateName}">${a.auctioncateFirst }</a>
	     					</c:if>
	                   </c:forEach>
                    </div>                   
                </div>

                <div>
                    <a href="">문구</a>
                    <div>
       			      <c:forEach items="${auctioncate }" var="a">
	                    	<c:if test="${a.auctioncateName=='문구' }">
	                    		 <a href="${path }/auction/auctionlist?auctioncateFrist=${a.auctioncateFirst}&auctioncateName=${a.auctioncateName}">${a.auctioncateFirst }</a>
	     					</c:if>
	                   </c:forEach>
                    </div>                   
                </div>

                <div>
                    <a href="">기타</a>
                    <div>
                       <c:forEach items="${auctioncate }" var="a">
	                    	<c:if test="${a.auctioncateName=='기타' }">
	                    		 <a href="${path }/auction/auctionlist?auctioncateFrist=${a.auctioncateFirst}&auctioncateName=${a.auctioncateName}">${a.auctioncateFirst }</a>
	     					</c:if>
	                   </c:forEach>
                    </div>                   
                </div>
               
    
            </div> 


        </div>
        

        <!--입찰자가 많은 순-->
        <div class="auction_main_po">
            <h2 class="auction_main_title">마감 임박 매물</h2>
          
            <%int num=0; %>
            <c:forEach var="t" items="${timelist }">
	            <div style="display: flex;" class="line">
	                <div class="auction_main_po_img">
	                    <a href="${path }/auction/acutionview?auctionNo=${t.auctionNo}">
	                    <img src="${path }/resources/auction/images/${t.auctionImg[0]}" alt="#">
	                    </a>
	                </div>
	                <div class="auction_main_po_center">
	                  	<a href="${path }/auction/acutionview?auctionNo=${t.auctionNo}">
	                   		 <strong>${t.auctionName} </strong>
	                    </a>
	                
						<input type="hidden" value="${t.endDate }" name="timestemp">
	                    <p class="countdown">마감까지 남은 시간 : <span id="countdown<%=num++ %>" style="font-size:20px"></span></p>
	                    <p>경매시작 가격 : <span>${t.startPrice }</span></p>
	                    <p>입찰 인원 수: <span>${t.auctionbid.size()}</span></p>
	                    <p class="">바로 구매 : <span>${t.buyNow }</span></p>   
	                </div>
	                <div class="auction_main_po_right">
	                    <div class="btn1" onclick="open('${path}/auction/actionbid.do?auctionNo=${t.auctionNo }','auctionbid','width=500,height=600')">입찰하기</div>
	                      <div class="btn1" onclick="open('${path}/auction/actionbuyNow.do?auctionNo=${t.auctionNo }','auctionbuynow','width=500,height=600')">바로구매</div> 
	                </div>
	            </div>
            </c:forEach>

            <div class="pagebar">${pageBar }</div>
        </div>

        <!--마감 직전 경매물품-->
   
        <div class="auction_main_de">
               <h2 class="auction_main_title">인기 매물</h2>
           
             <c:forEach var="t" items="${poplist }">
	            <div style="display: flex;" class="line">
	                <div class="auction_main_po_img">
	                    <img src="${path }/resources/auction/images/${t.auctionImg[0]}" alt="#">
	                </div>
	                <div class="auction_main_po_center">
	                    <strong>${t.auctionName} </strong>
	       
						<input type="hidden" value="${t.endDate }" name="timestemp">
	                    <p class="countdown">마감까지 남은 시간 : <span id="countdown<%=num++ %>" style="font-size:20px"></span></p>
	                    <p>경매시작 가격 : <span>${t.startPrice }</span></p>
	                    <p>입찰 인원 수: <span>${t.count}</span></p>
	                    <p class="">바로 구매 : <span>${t.buyNow }</span></p>   
	                </div>
	                <div class="auction_main_po_right">
	                    <div class="btn1" onclick="open('${path}/action/actionbid.do?auctionNo=${t.auctionNo }','auctionbid','width=500,height=600')">입찰하기</div>
	                    <div class="btn1" onclick="open('${path}/action/actionbuyNow.do?auctionNo=${t.auctionNo }','auctionbuynow','width=500,height=600')">바로구매</div> 
	                </div>
	            </div>
            </c:forEach>




        </div>


    </div>
</div>

    <script>
     $(function(){
            $(".acution_category_left>div").hover((e)=>{
                $(e.target).next('div').show();
            },(e)=>{
                if($(".acution_category_left>div>div").not().hover()){
                    $(".acution_category_left>div>div").hide();
                }
            })
        })
        
          function CountDownTimer(dt, id)
                        {
                        var end = new Date(dt);

                        var _second = 1000;
                        var _minute = _second * 60;
                        var _hour = _minute * 60;
                        var _day = _hour * 24;
                        var timer;

                        function showRemaining() {
                        var now = new Date();
                        var distance = end - now;
                        if (distance < 0) {

                        clearInterval(timer);
                        document.getElementById(id).innerHTML = '종료되었습니다!';

                        return;
                        }
                        var days = Math.floor(distance / _day);
                        var hours = Math.floor((distance % _day) / _hour);
                        var minutes = Math.floor((distance % _hour) / _minute);
                        var seconds = Math.floor((distance % _minute) / _second);

                        document.getElementById(id).innerHTML = days + '일 ';
                        document.getElementById(id).innerHTML += hours + '시간 ';
                        document.getElementById(id).innerHTML += minutes + '분 ';
                        document.getElementById(id).innerHTML += seconds + '초';
                        }

                        timer = setInterval(showRemaining, 1000);
                        }
    
     				$("input[name=timestemp]").each((i,v)=>{
     					 CountDownTimer($(v).val(), 'countdown'+i);
     				})
                  
                 
    </script>
    <style>
table{
	border-collapse: separate;
    text-indent: initial;
    border-spacing: 2px;
}
th{
	   vertical-align: middle;
 	 display: table-cell;
    font-weight: bold;
    text-align: -internal-center;	
}
a{
    text-decoration: none;
}
#wrap{
	text-align:center;
}
#container{
	text-align: left;
    width: 950px;
    border: 1px solid black;
	display: inline-block;
}
.line{
    border: 1px solid black;
}
.auction_main{
    padding: 10px;
    display: flex;
}
.auction_main_left{
    width: 800px;
    height: 300px;
}
.auction_main_right{
    width: 200px;
    height: 300px;
}
.acution_category{
    margin-top: 10px;
    padding: 10px;
}
.acution_category_left{
    width: 100%;
    margin-bottom: 15px;
}
.acution_category_left>div>a{
    font-size: 20px;
    padding: 10px 30px 10px 30px;
    font-weight: bolder;
    text-align: center;
    border: 1px solid black;
    margin-right: 0px;
}
.acution_category_left>div{
    position: relative;
    display: inline-block;
}
.acution_category_left>div>div{
    padding: 10px 30px 10px 30px;
    display: none;
    width: 500px;
    position: absolute;
    top: 37px;
    border: 1px solid silver;
    z-index: 10;
    background-color: white;
}
.acution_category_left>div>div>a{
    text-align: center;
    padding: 10px;
}
.acution_category_left>div>div>a:hover{
    color: blue;
    border: 1px solid blue;
}
#auction_serach_name>div{
   text-align: right;
}
.auction_main_po_img{
	width:180px;
	height:180px;
}
.auction_main_po_img img{
    width: 180px;
    height: 180px;
    border: 1px solid black;
}
.auction_main_po_center{
    width: 550px;
    padding: 10px;
}
.auction_main_po_center p{
	margin:10px;
    padding: 0px;
    font-size: 12px;
    font-weight: bold;
}
.auction_main_title{
    text-align: center;
    padding: 15px;
    border:1px solid black;
    border-radius: 10px;
    font-weight: bolder;
    font-size: 20px;
}
.auction_main_po_right{
    margin-left: 40px;
}
.btn1{
    margin: 10px;
    padding: 10px 20px 10px 20px;
    color: white;
    background-color: teal;
    text-align: center;
    font-weight: bolder;
    border: 1px solid black;
}
.pagebar{
    text-align: center;
}



/*===========옥션 리스트=============*/
.auctionlist_level2{
    border: 1px solid black;
    height: 150px;
    flex-wrap: wrap;
    display: flex;
}
.auctionlist_level2 div{
    text-align: center;
    width: 215px;
    background-color: white;
    font-size: 12px;
    font-weight: bold;
    padding: 20px 10px 20px 10px;
}
.auctionlist_level2 div a{
    font-size: 15px;
    font-weight: bold;
}
.auctionlist>table{
    width: 100%;
    border: 1px;
}
.auctionlist table tr td{
    border-right: silver 1px dotted;
}
.auctionlist_img{
    text-align: center;
}
.auctionlist_img>img{
    width: 150px;
    height: 100px;
}
.auctionlist_person{
    text-align: right;
}

/*옥션 view*/

.auctionview_left>img{
    width: 250px;
    height: 250px;
}
.auctionview_right{
    width: 800px;
    margin-left: 10px;
}
.auctionview_right p{
   padding: 0px;
   margin: 0px;
   font-weight: bold;
   font-size: 12px;
}
.auctionview_right h2{
    font-size: 17px;
    padding: 0px;
    margin: 0px;
}
.auctionview_right div{
    border-bottom: 1px solid black;
}
.auctionview_btn{
    height: 40px;
    margin: 20px;
}

.auctionview_btn a{
    text-align: center;
    width: 25%;
    border: 1px solid black;
    padding: 10px 20px 10px 20px;
    background-color: chartreuse;
    color: white;
}


.auction_buy_now{
    color: red;
    font-size: 15px;
}

.auctionwrite_submit{
    text-align: center;
}
span{
    font-size: 12px;
}
.auctionwrite>table>tbody>tr>th{
    background-color: yellow;

}
.countdown{
	font-size:20px;
	font-weight: bolder;
	
}

</style>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>