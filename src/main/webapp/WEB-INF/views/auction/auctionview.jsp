<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  


<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
${auction }
		<c:set var="a" value="${auction }"/>
   <div id="wrap">
    <div id="container">
        <div>
            <p><span>${a.auctioncate[0].auctioncateName }</span> > <span>${a.auctioncate[0].auctioncateFirst }</span> > <span>${a.auctionName }</span></p>
        </div>


        <div style="display: flex;">
            <div class="auctionview_left line">
                <img src="${path }/resources/auction/images/${a.auctionImg[0]}" alt="">
            </div>
            <div class="auctionview_right">
                <div>
                    <h2>경매 정보</h2>
                    <p>경매 시작일 : <span>${a.startDate } </span></p>
                    <p>경매 종료일: <span>${a.endDate } </span></p>
                    <p>남은 시간: <span></span></p>
                    <p>입찰자수: <span>${a.auctionbid.size() } </span> 명</p>
                    <p>최고 입찰자 <span>입찰자 id</span></p>
                    <p>판매자 id:<span>${a.memberId }</span></p> 
                </div>
                <div>
                    <h2>가격 정보</h2>
                    <p>경매 시작가 : <span>${a.startPrice } </span></p>
                    <p>응찰 단위: <span>${a.priceUnit } </span></p>
                    <p>현재 최고가: <span>${a.auctionbid.size()==0?"입찰자 없음":""}</span></p>
                    <p>즉시 구매가격: <span class="auction_buy_now">10000 </span>원</p>
                    <p>입찰가능 가격 <span>0 </span> 명</p>
                </div>

                <div class="auctionview_btn">
                    <a href="">입찰하기</a>
                    <a href="">즉시 구매</a>
                </div>
                
            </div>
        </div>

        <div>
            <h2>물품 이미지</h2>
                <div>
                    <img src="" alt="">
                    <img src="" alt="">
                    <img src="" alt="">
                </div>
            <div>
                <h2>물품 설명</h2>
                <p>
                    ${a.auctionEx }
                </p>
            </div>

            <div>
                <h2>물품 상태</h2>
                <p>
                    본문내용
                </p>
            </div>

            <div>
                <h2>물품 크기/무게</h2>
                <p>
                    본문내용
                </p>
            </div>
        </div>
    </div>
    </div>
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
    padding: 4px;
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