<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.rar.khbook.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
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
			<jsp:param name="" value="" />
		</jsp:include>
		<!-- <div id="level_container" class="line">
			<div>
				<div id="level_cho">
                //1 레벨
                //    주소값 받아서 a안에 값 설정
                
                <div class="level_catagory_cho">
                    <a> 홈 ></a>
                </div>

                <div class="level_catagory_cho">
                    <a> 아동 도서 ></a>
                    <div style="display: none;">
                        <ul>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                        </ul>
                        <ul>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                        </ul>
                        <ul>
                            <li><a>아동도서</a></li>
                            <li><a>초등도서</a></li>
                            <li><a>중등도서</a></li>
                            <li><a>문곰e북</a></li>
                        </ul>
                    </div>
                </div>

                <div class="level_catagory_cho">
                    <a> 소설 ></a>
                    <div style="display: none;">
                        <ul>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                        </ul>
                        <ul>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                        </ul>
                        <ul>
                            <li><a>아동도서</a></li>
                            <li><a>초등도서</a></li>
                            <li><a>중등도서</a></li>
                            <li><a>문곰e북</a></li>
                        </ul>
                    </div>
                </div>

                <div class="level_catagory_cho">
                    <a> 한국 소설 ></a>
                    <div style="display: none;">
                        <ul>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                        </ul>
                        <ul>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                            <li><a>--------</a></li>
                        </ul>
                        <ul>
                            <li><a>아동도서</a></li>
                            <li><a>초등도서</a></li>
                            <li><a>중등도서</a></li>
                            <li><a>문곰e북</a></li>
                        </ul>
                    </div>
                </div>



				<div id="serach-form" class="line" style="float: right;">
					<form action="">
						<input type="text" name="search"> <input type="submit"
							value="검색">
					</form>
				</div>
			</div>
		</div> -->
		<form id="sl" action="#" method="post">
			<input type="hidden" name="bindNo" value="${book.bindNo }">
			<div id="content_middle" style="display: flex;">
				<div class="bookView_img line">
					<img src="${book.image }" alt="200300book">
					<!-- <ul>
                    <li>크게보기</li>
                    <li>미리보기</li>
                </ul> -->
					<div>
						<a
							href="${path}/sellbookController/bigview.do?bindNo=${book.bindNo}"
							onclick="window.open(this.href, '_blank', 'width=600, height=800'); return false;">크게보기</a>
					</div>
				</div>
				<div class="bookView_order" style="margin-left: 50px;">
					<div>
						<h2>
							<span style="font-size: 30px;">${book.title } <c:if
									test="${shopinglistCate  == 'E'}">
									&lt;e-Book&gt;
								</c:if>
							</span>
						</h2>
						<br> <br>
						<p>
							글쓴이 : <span>${book.author }</span><br> <br>
							<!-- <span>옮김이</span> -->
						<p>
							출판사 : <span>${book.publisher }</span><br> <br>
						<p>
							출간일 : <span>${book.pubdate }</span><br> <br>
						<p>
							ISBN : <span>${book.isbn }</span><br> <br>
						<p>
							리뷰점수: <span>${book.rating }</span>
							<button>평점주기:</button>
						</p>
						<br> <br> <br>
					</div>
					<div>
						<br> <br>
						<p>
							정가 : <span><fmt:formatNumber value="${book.price}"
									type="currency" /></span> <input type="hidden" name="price"
								value="${book.price }">
						</p>
						<br> <br>
						<c:if test="${shopinglistCate == null }">
							<p>
								판매가 : <span style="font-size: 18px; color: red;"><fmt:formatNumber
										value="${book.price*0.9 }" type="currency" /></span> <span>할인율:
									[ <span>10%</span> ]
								</span>
							</p>
						</c:if>
						<br> <br>
					</div>
					<div>
						<br> <br>
						<p>
							쿠폰사용 :
							<button>쿠폰사용</button>
						</p>
						<br> <br>
						<c:if test="${shopinglistCate  == null}">
							<p>
								배송비 : <span><fmt:formatNumber value="3000"
										type="currency" /></span>
							</p>
						</c:if>
						<c:if test="${shopinglistCate == 'E'}">
							<p>
								배송비 : <span><fmt:formatNumber value="0" type="currency" /></span>
							</p>
						</c:if>
						<br> <br>

					</div>
					<div>
						<br> <br>
						<p>알림</p>
						<p>
							<br> <br> 도서정보가 달라질 수 있습니다. 이 점 양해 부탁드립니다.<br> <br>
							<br> <br>
						</p>
					</div>

					<div>
						<br> <br> <span>주문가능수량</span> <input type="number"
							id="stock" name="stock" value="${book.stock }" readonly><br>
						<br> <span>&nbsp;&nbsp;&nbsp;&nbsp;주문수량&nbsp;&nbsp;</span> <input
							type="number" id="sellStock" name="shopingListCount" value="1"><br>
						<br> <br> <br>
					</div>
					<div
						style="display: flex; justify-content: center; padding-bottom: 30px; justify-content: space-around;">
						<button id="slBtn" onclick="shoppingList()">장바구니담기</button>
						<button id="buyBtn" type="button">바로구매</button>
					</div>
				</div>
			</div>
			<c:if test="${shopinglistCate  == null}">
				<input type="hidden" name="shopingList_cate" value="B">
			</c:if>
			<c:if test="${shopinglistCate == 'E'}">
				<input type="hidden" name="shopinglistCate"
					value="${shopinglistCate }">
			</c:if>
			<input type="hidden" name="memberId" value="${loginMember.memberId }">
			<input type="hidden" name="bBindNo" value="${book.bindNo }">

		</form>
		<script>
	$("#slBtn").click(function(){
		$("#sl").attr("action","${path }/shopingList/shopingList.do");
		if(${shopinglistCate=='E'}){
			$.ajax({
				url:"${path}/shopingListController/insertEbook.do",
				type:"POST",
				dataType:"json",
				data:{
					shopinglistCount:Number($("#sellStock").val()),
					bindNo:"${book.bindNo}"
				},
				success:data=>{
					if(confirm("장바구니 등록완료. 장바구니로 이동하시겠습니까?")){
						location.assign("${path}/shopingList/shopingList.do");
					}
				},
				error:error=>{
					alert("실패");
				}
			})
	}
		$("#sl").submit();
	})
	$("#buyBtn").click(function(){
		$("#sl").attr("action","${path }/SellbookController/bookpayment.do");
		if(${shopinglistCate=='E'}){
			$("#sl").attr("action","${path }/EbookControllerSm/bookpayment.do");
			$.ajax({
				url:"${path}/EbookControllerSm/checkEbook.do",
						type:"GET",
						data:{bindNo:"${book.bindNo}"},
						success:data=>{
							if(data > 0){
								alert("이미 구매하신 e-Book입니다.");
							}else{
								$("#sl").submit();
							}
						},
						error:error=>{
							console.log(error);
						}
			})
		}else{
			$("#sl").submit();
		}
	})
	$("#sellStock").click(e =>{
		console.log('${shopinglistCate}');
		if(${shopinglistCate=='E'}){
			console.log("dd");
			alert("e-Book 도서는 1개만 구입 가능합니다.");
			$("#sellStock").val(1);
		}
	})
</script>
		<div class="bookView_info" style="display: flex;">
			<div class="bookView_info_left line">
				<!-- <div class="bookView_info_left_btn line">
                    <a href="#event" name="event">이벤트</a>
                    <a href="#product">상품정보</a>
                    <a href="#review">회원리뷰</a>            
                    <a href="#storyk">스토리k</a>
                    <a href="#err">교환/반품/품절</a>
                </div> -->
				<div class="bookView_info_left_event">
					<div>
						<h2>이 책의 이벤트</h2>
					</div>
					<div style="display: flex;">
						<div>
							<img src="p.png" alt="">
						</div>
						<div>
							<p>본문 내용</p>
						</div>
						<div>
							<img src="p.png" alt="">
						</div>
						<div>
							<p>본문 내용</p>
						</div>
						<div>
							<img src="p.png" alt="">
						</div>
						<div>
							<p>본문 내용</p>
						</div>

					</div>


				</div>

				<div class="bookView_info_left_product">
					<div class="" style="text-align: right; padding: 15px;">
						<a href="" class="btn_small">문의하기</a>
					</div>
					<div id="table_div">
						<%-- <table id="table_1">
                        <tr>
                            <th>ISBN</th>
                            <td>${book.isbn }</td>
                        </tr>
                        <tr>
                            <th>쪽수</th>
                            <td>값입력</td>
                        </tr>
                        <tr>
                            <th>크기</th>
                            <td>값입력</td>
                        </tr>
                        <tr>
                            <th>이책의 원서/번역서</th>
                            <td>값입력</td>
                        </tr>
                    </table> --%>
						<div>
							<h2>책소개</h2>
							<!-- <strong>이 책이 속한 분야</strong>
                        <p><span>레벨1</span> > <span>레벨2</span> ><span>레벨3</span></p> -->
						</div>
						<div class="bcontent">
							<!--  <strong>책 내용</strong>  -->
							<br> ${book.description }<br> <br> <br> <br>
							<a href="${book.link }"><strong>[ 책 상세 페이지로 이동 ]</strong></a> <br>
							<br> <br>
						</div>
						<!--                    <div>
                       <h2>저자소개</h2>
                       <div style="display: flex;">
                            <div>
                               <img src="pn.png" alt="">
                            </div>
                            <div>
                                <h2>저자: 박원재</h2>
                                <p>육식을 좋아하는 작가</p>
                            </div>
                       </div>
                   </div> -->

						<div>

							<div class="line">
								<h2>이 저자의 다른작품</h2>

								<div class="" id="today_book">
									<div id="prev">
										<button>&lt;</button>
									</div>
									<div id="bookpagebar">
										<div class="today_book_form">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>1</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>2</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>3</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>4</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form">
											<img src="x.png" alt="">
											<div>
												<p>제목</p>
												<p>5</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>6</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>7</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>8</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>9</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>10</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>11</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>12</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>13</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>14</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>
										<div class="today_book_form on">
											<img src="" alt="">
											<div>
												<p>제목</p>
												<p>15</p>
												<p style="color: red;">18000원</p>
											</div>
										</div>


									</div>
									<div id="next">
										<button>&gt;</button>
									</div>
								</div>
							</div>
							<!--  <div>
                    <strong>목차</strong>
                    <br>
                    1 정글 <br>
                    2 sasdas <br>
                    3 dsa정 <br>
                    4 dasdasv <br>
                    5 dasdasc <br>
                    7 dassdas <br>
                 </div>
                 <div>
                    <strong>책속으로</strong>
                    <br>
                    1 정글 <br>
                    2 sasdas <br>
                    3 dsa정 <br>
                    4 dasdasv <br>
                    5 dasdasc <br>
                    7 dassdas <br>
                 </div>
                 <div>
                    <strong>출판서 서평</strong>
                    <br>
                    1 정글 <br>
                    2 sasdas <br>
                    3 dsa정 <br>
                    4 dasdasv <br>
                    5 dasdasc <br>
                    7 dassdas <br>
                 </div> -->
						</div>

					</div>
				</div>
				<!-- <div class="bookView_info_left_btn line">
                    <a href="#event">이벤트</a>
                    <a href="#product">상품정보</a>
                    <a href="#review" name="review">회원리뷰</a>            
                    <a href="#storyk">스토리k</a>
                    <a href="#err">교환/반품/품절</a>
                </div> -->
				<div class="bookView_info_left_review">
					<div>
						<h2>
							klover리뷰 (<span>리뷰개수</span>) <span>(평점)</span>
						</h2>

					</div>

					<div style="text-align: right;">
						<a href="" class="btn_small">리뷰 쓰기</a>
					</div>
					<div id="review_list">
						<div class="">
							<p>
								<span>아이디</span><span>등록일</span><span>점수</span>
							</p>
							<p>댓글 내용</p>
						</div>
						<div class="">
							<p>
								<span>아이디</span><span>등록일</span><span>점수</span>
							</p>
							<p>댓글 내용</p>
						</div>
						<div class="pagebar">페이지바</div>
					</div>
				</div>
				<!-- <div class="bookView_info_left_btn line">
                    <a href="#event">이벤트</a>
                    <a href="#product">상품정보</a>
                    <a href="#review">회원리뷰</a>            
                    <a href="#storyk" name="storyk">스토리k</a>
                    <a href="#err">교환/반품/품절</a>
                </div>
                <div class="bookView_info_left_event">
                    스토리 k
                </div>
                <div class="bookView_info_left_btn line">
                    <a href="#event">이벤트</a>
                    <a href="#product">상품정보</a>
                    <a href="#review">회원리뷰</a>            
                    <a href="#storyk">스토리k</a>
                    <a href="#err" name="err">교환/반품/품절</a>
                </div> -->
				<div class="bookView_info_left_event">
					<tbody>
						<tr>
							<th scope="row">반품/교환방법</th>
							<td><strong>마이룸 &gt; 주문관리 &gt; 주문/배송내역 &gt; 주문조회
									&gt; <a href="http://www.kyobobook.co.kr/myroom/orderList.laf">반품/교환신청</a>
									, <br> <a
									href="http://www.kyobobook.co.kr/cscenter/qnaForm.laf?questionType=003">[1:1상담&gt;반품/교환/환불]</a>
									또는 고객센터 (1544-1900)
							</strong><br> ※ 오픈마켓, 해외배송주문, 기프트 주문시 <a
								href="http://www.kyobobook.co.kr/cscenter/qnaForm.laf?questionType=003">[1:1상담&gt;반품/교환/환불]</a><br>
								&nbsp; &nbsp; 또는 고객센터 (1544-1900)</td>
						</tr>
						<tr>
							<th scope="row">반품/교환가능 기간</th>
							<td>변심반품의 경우 수령 후 7일 이내,<br> 상품의 결함 및 계약내용과 다를 경우 문제점
								발견 후 30일 이내
							</td>
						</tr>
						<tr>
							<th scope="row">반품/교환비용</th>
							<td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
						</tr>
						<tr>
							<th scope="row">반품/교환 불가 사유</th>
							<td>
								<ul class="list_normal">
									<li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br> (단지 확인을 위한
										포장 훼손은 제외)
									</li>
									<li>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br> 예)
										화장품, 식품, 가전제품(악세서리 포함) 등
									</li>
									<li>복제가 가능한 상품 등의 포장을 훼손한 경우<br> 예) 음반/DVD/비디오,
										소프트웨어, 만화책, 잡지, 영상 화보집
									</li>
									<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)</li>
									<li>디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우</li>
									<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
									<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에<br>
										해당되는 경우
									</li>
								</ul> (1) 해외주문도서 : 이용자의 요청에 의한 개인주문상품으로 단순변심 및 착오로 인한 취소/교환/반품 시
								‘해외주문 반품/취소 수수료’ 고객 부담 (해외주문 반품/취소 수수료 : ①서양도서-판매정가의 12%,
								②일본도서-판매정가의 7%를 적용)

							</td>
						</tr>
						<tr>
							<th scope="row">상품 품절</th>
							<td>공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는<br>
								이메일과 문자로 안내드리겠습니다.
							</td>
						</tr>
						<tr>
							<th scope="row">소비자 피해보상<br> 환불지연에 따른 배상
							</th>
							<td>
								<ul class="list_normal">
									<li>상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은<br>
										소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨
									</li>
									<li>대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의<br>
										소비자 보호에 관한 법률에 따라 처리함
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</div>


			</div>

			<div class="bookView_info_right line">
				<div>
					<a href=""> <img
						src="${path}/resources/img/sellLev1/195117add.png" alt=""
						style="width: 195px;"></a>
				</div>

				<div style="height: 550px;" class="line">
					<div>
						이분야의 베스트<span style="float: right;">더보기+</span>
					</div>

					<div style="display: flex; padding: 10px 10px;">
						<div>
							<a><img
								src="http://image.kyobobook.co.kr/images/book/medium/122/m9791197037122.jpg"
								alt=""></a>
						</div>
						<div style="margin-left: 10px;">
							<p class="btitle">안녕,소중한사람</p>
							<p class="bcontent">작가</p>
							<p class="bprice">19000원</p>
						</div>
					</div>
					<div style="display: flex; padding: 10px 10px;">
						<div>
							<a><img
								src="http://image.kyobobook.co.kr/images/book/medium/122/m9791197037122.jpg"
								alt=""></a>
						</div>
						<div style="margin-left: 10px;">
							<p class="btitle">안녕,소중한사람</p>
							<p class="bcontent">작가</p>
							<p class="bprice">19000원</p>
						</div>
					</div>
					<div style="display: flex; padding: 10px 10px;">
						<div>
							<a><img
								src="http://image.kyobobook.co.kr/images/book/medium/122/m9791197037122.jpg"
								alt=""></a>
						</div>
						<div style="margin-left: 10px;">
							<p class="btitle">안녕,소중한사람</p>
							<p class="bcontent">작가</p>
							<p class="bprice">19000원</p>
						</div>
					</div>
					<div style="display: flex; padding: 10px 10px;">
						<div>
							<a><img
								src="http://image.kyobobook.co.kr/images/book/medium/122/m9791197037122.jpg"
								alt=""></a>
						</div>
						<div style="margin-left: 10px;">
							<p class="btitle">안녕,소중한사람</p>
							<p class="bcontent">작가</p>
							<p class="bprice">19000원</p>
						</div>
					</div>
				</div>

				<div style="height: 550px;" class="line">
					<div>
						이분야의 신간<span style="float: right;">더보기+</span>
					</div>

					<div style="display: flex; padding: 10px 10px;">
						<div>
							<a><img
								src="http://image.kyobobook.co.kr/images/book/medium/122/m9791197037122.jpg"
								alt=""></a>
						</div>
						<div style="margin-left: 10px;">
							<p class="btitle">안녕,소중한사람</p>
							<p class="bcontent">작가</p>
							<p class="bprice">19000원</p>
						</div>
					</div>
					<div style="display: flex; padding: 10px 10px;">
						<div>
							<a><img
								src="http://image.kyobobook.co.kr/images/book/medium/122/m9791197037122.jpg"
								alt=""></a>
						</div>
						<div style="margin-left: 10px;">
							<p class="btitle">안녕,소중한사람</p>
							<p class="bcontent">작가</p>
							<p class="bprice">19000원</p>
						</div>
					</div>
					<div style="display: flex; padding: 10px 10px;">
						<div>
							<a><img
								src="http://image.kyobobook.co.kr/images/book/medium/122/m9791197037122.jpg"
								alt=""></a>
						</div>
						<div style="margin-left: 10px;">
							<p class="btitle">안녕,소중한사람</p>
							<p class="bcontent">작가</p>
							<p class="bprice">19000원</p>
						</div>
					</div>
					<div style="display: flex; padding: 10px 10px;">
						<div>
							<a><img
								src="http://image.kyobobook.co.kr/images/book/medium/122/m9791197037122.jpg"
								alt=""></a>
						</div>
						<div style="margin-left: 10px;">
							<p class="btitle">안녕,소중한사람</p>
							<p class="bcontent">작가</p>
							<p class="bprice">19000원</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>




	<script>
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



<jsp:include page="/WEB-INF/views/common/newFooter.jsp" />