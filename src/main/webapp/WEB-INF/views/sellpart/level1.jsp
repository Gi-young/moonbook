<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<script>

window.onload = function() {

	
	searchHotnew({
		keyword: "",
		searchType: "title",
		categoryCode: "310010020",
		pubdateOrder: "DESC",
		salesOrder: "DESC",
		priceOrder: "DESC",
		importancePubdate: "1",
		importanceSales: "2",
		importanceRating: "3",
		importancePrice: "4",
		dataVolume: 15
		
	});
	
	searchBestseller({
		keyword: "",
		searchType: "title",
		categoryCode: "310040030",
		pubdateOrder: "DESC",
		salesOrder: "DESC",
		priceOrder: "DESC",
		importancePubdate: "1",
		importanceSales: "2",
		importanceRating: "3",
		importancePrice: "4",
		dataVolume: 4
	});
	
}

function searchHotnew(searchData) {
	/* 따끈따끈신작 이미지 */
	
	let hotnewimg0=$(".hotnewimg0");
	let hotnewimg1=$(".hotnewimg1");
	let hotnewimg2=$(".hotnewimg2");
	let hotnewimg3=$(".hotnewimg3");
	let hotnewimg4=$(".hotnewimg4");
	let hotnewimg5=$(".hotnewimg5");
	let hotnewimg6=$(".hotnewimg6");
	let hotnewimg7=$(".hotnewimg7");
	let hotnewimg8=$(".hotnewimg8");
	let hotnewimg9=$(".hotnewimg9");
	let hotnewimg10=$(".hotnewimg10");
	let hotnewimg11=$(".hotnewimg11");
	let hotnewimg12=$(".hotnewimg12");
	let hotnewimg13=$(".hotnewimg13");
	let hotnewimg14=$(".hotnewimg14");
	
	
	
	/* 따끈따끈신작 타이틀 */
	let hotnewtitle0=$(".hotnewtitle0");
	let hotnewtitle1=$(".hotnewtitle1");
	let hotnewtitle2=$(".hotnewtitle2");
	let hotnewtitle3=$(".hotnewtitle3");
	let hotnewtitle4=$(".hotnewtitle4");
	let hotnewtitle5=$(".hotnewtitle5");
	let hotnewtitle6=$(".hotnewtitle6");
	let hotnewtitle7=$(".hotnewtitle7");
	let hotnewtitle8=$(".hotnewtitle8");
	let hotnewtitle9=$(".hotnewtitle9");
	let hotnewtitle10=$(".hotnewtitle10");
	let hotnewtitle11=$(".hotnewtitle11");
	let hotnewtitle12=$(".hotnewtitle12");
	let hotnewtitle13=$(".hotnewtitle13");
	let hotnewtitle14=$(".hotnewtitle14");
	
	$.ajax({
		url: "${path}/ebook/search.do",
		type: "post",
		data: searchData,
		dataType: "json",
		success: data => {
			console.log("여기부터 보면 됩니다.");
			console.log(data);
			/* 따끈따끈신작 이미지 */
			$(hotnewimg0).attr('src',data[0].image );
			$(hotnewimg1).attr('src',data[1].image );
			$(hotnewimg2).attr('src',data[2].image );
			$(hotnewimg3).attr('src',data[3].image );
			$(hotnewimg4).attr('src',data[4].image );
			$(hotnewimg5).attr('src',data[5].image );
			$(hotnewimg6).attr('src',data[6].image );
			$(hotnewimg7).attr('src',data[7].image );
			$(hotnewimg8).attr('src',data[8].image );
			$(hotnewimg9).attr('src',data[9].image );
			$(hotnewimg10).attr('src',data[10].image );
			$(hotnewimg11).attr('src',data[11].image );
			$(hotnewimg12).attr('src',data[12].image );
			$(hotnewimg13).attr('src',data[13].image );
			$(hotnewimg14).attr('src',data[14].image );
			
			
			/* 따끈따끈신작 타이틀 */
			console.log(hotnewtitle0);
			console.log(data[0].title);
			var hntitle0=(data[0].title).split('(');
			var hntitle1=(data[1].title).split('(');
			var hntitle2=(data[2].title).split('(');
			var hntitle3=(data[3].title).split('(');
			var hntitle4=(data[4].title).split('(');
			var hntitle5=(data[5].title).split('(');
			var hntitle6=(data[6].title).split('(');
			var hntitle7=(data[7].title).split('(');
			var hntitle8=(data[8].title).split('(');
			var hntitle9=(data[9].title).split('(');
			var hntitle10=(data[10].title).split('(');
			var hntitle11=(data[11].title).split('(');
			var hntitle12=(data[12].title).split('(');
			var hntitle13=(data[13].title).split('(');
			var hntitle14=(data[14].title).split('(');
			
			$(hotnewtitle0).html(hntitle0[0] );
			$(hotnewtitle1).html(hntitle1[0] );
			$(hotnewtitle2).html(hntitle2[0] );
			$(hotnewtitle3).html(hntitle3[0] );
			$(hotnewtitle4).html(hntitle4[0] );
			$(hotnewtitle5).html(hntitle5[0] );
			$(hotnewtitle6).html(hntitle6[0] );
			$(hotnewtitle7).html(hntitle7[0] );
			$(hotnewtitle8).html(hntitle8[0] );
			$(hotnewtitle9).html(hntitle9[0] );
			$(hotnewtitle10).html(hntitle10[0] );
			$(hotnewtitle11).html(hntitle11[0] );
			$(hotnewtitle12).html(hntitle12[0] );
			$(hotnewtitle13).html(hntitle13[0] );
			$(hotnewtitle14).html(hntitle14[0] );
			
		}
	});
	

}

  function searchBestseller(searchData) {
	 
	 /* 가장 인기있는 아이템 도서 이미지 1-5 */
	let bestsellerimg0=$(".bestsellerimg0");
	let bestsellerimg1=$(".bestsellerimg1");
	let bestsellerimg2=$(".bestsellerimg2");
	let bestsellerimg3=$(".bestsellerimg3");

	/* 상세보기 연동 */
	let bsimgLink0=$(".bsimgLink0");
	let bsimgLink1=$(".bsimgLink1");
	let bsimgLink2=$(".bsimgLink2");
	let bsimgLink3=$(".bsimgLink3");
	
	let addr ="http://localhost:9090/21PM_moonbook_final/sellpart/bookDetail.do?bindNo=";
	 /* 가장 인기있는 아이템 도서 타이틀 1-5 */
	let bestsellertitle0=$(".bestsellertitle0");
	let bestsellertitle1=$(".bestsellertitle1");
	let bestsellertitle2=$(".bestsellertitle2");
	let bestsellertitle3=$(".bestsellertitle3");
	
	/* 인기있는 가격 */
	let bprice0=$(".bprice0");
	let bprice1=$(".bprice1");
	let bprice2=$(".bprice2");
	let bprice3=$(".bprice3");
	 

	$.ajax({
		url:"${path}/ebook/search.do",
		type: "post",
		data: searchData,
		dataType: "json",
		success: data=>{
			console.log("베스트셀러인데 어떻게 못나올까요?");
			console.log(data[0].title+"구분할수있는문자열");
			/* 베스트셀러 이미지 */
			$(bestsellerimg0).attr('src',data[0].image );
			$(bestsellerimg1).attr('src',data[1].image );
			$(bestsellerimg2).attr('src',data[2].image );
			$(bestsellerimg3).attr('src',data[3].image );

			/* 상세보기 연동 */
			$(bsimgLink0).attr('href',addr+data[0].bindNo );
			$(bsimgLink1).attr('href',addr+data[1].bindNo );
			$(bsimgLink2).attr('href',addr+data[2].bindNo );
			$(bsimgLink3).attr('href',addr+data[3].bindNo );
			
			/* 베스트셀러 타이틀 ( 괄호 앞 잘라내기 */
			console.log("여기 데이터 뭐야?"+data[0].title);
			
			var bstitle0=(data[0].title).split('(');
			var bstitle1=(data[1].title).split('(');
			var bstitle2=(data[2].title).split('(');
			var bstitle3=(data[3].title).split('(');
			
			$(bestsellertitle0).html(bstitle0[0] );
			$(bestsellertitle1).html(bstitle1[0] );
			$(bestsellertitle2).html(bstitle2[0] );
			$(bestsellertitle3).html(bstitle3[0] );
			
			/* 가격 */
		 	$(bprice0).html(data[0].price+"원");
		 	$(bprice1).html(data[1].price+"원");
		 	$(bprice2).html(data[2].price+"원");
		 	$(bprice3).html(data[3].price+"원");

		
		}
	})
}   

</script>

<style>
.content_body2_book div{
font-size:13px;
width:80px;
}
.content_body2_book{
display:flex;
justify-content:space-around;
}
a{
    text-decoration: none;
}
ul{
    list-style:none;
    }
    


.contenttitle{
    font-weight: bold;
}
.moreview{
    float: right;
    font-size: 12px;
}
.wrap{
    min-width: 950px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
#container{
    width: 950px;
    display: flex;
}
.leftlongbanner{
    width: 168px;
    height: 100%;
}
.lev1add div{
    border: #582810 3px solid;
}
.lev1add div:not(:first-child){
    border-left:none;
}
    
.line{
     /* border: #582810 1px solid;  */
}
.main_sub_title{
    position: relative;
}
.main_sub_title:hover{
    /* border: 1px #582810 solid; */
    border-right: none;
}
.main_sub_title{
    list-style: none;
    margin-top: 10px;
}
.main_sub_title>a{
    padding: 7px 20px 4px 15px;
    position: relative;
}

.layer{
    position: absolute;
    top: -5px;
    width: 100%;
    left: 100%;
    padding: 3px 0;
    border-bottom: 1px solid silver;
    background-color: #fff;
}
.layer>li{
    list-style: none;
    border-bottom: silver 1px solid;
}
.layer>li:hover{
  border: 1px solid #582810;
}

#main_snb>ul{
    padding: 10px 0;
    z-index: 100;
    border: #582810 1px solid;
    border-top: 1px solid #e2e5ee;

}
#main_sub>ul>li{
    list-style: none;
    width: 100px;

    
}
.main_ul>li>ul>li{
    font-family: '한컴 말랑말랑', '돋움';
    font-size: 16px;
 
    padding-top: 3px;
    padding-bottom: 3px;
}
#main_snb{
    width: 168px;
    height: auto;
    font-family: '한컴 말랑말랑', '돋움';
    font-size: 20px;
    font-weight: bold;
    text-align: center;
}
#main_snb>h2{
    margin: 0px;
    padding: 20px;
    background-color: rgb(255, 255, 255);
    text-align: center; 
}
.content-todaybook{
    /* width: 168px;
    height: auto; */
    font-family: '한컴 말랑말랑', '돋움';
    font-size: 15px;
    text-align: center;
    
}
.content-todaybook>ul>li{
    background-image: url("${path}/resources/img/sellLev1/todayinner.png");
}

.content-todaybook>ul>li:not(:first-child){
    border-top:none;
}
.content-todaybook>ul>li:hover{
    background-image: url("${path}/resources/img/sellLev1/lev1add2gold.png");
}

.content-todaybook li{
    border: 3px solid #582810;
    
}
#content_ad_banner{
    display: flex;
}
#content_ad_banner>div>img{
    width: 255px;
    height: 128px;
}
.on{
    display: none;
}
.content{

    width: 768px;
    height: 290px;
    margin-top: 20px;
}
#today_book{
    margin-top: 5px;
    height: 300px;
    display: flex;
}
.today_book_form{
    margin: 10px;
    width: 132px;
    height: 250px;
    border: 1px solid #582810;
}
#bookpagebar{
    overflow: hidden;
    display: flex;
    width: 800px;
    padding: 00px 30px 0px 30px;

}

.today_book_form>img{
    width: 92px;
    height: 132px;
}

.main_sub_title>ul{
    z-index: 10;
}

.content-body{
    flex-wrap: wrap;
    display: flex;
}
.content-title{
    padding: 10px;
}
.content-body>div{
    margin-left: 10px;
    margin-top: 0px;
}
#serach-form{
    display: inline-block;
}


#level_container{
    width: 950px;
}
#level_cho{
    margin: 10px;
    padding: 10px;
    border-bottom: 1px solid #582810;
}
#level_cho>div{
    position: relative;
    display: inline-block;
    border: 1px solid #582810;
    font-size: 12px;
}
#level_cho div div{
    top: 21px;
    position: absolute;
    display: flex;
    border: 1px solid #582810;
    background-color: white;
    text-align: center;
    padding: 0px;
    margin: 0px;
}
#level_cho div ul li{
    border-right: 1px solid silver;
    list-style: none;
    width: 60px;
}
#level_cho div ul li:hover{
    background-color: whitesmoke;
    border: 1px solid #582810;
}
.level_catagory_cho{
    text-align: center;
    width: 100px;
    height: 20px;
}
.level_catagory_cho div ul{
    display: inline-block;
    margin: 0px;
    padding:5px;
}

#banner div{
    margin:10px;
}
#banner{
    display: flex;
}
#banner_left{
    width: 768px;
    height: 290px;
}
#banner_right{
    width: 163px;
    height: 290px;
}

#btn_chose>ul{
    width: 850px;
    height: 50px;
    list-style: none;
    text-align: center;
}
#btn_chose>ul>li{
    display: list-item;
    width: 25%;
    float: left;
    background-color: blue;
}
#btn_chose>ul>li>span{
display: block;
border: 1px solid #e5e5e5;
border-bottom: none;
background: #fafafa;
font-weight: bold;
height: 42px;
line-height: 44px;
transition: all 0.2s linear;
}
#btn_chose2>ul{
    width: 850px;
    height: 50px;
    list-style: none;
    text-align: center;
}
#btn_chose2>ul>li{
    display: list-item;
    width: 20%;
    float: left;
    background-color: blue;
}
#btn_chose2>ul>li>span{
    display: block;
    border: 1px solid #e5e5e5;
    border-bottom: none;
    background: #fafafa;
    font-weight: bold;
    height: 42px;
    line-height: 44px;
    transition: all 0.2s linear;
}
#select_bar{
    margin: 10px;
    padding: 10px;
    border-bottom: 1px solid #582810;
}
#select_bar>p{
    display: inline-block;
    margin: 0px;
    font-size: 12px;
    font-family: dotum, sans-serif;
    color: #666;
    line-height: 1.2em;
}
.btn_1{    
    padding: 2 10 10 2px;
    border: 1px solid #582810;
    color: blue;
    font-weight: bold;
    background-color: white;
}
.booklist{
    display: flex;
    width: 100%;
}
.booklist_img{
    width: 115px;
    height: 166px;
}
.booklist_ex{
    width: 576px;
    margin-left: 10px;
}
.booklist_ex>p{
    padding: 0px;
    margin: 0px;
    white-space:normal;
}
.booklist_btn{
    padding: 5px;
    margin-left: 50px;
    width: 118px;
}
.booklist_btn>div{
    text-align: center;
    font-size: 15px;
    color: white;
    border: 1px solid #582810;
    margin-top: 3px;
    background-color: #582810;
    font-weight: bold;
}

.bookView_img{
    text-align: center;
    width: 200px;
    height: 569px;;
}
.bookView_img>img{
    width: 200px;
    height: 300px;
}

.bookView_img>ul{
    list-style: none;
    display: inline-block;
    margin: 0px;
    padding:0px;
}
.bookView_img>ul>li{
    display: inline-block;
    font-size: 12px;
    padding-right: 5px;
}
.bookView_img>div>a{
    border: 1px solid #582810;
    background-color: #582810;
    color: white;
    padding: 1px 30px 1px 30px;
}
.bookView_img>ul>li:first-child{
    border-right: 1px #582810 solid;
}
.bookView_order{
    width: 758px;
}
.bookView_order>div{
    margin: 10px;
    border-bottom: 1px solid #582810;
}
.bookView_order>div>h2{
    margin: 0px;
    margin-bottom: 10px;
}
.bookView_order>div>p{
    margin: 0px;
}
.bookView_order>div>span:not(:last-child){
   border-right: 1px solid #582810;
   padding: 0px 10px 0px 10px;
}
.bookView_order>div:not(h2){
    font-size: 12px;
    font-weight: bold;
}
.bookView_order>div>a{
    margin-top: 10px;
    padding: 15px 40px 15px 40px;
    background-color: #582810;
    color: white;
    text-align: center;
}
.bookView_order>div:last-child{
    padding: 20px 0px 50px 0px;
}
.bookView_info_left{
    width: 751px;
}
.bookView_info_right{
    width: 200px;
}
.bookView_info_left_btn{
    width: 750px;
}
.bookView_info_left_btn a{
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
.bookView_info_left_btn a:hover{
    background-color: rgb(133, 131, 131);
}
.bookView_info_left_event>div{
    padding: 10px;
    margin: 10px;
}
.bookView_info_left_event>div>div>img{
    width: 165px;
    height: 100px;
}
.bookView_info_left_product{
    padding-top: 40px;
}
#table_div{
    padding: 30px;
}
#table_1{
    border: 1px solid silver;
    border-collapse: collapse; 
    border-spacing: 0;
    font-size: 12px;
}

#table_1 tr th{
    border: 1px solid silver;
    width: 124px;
    text-align: center;
    
}
#table_1 tr td{
    border: 1px solid silver;
    width: 560px;
}
#review_list{
    padding: 15px;
    font-size: 13px;
    border-top: 1px #582810 solid;
}
#review_list>div{
    margin: 10px;
    border-bottom: silver dotted 1px;
}
.pagebar{ text-align: center;}




















/*배너 박스 만들기*/
#banner_container{
    position: relative;
    display: flex; 
}
.banner_cho_box ul{
    padding: 0px;
    margin: 0px;
}
.banner_cho_box ul li a{
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
.banner_cho_box ul li a:hover{
    /* background-color: #582810; */
    color: white;
}
.banner_cho_box ul li{
    position: relative;
    list-style: none;
    float: left;
}
.banner_cho_box2{
    display: none;
    position: absolute;
    bottom: 22px;
    left: px;

}
.banner_cho_box2 li{
    z-index: 10;
}
#banner_btn{
    position: absolute;
    z-index: 5;
    top: 40%;
    left: 30px;
}
#banner_btn>button{
    width: 34px;
    height: 37px;
    box-shadow: silver;
}
#banner_btn>button:nth-child(2n){
    position: absolute;
    top: 1px;
    left: 680px;
}






/*===================*/
/*  버튼 위치 정하기*/
#prev{
    margin-left: 12px;
    position: relative;
    padding: 0px;
 
}
#prev>button{
    position: absolute;
    top: 40%;
}
#next{
    width: 50px;
    position: relative;
    padding: 0px;
}
#next>button{
    position: absolute;
    top: 40%;
}
/*=========*/
/*이슈 트렌트*/
#content_body_event{
    margin-right: 20px;
}
#content_body_event>ul>li{
    padding: 10px;
}

/*=========*/
/*컨텐트 바디 타입 2*/
.content_body2{   
    display: flex;
}
.content_body2>a{
    font-size: 20px;
}

.content_body2_left{
    padding: 10px;
    width: 500px;
    height: 250px;
}
.content_body2_left a:first-child{
    font-size: 16px;
    font-weight: bolder;
    border: none;
    text-shadow: 10px;
    padding: 0px;
    margin: 0px;
    margin-right: 20px;
}
.content_body2_left a:not(:first-child){
    border: 1px solid #dadada;
    padding: 5px 10px 1px 10px;
    z-index: 10;
    font-weight: 10px;
    font-size: 13px;
    text-align: center;
    font-weight: bolder;
    
}
.content_body2_left a:not(:first-child):hover{
    border-bottom: 1px solid white;
    color: blue;
}
.content_body2_book{
    display: flex;
    padding: 10px;
    border: 1px solid #dadada;
}

.content_body2_book div img{
    width: 92px;
    height: 132px;
}
.bcategory{
    margin: 0px;
    font-size: 8px;
    color: skyblue;
    font-weight: bold;
    text-align: center;
}
.btitle{
    font-size: 12px;
    text-align: center;
}
.bcontent{
    font-size: 12px;
}
.bprice{
    color: red;
    font-size: 10px;
}
.content_body2_right{
    padding: 10px;
    margin-left: 13px;
    width: 195px;
}

.content_body2_right img{
    padding-top: 20px;
    width: 190px;
    height: 230px;
}
/*바디 2 오른쪽 구조 */
.content_body2_right a{
    font-weight: bolder;
    border: none;
    text-shadow: 10px;
    padding: 0px;
    margin: 0px;
}
.content_body2_right span{
    float: right;
}
.content_body2_right_content div img{
    width: 140px;
    height: 140px;
}
.content_body2_right_content{
    text-align: center;
    border: 1px solid #dadada;
}
.content_body2_right_content:not(:first-of-type){
    display: none;

}
.content_body2_right2{
    padding: 10px;
    margin-left: 13px;
    width: 195px;
}

.content_body2_right2 img{
    padding-top: 20px;
    width: 190px;
    height: 230px;
}
.content_body2_right2 a{
    font-weight: bolder;
    border: none;
    text-shadow: 10px;
    padding: 0px;
    margin: 0px;
}
.content_body2_right2 span{
    float: right;
}
.content_body2_right_content2 div img{
    width: 140px;
    height: 140px;
}
.content_body2_right_content2{
    text-align: center;
    border: 1px solid #dadada;
}
.content_body2_right_content2:not(:first-of-type){
    display: none;

}





/*===========*/

/*이벤트*/
.content_body2_event{
    width: 768px;
    height: 400px;

}

.content_body2_event a:first-child{
    font-weight: bolder;
    border: none;
    text-shadow: 10px;
    padding: 0px;
    margin: 0px;
}

.body_2_event_img>img{
    padding:10px;
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
    font-family: 'dotum',sans-serif;
    color: #666 !important;
    text-decoration: none !important;
    background-color: #fff;
    text-align: center;
    transition: all .2s;
}


</style>


<section id="content">



<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->



 
   <div class="wrap">
<jsp:include page="/WEB-INF/views/sellpart/stickymenu/stickybook.jsp">
<jsp:param name="" value=""/>
</jsp:include>
    <div id="container" class="line">
        <div id="main_snb" class="line">
            <div class="leftlongbanner" style="background-image: url('${path}/resources/img/sellLev1/sellpartlong4.png">
            <h2 ><a href="#"><img src="${path}/resources/img/sellLev1/sellpartsmalllogo.png" style="width: 168px; margin-top: 5px;"></a></h2>
            
            <ul class="main_ul">     
                <li class="main_sub_title" >
                     <a href="${path}/sellbookController/pageBookSearch.do?categoryCode=310040010" class="atag" >아동 도서</a>
                    <ul style="display: none;" class="layer">
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=310010010">한국 그림책 (0~3세)</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=310010020">외국 그림책 (0~3세)</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=310020010">한국 그림책 (4~7세)</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=310020020">외국 그림책 (4~7세)</a></li>
                        
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=310040030">국내 창작 동화(유아)</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=310040020">한국 전래 동화(유아)</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=310040010">세계 명작 동화(유아)</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=310040040">다른나라 그림책(유아)</a></li>
                        
                    </ul>
                </li> 
                <li class="main_sub_title">
                    <a href="${path}/sellbookController/pageBookSearch.do?categoryCode=320040010" class="atag" >초등 도서</a>
                    <ul style="display: none;" class="layer">
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=320010010">초등 동화(1~2학년)</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=320020010">초등 동화(3~4학년)</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=320030010">초등 동화(5~6학년)</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=320040010">초등 동화(공통)</a></li>
                    </ul>
                </li> 
                <li class="main_sub_title" >
                    <a href="${path}/sellbookController/pageBookSearch.do?categoryCode=300050" class="atag" >중등 도서</a>
                    <ul style="display: none;" class="layer">
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=300050">청소년 문학</a></li>
                    </ul>
                </li> 
                <li class="main_sub_title" >
                    <a href="${path}/sellbookController/pageBookSearch.do?categoryCode=100020020" class="atag" >고전 도서</a>
                    <ul style="display: none;" class="layer">
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=100020020">세계문학</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=100020030">세계고전</a></li>
                        <li><a href="${path}/sellbookController/pageBookSearch.do?categoryCode=100020010">한국고전소설</a></li>
                    </ul>
                </li>
           
            </ul>
        </div>
        </div>

        <div id="main_content" class="line">

            <div class="content line" style="margin: 0px;">
                <div style="overflow: hidden; position: relative;" >
                    <div id="banner_container">
                        <a href="#"><img src="${path}/resources/img/sellLev1/sellmain/1300add.png" alt=""></a>
                        <a href="#"><img src="${path}/resources/img/sellLev1/sellmain/1300add2.png" alt=""></a>
                        <a href="#"><img src="${path}/resources/img/sellLev1/sellmain/sell1300add1.png" alt=""></a>
                        <a href="#"><img src="${path}/resources/img/sellLev1/sellmain/1300add3.png" alt=""></a>
                        <a href="#"><img src="http://image.kyobobook.co.kr//ink/images/prom/2021/book/210707_dagger/bnL_w01_f6c1c1.jpg" alt=""></a>
                        <a href="#"><img src="http://image.kyobobook.co.kr//ink/images/prom/2021/book/210705_follow/bnE_w01_a1ddc0.jpg" alt=""></a>
                        <a href="#"><img src="http://image.kyobobook.co.kr//ink/images/prom/2021/banner/210629/bnO_w01_eeecdf6.jpg" alt=""></a>
                        <a href="#"><img src="http://image.kyobobook.co.kr//ink/images/prom/2021/book/210707_dagger/bnL_w01_f6c1c1.jpg" alt=""></a>
                        <a href="#"><img src="http://image.kyobobook.co.kr//ink/images/prom/2021/book/210705_follow/bnE_w01_a1ddc0.jpg" alt=""></a>
                        <a href="#"><img src="http://image.kyobobook.co.kr//ink/images/prom/2021/banner/210629/bnO_w01_eeecdf6.jpg" alt=""></a>
                        <a href="#"><img src="http://image.kyobobook.co.kr//ink/images/prom/2021/book/210707_dagger/bnL_w01_f6c1c1.jpg" alt=""></a>
                        <a href="#"><img src="http://image.kyobobook.co.kr//ink/images/prom/2021/book/210705_follow/bnE_w01_a1ddc0.jpg" alt=""></a>
                    </div>
                    <div id="banner_btn">
                        <button id="prev" style="margin: 0px;">&lt;</button>
                        <button id="next">></button>
                    </div>
                </div>
                 <div class="banner_cho_box" style="margin-left: 100px;">
                    <ul>
                        <li>
                            <a class="banner_cho_hover">어린이/학습</a>
                            <ul class="banner_cho_box2">
                                <li><a class="banner_cho_hover">안녕~</a></li>
                                <li><a class="banner_cho_hover">안녕~</a></li>
                            </ul>
                        </li>

                        <li><a class="banner_cho_hover">문학/실습</a>
                            <ul class="banner_cho_box2">
                                <li><a class="banner_cho_hover">안녕~</a></li>
                                <li><a class="banner_cho_hover">안녕~</a></li>
                            </ul>
                        </li>
                        <li><a class="banner_cho_hover">인문/교양</a>
                            <ul class="banner_cho_box2">
                                <li><a class="banner_cho_hover">안녕~</a></li>
                                <li><a class="banner_cho_hover">안녕~</a></li>
                            </ul>
                        </li>
                        <!-- <li><a class="banner_cho_hover">버즈/수혐</a>
                            <ul class="banner_cho_box2">
                                <li><a class="banner_cho_hover">안녕~</a></li>
                                <li><a class="banner_cho_hover">안녕~</a></li>
                            </ul>
                        </li> -->
                    </ul>

                 </div>    
            </div>
            <div class="lev1add" style="margin-top: 40px;" id="content_ad_banner">
                <div class="line"><img src="${path}/resources/img/sellLev1/lev1add.png" alt=""></div>
                <div class="line"><img src="${path}/resources/img/sellLev1/lev1add.png" alt=""></div>
                <div class="line"><img src="${path}/resources/img/sellLev1/lev1add.png" alt=""></div>
            </div>
  
            <div class="content line" style="margin-top: 70px; height: 230px;">
                <div class="content-title"> 
                    <a href="#" class="contenttitle">이벤트</a><span class="moreview">더보기 +</span> 
                </div>
                <div class="content-body">
                   <div style="width: 530px; height: 150px;" id="content_body_event" class="line content-todaybook">
                        <ul>
                        <c:forEach var="e" items="${event}">
                            <li><a href="${path }/service/eventBoard.do">${e.eventboardTitle }</a></li>
                        </c:forEach>
                        </ul>
                    </div>
                    <div style="width: 100px; height: 150px;"
                    class="line">
                      
                    <img src="${path}/resources/img/sellLev1/unclesam.png" style="height:155px; width:180px;" alt="">   
                    </div>
                </div>
            </div>
  
            <div class="content line"> 
                <div class="content_body2">
                   <div class="content_body2_left line">
                    <a href="#" class="contenttitle"><span style="color:red;">HOT!</span> 국내 창작동화</a><span class="moreview">더보기 +</span>
                     <div class="content_body2_book line">
                         <div>
                            <a class="bsimgLink0" href="#"><img src="#" class="bestsellerimg0" alt=""></a>
                            <p class="bestsellertitle0">책 제목 넣기</p>
                            <div class="bprice0">700원</div>      
                        </div>
                        <div>
                            <a class="bsimgLink1" href="#"><img src="#" class="bestsellerimg1" alt=""></a>
                            <p class="bestsellertitle1">책 제목 넣기</p>
                            <div class="bprice1">700원</div>      
                        </div>
                        <div>
                            <a class="bsimgLink2" href="#"><img src="#" class="bestsellerimg2" alt=""></a>
                            <p class="bestsellertitle2">책 제목 넣기</p>
                            <div class="bprice2">700원</div>      
                        </div>
                        <div>
                            <a class="bsimgLink3" href="#"><img src="#"  class="bestsellerimg3"alt=""></a>
                            <p class="bestsellertitle3">책 제목 넣기</p>
                            <div class="bprice3">700원</div>      
                        </div>                 
             
                     </div>
                     </div>
                     <div class="content_body2_right">        
                        <a>쿠폰 소개</a>
                         <span id="rightclick">></span>
                         <span class="max_book">1</span>
                         <span>/</span>
                         <span class="number_book">1</span>
                         <span id="leftclick">&lt;</span>
                        <div class="content_body2_right_content">
                             <div>
                                 <a href="${path }/member/myroom/main.do"><img src="${path}/resources/img/sellLev1/addgrade/addplatinum.png" alt=""></a>
                             </div>
                             <strong class="btitle">곰문이 플래티넘!!</strong>
                             <div class="bprice">13000</div>
                             <div class="bpricesale">11000</div>

                        </div>
                        <div class="content_body2_right_content">
                         <div>
                             <a href="${path }/member/myroom/main.do"><img src="${path}/resources/img/sellLev1/addgrade/addgold.png" alt=""></a>
                         </div>
                         <strong class="btitle">곰문이 골드!</strong>
                         <div class="bprice">13000</div>
                         <div class="bpricesale">11000</div>

                         </div>
                         <div class="content_body2_right_content">
                             <div>
                                 <a href="${path }/member/myroom/main.do"><img src="${path}/resources/img/sellLev1/addgrade/addsilver.png" alt=""></a>
                             </div>
                             <strong class="btitle">곰문이 실버</strong>
                             <div class="bprice">13000</div>
                             <div class="bpricesale">11000</div>
 
                         </div>
                         <div class="content_body2_right_content">
                             <div>
                                 <a href="${path }/member/myroom/main.do"><img src="${path}/resources/img/sellLev1/addgrade/addbronze.png" alt=""></a>
                             </div>
                             <strong class="btitle">브론즈</strong>
                             <div class="bprice">13000</div>
                             <div class="bpricesale">11000</div>
 
                         </div>
                         <div class="content_body2_right_content">
                             <div>
                                 <a href="${path }/member/myroom/main.do"><img src="${path}/resources/img/sellLev1/addgrade/addddong.png" alt=""></a>
                             </div>
                             <strong class="btitle">ㅇㅇ;</strong>
                             <div class="bprice">13000</div>
                             <div class="bpricesale">11000</div>
 
                         </div>
                </div>
                </div>
            </div>



        </div>
    </div>
</div>

    <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////
     -->

<script>


	$(".tt").hover(e=>{
	function adong(searchData){
		$.ajax({
			url: "${path}/ebook/search.do",
			type: "post",
			data: searchData,
			dataType: "json",
			success: data => {
				console.log(data+"dddddddddddddddd");
			}
		})
	}
	});
	


    let atag1=$(".main_ul")[0].children[0];
    let atag2=$(".main_ul")[0].children[1];
    let atag3=$(".main_ul")[0].children[2];

    $(atag1.children[0]).hover((e)=>{
        $(e.target).css({"background-color":"#582810","color":"white"});
        
    },(e)=>{
        $(e.target).css({"background-color":"white","color":"#582810"});
       
    });
    $(atag2.children[0]).hover((e)=>{
        $(e.target).css({"background-color":"#582810","color":"white"});
        
    },(e)=>{
        $(e.target).css({"background-color":"white","color":"#582810"});
       
    });
    $(atag3.children[0]).hover((e)=>{
        $(e.target).css({"background-color":"#582810","color":"white"});
        
    },(e)=>{
        $(e.target).css({"background-color":"white","color":"#582810"});
       
    });



    //좌측 내비바 show / hide 
    $(".main_sub_title").hover((e)=>{
        $(e.target).next('ul').show();
    },(e)=>{
        $(e.target).next('ul').hide();
        if($(".layer").not().hover()){
            $(".layer").hide();
        }
    });

    //배너바 선택 show / hide
    let chobox=$(".banner_cho_box")[0].children[0];
    let choboxinner=$(".banner_cho_box")[0].children[0].children;
    $(chobox).hover((e)=>{
        $(e.target).next('ul').show();
    },(e)=>{
        $(e.target).next('ul').hide(); 
        if($(".banner_cho_box2").not().hover()){
            $(".banner_cho_box2").hide();
        } 
    })

     //배너 슬라이드 
    $(function(){
        const banner = $("#banner_container");
        console.log($("#banner_container").outerWidth());
        const bannerWidth = $("#banner_container").children(0).outerWidth();
        const bannerHeight = $("#banner_container").children(0).outerHeight();
        const bannerlength = $("#banner_container").children("a").length;
        console.log(bannerHeight+'안녕'+bannerWidth+"개수"+bannerlength)
        var movingwidth=0;
        var bannercount=0;
        $("#prev").click(e=>{
           bannercount--; 
           console.log(bannercount)
            if(bannercount<=0){
                bannercount=bannerlength;
                
                movingwidth=(bannerlength-1)*bannerWidth;
                console.log(movingwidth)
                banner.animate({
                    right:movingwidth
                },1000)               
            }else{
            movingwidth=movingwidth-bannerWidth;
            banner.animate({
                right:movingwidth}, 1000
                );
             }
        });

        $("#next").click(e=>{
            bannercount++; 
            console.log(bannercount)
            if(bannercount>=bannerlength){
                bannercount=0;
                movingwidth=0;
                console.log(movingwidth)
                banner.animate({
                    right:movingwidth
                },1000)
            }else{
            movingwidth=movingwidth+bannerWidth;
            banner.animate({
                right:movingwidth}, 1000
                );  
            }
        });
        $(".banner_cho_hover").eq(0).hover(e=>{ banner.css({ right:bannerWidth*0})})
        $(".banner_cho_hover").eq(1).hover(e=>{ banner.css({ right:bannerWidth*1})})
        $(".banner_cho_hover").eq(2).hover(e=>{ banner.css({ right:bannerWidth*2})})
        $(".banner_cho_hover").eq(3).hover(e=>{ banner.css({ right:bannerWidth*3})})
        $(".banner_cho_hover").eq(4).hover(e=>{ banner.css({ right:bannerWidth*4})})
        $(".banner_cho_hover").eq(5).hover(e=>{ banner.css({ right:bannerWidth*5})})
        $(".banner_cho_hover").eq(6).hover(e=>{ banner.css({ right:bannerWidth*6})})
        $(".banner_cho_hover").eq(7).hover(e=>{ banner.css({ right:bannerWidth*7})})
        $(".banner_cho_hover").eq(8).hover(e=>{ banner.css({ right:bannerWidth*8})})
        $(".banner_cho_hover").eq(9).hover(e=>{ banner.css({ right:bannerWidth*9})})
        $(".banner_cho_hover").eq(10).hover(e=>{ banner.css({ right:bannerWidth*10})})
        $(".banner_cho_hover").eq(11).hover(e=>{ banner.css({ right:bannerWidth*11})})
    });

    //오늘의 책 슬라이드 적용
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
    //이벤트 이동 버튼 
    $(function(){
                const rightcontentimg=$(".content_body2_right_content");
                const imglength=$(".content_body2_right_content").length;
                let imgnum=1;
                $(".max_book").text(imglength);
                   function number_target(imgnum){
                    rightcontentimg.css("display","none");                       
                    rightcontentimg.eq(imgnum-1).css("display","block")
                    $(".number_book").text(imgnum);
            }
                $("#leftclick").click(e=>{
                    imgnum--;
                    number_target(imgnum);
                    console.log(imgnum)
                    if(imgnum<1){
                        imgnum=imglength;
                        number_target(imgnum);
                    }
                })
                $("#rightclick").click(e=>{
                    imgnum++ 
                    number_target(imgnum);
                    if(imgnum>$(".max_book").text()){
                        imgnum=1;
                        number_target(imgnum);
                    }
                })
        })

        $(function(){
                const rightcontentimg=$(".content_body2_right_content2");
                const imglength=$(".content_body2_right_content2").length;
                let imgnum=1;
                $(".max_book2").text(imglength);
            function number_target(imgnum){
                    rightcontentimg.css("display","none");                       
                    rightcontentimg.eq(imgnum-1).css("display","block")
                    $(".number_book2").text(imgnum);
            }
                $("#leftclick2").click(e=>{
                    imgnum--;
                    number_target(imgnum);
                    console.log(imgnum)
                    if(imgnum<1){
                        imgnum=imglength;
                        number_target(imgnum);
                    }
                })
                $("#rightclick2").click(e=>{
                    imgnum++ 
                    number_target(imgnum);
                    if(imgnum>$(".max_book2").text()){
                        imgnum=1;
                        number_target(imgnum);
                    }
                })
        })
</script>
	


</section>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp"/>