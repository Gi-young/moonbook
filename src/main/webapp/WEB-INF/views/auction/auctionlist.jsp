<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="auctioncateFirst" value="${auctionlist[0].auctioncate[0].auctioncateFirst }"/>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>

    <div id="wrap">
    <div id="container">
        <div class="auction_cate">
            <p><span>${param["auctioncateName"]}</span> > <span>${param["auctioncateFrist"] }</span></p>
        </div>
        <div class="auctionlist_level2">
         <c:forEach items="${auctioncate }" var="a">         
		           <c:if test="${a.auctioncateName eq param['auctioncateName']}">
		      		    <div>
		     				 <a href="${path }/auction/auctionlist?auctioncateFrist=${a.auctioncateFirst}&auctioncateName=${a.auctioncateName}">${a.auctioncateFirst }</a>
		     		    </div>
					</c:if>
         </c:forEach>
        </div>
		        <div id="auction_serach_name">
            <div>
                <form action="${path }/auction/auctionlist.do">
                	<input type="hidden" value="${auctioncateFirst}" name="auctioncateFrist">
                    <select name="type" id="">
                        <option value="auction_name">상품명</option>
                    </select>
                    <input type="text" name="keyword">
                    <input type="submit" value="검색">
                </form>
            </div>
        </div>
        <div class="auctionlist">
            <table>
            <tr>
            	<th colspan="7" style="text-align:center;">*해당 컬럼명을 클릭하면 내림차순으로 볼수 있습니다.(시작가,등록일,경매 종료일)</th>
            </tr>
                <tr>
                    <th>이미지</th>
                    <th style="width: 300px;">물품이름</th>
                    <th class="desc">시작가<span></span><input type="hidden" value="start_price"></th>
                    <th>입찰자수</th>
                    <th>현재 입찰가</th>
                    <th class="desc">등록일 <input type="hidden" value="start_date"></th>
                    <th class="desc">경매 종료일 <input type="hidden" value="end_date"></th>
<script>
	$(".desc").click(e=>{
		console.log($(e.target))
		console.log($(e.target).children("input[type=hidden]").val())
		let value=$(e.target).children("input[type=hidden]").val();
		location.replace('${path}/auction/auctionlist?auctioncateFrist=${param["auctioncateFrist"] }&auctioncateName=${param["auctioncateName"]}&desc='+value)
	})
</script>
                </tr>
                  <c:forEach items="${auctionlist }" var="a">
	                <tr>
	                 
	                   	 <td class="auctionlist_img">
	                   	 <a href="${path }/auction/acutionview?auctionNo=${a.auctionNo}">
	                   	 	<img src="${path }/resources/auction/images/${a.auctionImg[0]}" alt="리스트사진" width="150px;" height="100px;">  	 	
	                    </a>
	                    </td>
	                    
	                 	   <td class="auctionlist_title">
	                 	   <a href="${path }/auction/acutionview?auctionNo=${a.auctionNo}">${a.auctionName } </a>
	                 	   </td>
	                  
	                    <td class="auctionlist_price">${a.startPrice }</td>
	                    <td class="auctionlist_person">${a.auctionbid.size() }명</td>
	                    <td class="auctionlist_person">${a.auctionbid.size()==0?"0":a.auctionbid[0].bidPrice} </td>
	                    <td>${a.startDate }</td>
	                    <td>${a.endDate }</td>

	                </tr>
                </c:forEach>
             
            </table>
            <div class="pagebar">${pageBar }</div>

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
    vertical-align: middle;
}
.auctionlist_img{
   width: 150px;
    height: 100px;
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
.auction_cate{
	padding:10px
}

</style>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>