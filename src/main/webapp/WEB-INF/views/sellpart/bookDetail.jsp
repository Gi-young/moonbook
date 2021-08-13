<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.rar.khbook.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
    <link rel="stylesheet" href="${path }/resources/css/bookdetail/bookdetail.css">
 <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<style>
a {
	text-decoration: none;
}

ul {
	list-style: none;
}

.contenttitle {
	font-weight: bold;
}

.moreview {
	float: right;
	font-size: 12px;
}

.wrap {
	min-width: 950px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#container {
	width: 950px;
	display: flex;
}

.leftlongbanner {
	width: 168px;
	height: 100%;
}

.lev1add div {
	border: #582810 3px solid;
}

.lev1add div:not(:first-child) {
	border-left: none;
}

.line {
	/* border: #582810 1px solid;  */
	
}

.main_sub_title {
	position: relative;
}

.main_sub_title:hover {
	/* border: 1px #582810 solid; */
	border-right: none;
}

.main_sub_title {
	list-style: none;
	margin-top: 10px;
}

.main_sub_title>a {
	padding: 7px 20px 4px 15px;
	position: relative;
}

.layer {
	position: absolute;
	top: -5px;
	width: 100%;
	left: 100%;
	padding: 3px 0;
	border-bottom: 1px solid silver;
	background-color: #fff;
}

.layer>li {
	list-style: none;
	border-bottom: silver 1px solid;
}

.layer>li:hover {
	border: 1px solid #582810;
}

#main_snb>ul {
	padding: 10px 0;
	z-index: 100;
	border: #582810 1px solid;
	border-top: 1px solid #e2e5ee;
}

#main_sub>ul>li {
	list-style: none;
	width: 100px;
}

.main_ul>li>ul>li {
	font-family: '한컴 말랑말랑', '돋움';
	font-size: 16px;
	padding-top: 3px;
	padding-bottom: 3px;
}

#main_snb {
	width: 168px;
	height: auto;
	font-family: '한컴 말랑말랑', '돋움';
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

#main_snb>h2 {
	margin: 0px;
	padding: 20px;
	background-color: rgb(255, 255, 255);
	text-align: center;
}

.content-todaybook {
	/* width: 168px;
    height: auto; */
	font-family: '한컴 말랑말랑', '돋움';
	font-size: 15px;
	text-align: center;
}

.content-todaybook>ul>li {
	background-image: url("../sellpart/selllevel1/todayinner.png");
}

.content-todaybook>ul>li:not(:first-child) {
	border-top: none;
}

.content-todaybook>ul>li:hover {
	background-image: url("../sellpart/selllevel1/lev1add2gold.png");
}

.content-todaybook li {
	border: 3px solid #582810;
}

#content_ad_banner {
	display: flex;
}

#content_ad_banner>div>img {
	width: 255px;
	height: 128px;
}

.on {
	display: none;
}

.content {
	width: 768px;
	height: 290px;
	margin-top: 20px;
}

#today_book {
	margin-top: 5px;
	height: 300px;
	display: flex;
}

.today_book_form {
	margin: 10px;
	width: 132px;
	height: 250px;
	border: 1px solid #582810;
}

#bookpagebar {
	overflow: hidden;
	display: flex;
	width: 800px;
	padding: 00px 30px 0px 30px;
}

.today_book_form>img {
	width: 92px;
	height: 132px;
}

.main_sub_title>ul {
	z-index: 10;
}

.content-body {
	flex-wrap: wrap;
	display: flex;
}

.content-title {
	padding: 10px;
}

.content-body>div {
	margin-left: 10px;
	margin-top: 0px;
}

#serach-form {
	display: inline-block;
}

#level_container {
	width: 950px;
}

#level_cho {
	margin: 10px;
	padding: 10px;
	border-bottom: 1px solid #582810;
}

#level_cho>div {
	position: relative;
	display: inline-block;
	border: 1px solid #582810;
	font-size: 12px;
}

#level_cho div div {
	top: 21px;
	position: absolute;
	display: flex;
	border: 1px solid #582810;
	background-color: white;
	text-align: center;
	padding: 0px;
	margin: 0px;
}

#level_cho div ul li {
	border-right: 1px solid silver;
	list-style: none;
	width: 60px;
}

#level_cho div ul li:hover {
	background-color: whitesmoke;
	border: 1px solid #582810;
}

.level_catagory_cho {
	text-align: center;
	width: 100px;
	height: 20px;
}

.level_catagory_cho div ul {
	display: inline-block;
	margin: 0px;
	padding: 5px;
}

#banner div {
	margin: 10px;
}

#banner {
	display: flex;
}

#banner_left {
	width: 768px;
	height: 290px;
}

#banner_right {
	width: 163px;
	height: 290px;
}

#btn_chose>ul {
	width: 850px;
	height: 50px;
	list-style: none;
	text-align: center;
}

#btn_chose>ul>li {
	display: list-item;
	width: 25%;
	float: left;
	background-color: blue;
}

#btn_chose>ul>li>span {
	display: block;
	border: 1px solid #e5e5e5;
	border-bottom: none;
	background: #fafafa;
	font-weight: bold;
	height: 42px;
	line-height: 44px;
	transition: all 0.2s linear;
}

#btn_chose2>ul {
	width: 850px;
	height: 50px;
	list-style: none;
	text-align: center;
}

#btn_chose2>ul>li {
	display: list-item;
	width: 20%;
	float: left;
	background-color: blue;
}

#btn_chose2>ul>li>span {
	display: block;
	border: 1px solid #e5e5e5;
	border-bottom: none;
	background: #fafafa;
	font-weight: bold;
	height: 42px;
	line-height: 44px;
	transition: all 0.2s linear;
}

#select_bar {
	margin: 10px;
	padding: 10px;
	border-bottom: 1px solid #582810;
}

#select_bar>p {
	display: inline-block;
	margin: 0px;
	font-size: 12px;
	font-family: dotum, sans-serif;
	color: #666;
	line-height: 1.2em;
}

.btn_1 {
	padding: 2 10 10 2px;
	border: 1px solid #582810;
	color: blue;
	font-weight: bold;
	background-color: white;
}

.booklist {
	display: flex;
	width: 100%;
}

.booklist_img {
	width: 115px;
	height: 166px;
}

.booklist_ex {
	width: 576px;
	margin-left: 10px;
}

.booklist_ex>p {
	padding: 0px;
	margin: 0px;
	white-space: normal;
}

.booklist_btn {
	padding: 5px;
	margin-left: 50px;
	width: 118px;
}

.booklist_btn>div {
	text-align: center;
	font-size: 15px;
	color: white;
	border: 1px solid #582810;
	margin-top: 3px;
	background-color: #582810;
	font-weight: bold;
}

.bookView_img {
	text-align: center;
	width: 200px;
	height: 569px;;
}

.bookView_img>img {
	width: 200px;
	height: 300px;
}

.bookView_img>ul {
	list-style: none;
	display: inline-block;
	margin: 0px;
	padding: 0px;
}

.bookView_img>ul>li {
	display: inline-block;
	font-size: 12px;
	padding-right: 5px;
}

.bookView_img>div>a {
	border: 1px solid #582810;
	background-color: #582810;
	color: white;
	padding: 1px 30px 1px 30px;
}

.bookView_img>ul>li:first-child {
	border-right: 1px #582810 solid;
}

.bookView_order {
	width: 758px;
}

.bookView_order>div {
	margin: 10px;
	border-bottom: 1px solid #582810;
}

.bookView_order>div>h2 {
	margin: 0px;
	margin-bottom: 10px;
}

.bookView_order>div>p {
	margin: 0px;
}

.bookView_order>div>span:not(:last-child) {
	border-right: 1px solid #582810;
	padding: 0px 10px 0px 10px;
}

.bookView_order>div:not(h2) {
	font-size: 12px;
	font-weight: bold;
}

.bookView_order>div>a {
	margin-top: 10px;
	padding: 15px 40px 15px 40px;
	background-color: #582810;
	color: white;
	text-align: center;
}

.bookView_order>div:last-child {
	padding: 20px 0px 50px 0px;
}

.bookView_info_left {
	width: 751px;
}

.bookView_info_right {
	width: 200px;
}

.bookView_info_left_btn {
	width: 750px;
}

.bookView_info_left_btn a {
	padding: 10px;
	border: 1px solid rgb(128, 125, 125);
	display: block;
	float: left;
	width: 128px;
	text-align: center;
	font-weight: bold;
	font-size: 12px;
	text-decoration: none;
}

.bookView_info_left_btn a:hover {
	background-color: rgb(133, 131, 131);
}

.bookView_info_left_event>div {
	padding: 10px;
	margin: 10px;
}

.bookView_info_left_event>div>div>img {
	width: 165px;
	height: 100px;
}

.bookView_info_left_product {
	padding-top: 40px;
}

#table_div {
	padding: 30px;
}

#table_1 {
	border: 1px solid silver;
	border-collapse: collapse;
	border-spacing: 0;
	font-size: 12px;
}

#table_1 tr th {
	border: 1px solid silver;
	width: 124px;
	text-align: center;
}

#table_1 tr td {
	border: 1px solid silver;
	width: 560px;
}

#review_list {
	padding: 15px;
	font-size: 13px;
	border-top: 1px #582810 solid;
}

#review_list>div {
	margin: 10px;
	border-bottom: silver dotted 1px;
}

.pagebar {
	text-align: center;
}

/*배너 박스 만들기*/
#banner_container {
	position: relative;
	display: flex;
}

.banner_cho_box ul {
	padding: 0px;
	margin: 0px;
}

.banner_cho_box ul li a {
	width: 190px;
	position: relative;
	display: inline-block;
	list-style: none;
	background-color: #E5E2DB;
	border: #adadad 1px solid;
	color: #582810;
	font-weight: bold;
	font-style: inherit;
	text-align: center;
}

.banner_cho_box ul li a:hover {
	/* background-color: #582810; */
	color: white;
}

.banner_cho_box ul li {
	position: relative;
	list-style: none;
	float: left;
}

.banner_cho_box2 {
	display: none;
	position: absolute;
	bottom: 22px;
	left: px;
}

.banner_cho_box2 li {
	z-index: 10;
}

#banner_btn {
	position: absolute;
	z-index: 5;
	top: 40%;
	left: 30px;
}

#banner_btn>button {
	width: 34px;
	height: 37px;
	box-shadow: silver;
}

#banner_btn>button:nth-child(2n) {
	position: absolute;
	top: 1px;
	left: 680px;
}

/*===================*/
/*  버튼 위치 정하기*/
#prev {
	margin-left: 12px;
	position: relative;
	padding: 0px;
}

#prev>button {
	position: absolute;
	top: 40%;
}

#next {
	width: 50px;
	position: relative;
	padding: 0px;
}

#next>button {
	position: absolute;
	top: 40%;
}
/*=========*/
/*이슈 트렌트*/
#content_body_event {
	margin-right: 20px;
}

#content_body_event>ul>li {
	padding: 10px;
}

/*=========*/
/*컨텐트 바디 타입 2*/
.content_body2 {
	display: flex;
}

.content_body2>a {
	font-size: 20px;
}

.content_body2_left {
	padding: 10px;
	width: 500px;
	height: 250px;
}

.content_body2_left a:first-child {
	font-size: 16px;
	font-weight: bolder;
	border: none;
	text-shadow: 10px;
	padding: 0px;
	margin: 0px;
	margin-right: 20px;
}

.content_body2_left a:not(:first-child) {
	border: 1px solid #dadada;
	padding: 5px 10px 1px 10px;
	z-index: 10;
	font-weight: 10px;
	font-size: 13px;
	text-align: center;
	font-weight: bolder;
}

.content_body2_left a:not(:first-child):hover {
	border-bottom: 1px solid white;
	color: blue;
}

.content_body2_book {
	display: flex;
	padding: 10px;
	border: 1px solid #dadada;
}

.content_body2_book>div {
	margin-left: 25px;
}

.content_body2_book div img {
	width: 92px;
	height: 132px;
}

.bcategory {
	margin: 0px;
	font-size: 8px;
	color: skyblue;
	font-weight: bold;
	text-align: center;
}

.btitle {
	font-size: 12px;
	text-align: center;
}

.bcontent {
	font-size: 12px;
}

.bprice {
	color: red;
	font-size: 10px;
}

.content_body2_right {
	padding: 10px;
	margin-left: 13px;
	width: 195px;
}

.content_body2_right img {
	padding-top: 20px;
	width: 190px;
	height: 230px;
}
/*바디 2 오른쪽 구조 */
.content_body2_right a {
	font-weight: bolder;
	border: none;
	text-shadow: 10px;
	padding: 0px;
	margin: 0px;
}

.content_body2_right span {
	float: right;
}

.content_body2_right_content div img {
	width: 140px;
	height: 140px;
}

.content_body2_right_content {
	text-align: center;
	border: 1px solid #dadada;
}

.content_body2_right_content:not(:first-of-type) {
	display: none;
}

.content_body2_right2 {
	padding: 10px;
	margin-left: 13px;
	width: 195px;
}

.content_body2_right2 img {
	padding-top: 20px;
	width: 190px;
	height: 230px;
}

.content_body2_right2 a {
	font-weight: bolder;
	border: none;
	text-shadow: 10px;
	padding: 0px;
	margin: 0px;
}

.content_body2_right2 span {
	float: right;
}

.content_body2_right_content2 div img {
	width: 140px;
	height: 140px;
}

.content_body2_right_content2 {
	text-align: center;
	border: 1px solid #dadada;
}

.content_body2_right_content2:not(:first-of-type) {
	display: none;
}

/*===========*/

/*이벤트*/
.content_body2_event {
	width: 768px;
	height: 400px;
}

.content_body2_event a:first-child {
	font-weight: bolder;
	border: none;
	text-shadow: 10px;
	padding: 0px;
	margin: 0px;
}

.body_2_event_img>img {
	padding: 10px;
	width: 150px;
	height: 98px;
}
/*==========*/
.btn_small {
	margin: 0px 20px 10px 0px;
	display: inline-block;
	white-space: nowrap;
	vertical-align: baseline;
	*vertical-align: -2px;
	border: 1px solid #d0d0d0;
	padding: 5px 4px 0px;
	height: 13px;
	font-size: 11px !important;
	line-height: 13px;
	font-weight: normal;
	font-family: 'dotum', sans-serif;
	color: #666 !important;
	text-decoration: none !important;
	background-color: #fff;
	text-align: center;
	transition: all .2s;
}
</style>
<section id="content">

	<div class="wrap">
<jsp:include page="/WEB-INF/views/sellpart/stickymenu/stickybook.jsp">
<jsp:param name="" value=""/>
</jsp:include>
    <div id="level_container" class="line">
        <div>
               
                <div id="serach-form" class="line" style="float: right;">
                        <form action="">
                            <input type="text" name="search">
                            <input type="submit" value="검색">
                        </form>
                </div>
            </div>
     
 
        </div> 
	<form id="sl" action="#" method="post">
	<input type="hidden" name="bindNo" value="${book.bindNo }">
        <div id="content_middle" style="display: flex;">
            <div class="bookView_img line">
                <img src="${book.image }" alt="200300book">
                
                <div>
                    <a href="${path}/sellbookController/bigview.do?bindNo=${book.bindNo}" 
	onclick="window.open(this.href, '_blank', 'width=600, height=800'); return false;">크게보기</a>
                </div>
            </div>
            <div class="bookView_order" style="margin-left: 50px;">
                <div>
                    <h2><span style="font-size:30px;">${book.title }</span></h2><br><br>
                    <p>글쓴이 : <span id="author">${book.author }</span><br><br>
                    <!-- <span>옮김이</span> -->
                    <p>출판사 : <span>${book.publisher }</span><br><br>
                    <p>출간일 : <span>${book.pubdate }</span><br><br>
                    <p>ISBN : <span>${book.isbn }</span><br><br>
                    <p>리뷰점수: <span>${book.rating }</span> <button>평점주기:</button></p><br><br><br>
                </div>
                <div><br><br>
                    <p>정가 : <span><fmt:formatNumber value="${book.price}" type="currency"/></span></p><br><br>
                    <p>판매가 : <span style="font-size: 18px; color: red;"><fmt:formatNumber value="${book.price*0.9 }" type="currency"/></span> <span>할인율: [ <span>10%</span> ] </span></p><br><br>
                </div>
                <div><br><br>
                    <p>쿠폰사용 : <button>쿠폰사용</button></p><br><br>
                    <p>배송비 : <span><fmt:formatNumber value="3000" type="currency"/></span></p><br><br>

                </div>
                <div><br><br>
                    <p>알림</p>
                    <p><br><br>
                         도서정보가 달라질 수 있습니다. 이 점 양해 부탁드립니다.<br><br><br><br>
                    </p>
                </div>
                
                <div><br><br>
                	<span>주문가능수량</span>
                    <input type="number" id="stock" name="stock" value="${book.stock }" readonly><br><br>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;주문수량&nbsp;&nbsp;</span>
                    <input type="number" id="sellStock" name="shopingListCount" value="1"><br><br><br><br>
                </div>
                <div style="display:flex; justify-content: center; padding-bottom: 30px; justify-content: space-around;">
                    <button id="slBtn"onclick="shoppingList()">장바구니담기</button>
                    <button id="buyBtn" onclick="submit()">바로구매</button>
                </div>
            </div>
        </div>
        <input type="hidden" name="shopingList_cate" value="B">
        <input type="hidden" name="memberId" value="${loginMember.memberId }">
        <input type="hidden" name="bBindNo" value="${book.bindNo }">
        
	</form>
	
	        <div class="crossLine3"></div>
        <div class="wrap">
            <div class="reco-product">
                <p class="reco-product-font">${book.author }님의 다른작품</p>
            </div>
            <div id="slider-div">
                <div class="reco-content">
                    <img src="${path }/resources/img/noimg.png" alt="">
                    <p class="productName">자료가 없습니다</p>
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/img/noimg.png" alt="">
                    <p class="productName">자료가 없습니다</p>
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/img/noimg.png" alt="">
                    <p class="productName">자료가 없습니다</p>
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                <div class="reco-content">
                    <img src="${path }/resources/img/noimg.png" alt="">
                    <p class="productName">자료가 없습니다</p>
                    <p class="discount margin-bottom24">할인율</p>
                    <p class="price margin-bottom24">가격</p>
                </div>
                
    </div>
        <div class="crossLine3"></div>
        <div class="proDetail-bar">
            <a id="bar1">도서설명</a>
            <a id="bar2" class="productR">리뷰평점</a>
            <a id="bar4">알려드립니다</a>
        </div>
        <input type="hidden" value="${book.bindNo }" id="bindNo"/>         

      
        <div class="product-exp">
            <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
            <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
            <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
            <img src="${path }/resources/images/gift/상품상세이미지.jpg" alt="">
        </div>
        <div class="product-review">
            <div class="writeBox">
                <button class="reviewWrite" onclick="window.open('<%=request.getContextPath()%>/SellbookController/insertReview.do?bindNo=${book.bindNo }&loginMember=${loginMember.memberId }', '리뷰를 남겨주세요!', 'width=500, height=600')">상품 리뷰 작성하기</button>
            </div>
           <table class="review-exp review-board" id="targetTable">
            <!-- 아약스로 테이블 생성 -->
            </table>

        <div id="pageBar"></div> 
        </div>
     
          <script>
        /* 상품리뷰, 상품문의 */
    	    var btnR = document.getElementById("bar2");
    	    var btnQ = document.getElementById("bar3");
    	    var bindNo = document.getElementById("bindNo").value; 	     
 	    
    	   	let pageBar = document.getElementById("pageBar");
    	   	let pager = "";
    	    let exp = document.getElementsByClassName('review-board');

    	    /*  console.log("exp");
    	    console.log(exp);
    	    console.log(exp[0]);
    	    console.log(exp[0].lastChild); */
    	    
  
    	   // let tb = document.getElementsByTagName("tbody");
    	    
    	   let tb = document.createElement('tbody');
    	   /* console.log("tb 입니다 ; ->>>>"+tb); */
  			let tr = ""; 
  			let tr2 = ""; 
       		let html2 = ""; /* thead */
       		html2 += "<tr><th style='width:105px;'>번호</th>";
            html2 += "<th style='width:145px;'>만족도</th>";    
            html2 += "<th style='width:370px;'>상품평</th>";    
            html2 += "<th style='width:165px;'>작성자</th>";    
            html2 += "<th style='width:165px;'>작성일</th></tr>";    
            /* console.log(html2); */    
  			tr2 = document.createElement("tr");
  			tr2.innerHTML=html2;
  			
  			/* 상품리뷰 JS */
         $(btnR).on('click', getTrs(1)); 
          
          function getTrs(cPage) {
        	 $.ajax({
            		type: 'post',
            		url: '${path}/SellbookController/productReview2.do',
            		data: {
            			bindNo: bindNo,
            			cPage: cPage,
            			numPerPage: 10
            		},
            		/* dataType: "json", */
            		success: data => {
            			
            			console.log("페이지바 넘겨온 데이터"+data);
            			pageBar.innerHTML = data;
            		} 
            	}); // pageBar ajax
            	 /* console.log(exp[0].children[0].children);
            	 console.log(exp[0].firstChild); */
            	 /*  console.log(exp[0].lastChild.childNodes);
            	 console.log($(".review-board").children(".review-text")); */
            	 /* console.log(tr); */
            	 /*  console.log(exp[0].child[0]);
            	 console.log(exp[0].child); */
            	 /* exp[0].children[0].html(); */
            	 /* exp[0].children.html(); */
            	    
            	 /*  exp[0].children[0].children.html();  */
         	 exp[0].lastChild.innerHTML = "";
            	 
         	 /* console.log(exp[0].lastChild.childNodes); */
         	 console.log("================= ajax 실행 후 ==================");
         	$.ajax({
              	type: 'post',
              	url: '${path}/SellbookController/productReview.do',
              	data: {
              		bookNo: bookNo,
              		cPage: cPage,
              		numPerPage: 10
              	},
              	dataType: "json",
              	success: data => {  
              		console.log(data);
              		exp[0].appendChild(tb).appendChild(tr2);
              		data.forEach((v, i) => {   

              			 let html = ""; /* 테이블 본문 내용 */
              		     html += "<tr class='review-text review-tr'>";   
                 	     html += "<td class='review-num'>"+v.rownum+"</td>";
                 	     html += "<td class='gpa'>";
                 	     html += "<div class='gpa-circle'>";
                 	     html += "<p class='gpa-circle-a'>"+v.book_score+"</p></div></td>";
                 	     html += "<td><div class='review'><a class='review-title-a'>"+v.book_board_content+"</a></div></td>";
                 	     html += " <td class='review-writer'>"+v.writer+"</td>";
                 	     html += "<td class='review-date'>"+v.write_date+"</td></tr>";
     
                 	    tr = document.createElement('tr'); 
               			tr.classList.add('review-text');
                 	    tr.classList.add('review-tr');
                 	    tr.innerHTML=html;
                 	       
                 	    pager = document.createElement('div');
                 	    pager.innerHTML = pageBar;
                 	    
                 	    console.log(tb);
                 	    
                 	    exp[0].appendChild(tb).appendChild(tr);

                 	 //exp[0].appendChild(tb[0]).appendChild(tr);
                 	    //exp[0].appendChild(tr);
                 	    // document.getElementById("targetTable").appendChild(tr);
                 	    /*  console.log("tb 입니다 ; ->>>>"+tb);
                 	    console.log(tb);
                 	    console.log(tb[0]); */
                 	    //exp[0].appendChild(pager);    
             		 });    
              		
              	  } 
              	
              }); // 1번째 ajax 끝
                       
         }
             		  			
        </script>
        <!-- 상품Q&A -->
        <div class="product-q_a">
            <div class="writeBox">
                <button class="reviewWrite">질문 작성하기</button>
            </div>
            <table class="review-exp" id="qna-exp">
                <tr>
                    <th style="width:105px;">번호</th>
                    <!-- <th style="width:145px;"></th> -->
                    <th style="width:515px;">질문내용</th>
                    <th style="width:165px;">작성자</th>
                    <th style="width:165px;">작성일</th>
                </tr>
             <!-- <tr class="review-text">
                    <td>0</td>
                    <td class="gpa">
                     <div class="gpa-circle">
                         <p>3</p>
                     </div>    
                 </td>
                     <td>
                        <div class="review_qna">
                         제목X 내용이 곧 제목, 20자 이상이면 ...으로 처리 쿠쿠루삥뽕빵삥뿡       
                        </div>
                     </td>
                    <td>관리자</td>
                    <td>SYSDATE or 수정일</td>
                 </tr>     -->             
             </table>
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
        <input type="hidden" value="${path }" id="contextPath">


 
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${path }/resources/js/sellpart/bookdetail/bookbuy.js"></script>
<script src="${path }/resources/js/sellpart/bookdetail/bookdetail.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>	 
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
     	//아래 나오는 페이지네이션(점) css class 지정
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
/* console.log(slickBtn); */
$(slickBtn).click(function(){
  $(this).css('transform',"rotate( 90deg )");
  $(this).css('transition',"all ease 0.5s");
})
let hot = $('.hot');
/* console.log(hot); */
$(hot).mouseover(function(){
  $(this).css("color","black");
})
$(hot).mouseout(function(){
  $(this).css("color","#696969");
})

/* 카카오 페이 */
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

   
    let reviewTitle = document.getElementsByClassName("review-title-a");
    
    console.log(reviewTitle);
    /* reviewTitle.addEventListener("click", function(e){
	alert("나와라");
}); */

	$("#slBtn").click(function(){
		$("#sl").attr("action","${path }/shopingList/shopingList.do");
		$("#sl").submit();
	})
	$("#buyBtn").click(function(){
		$("#sl").attr("action","${path }/SellbookController/bookpayment.do");
		$("#sl").submit();
	})

        $(function(){
            $(".level_catagory_cho").hover((e)=>{
                $(e.target).children('div').show();
            },(e)=>{
                $(e.target).children('div').hide();
                if($(".level_catagory_cho div").not().hover()){
                    $(".level_catagory_cho div").hide();
                }
            })
        })


        $(function(){
        var length=$(".today_book_form").length;
        var pageview=length/3;
        var pagecheck=0;

        $(".today_book_form").each((i,v)=>{
            if(pageview<=i){
                $(v).addClass("on");
            }
        })
        $("#next>button").click(e=>{
            pagecheck++;
            switch(pagecheck){
                case 1 :  $(".today_book_form").addClass("on");
                $(".today_book_form").slice(5,10).removeClass("on");break;              
                case 2 : $(".today_book_form").addClass("on");
                $(".today_book_form").slice(10,15).removeClass("on"); break;                                
            }   if(pagecheck>2){
                pagecheck=0;
                $(".today_book_form").addClass("on");
                $(".today_book_form").slice(0,5).removeClass("on");
            }
        })
        $("#prev>button").click(e=>{
            pagecheck--;
            switch(pagecheck){
                case 0 : $(".today_book_form").addClass("on");
                $(".today_book_form").slice(0,5).removeClass("on");break;
                case 1 :  $(".today_book_form").addClass("on");
                $(".today_book_form").slice(5,10).removeClass("on");break;
                case 2 : $(".today_book_form").addClass("on");
                $(".today_book_form").slice(10,15).removeClass("on"); break;                     
            } if(pagecheck<0){
                pagecheck=2;
                $(".today_book_form").addClass("on");
                $(".today_book_form").slice(10,15).removeClass("on"); 
            }
        })
       
    })
    </script>

</section>

	<script src="${path}/resources/js/sellpart/sameauthor/sameauthor.js"></script>
	<script src="${path}/resources/js/sellpart/sameauthor/sameauthor2.js"></script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp" />