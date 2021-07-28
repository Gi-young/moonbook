<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>

<script>

window.onload=funtion(){
	
	
}

</script>


<style>

/* @import url(${path}/resources/css/style.css); */
/* body{
	position: relative;
} */

body{
	overflow-x:hidden;
	overflow-y:auto;
}
li{
    list-style: none;
    /* margin-left: -40px; */
}
.mouseoverbtn{
    width: 95px;
    height: 38px;
    
}
.mouseoverbtnborder{
    background-color: white;
    border: 1px solid rgb(187, 187, 187);
    font-weight: bold;
    text-align: center;
    justify-content: center;
    line-height: 35px;
}
.mouseoverbtnbg{
    background-color: rgb(231, 231, 231);
    font-weight: bold;
    text-align: center;
    justify-content: center;
    line-height: 35px;
}
.bottomline{
    border-bottom: rgb(48, 48, 48) 1px solid;
}
/* .trigger1:hover{
    background-color: #582810;
} */
button{
    border: 1px solid rgb(206, 206, 206);
    display: block;
    
}
.textalign{
    text-align: center;
}
.outline{
    border: 1px solid rgb(206, 206, 206);
}
a { 
    text-decoration:none
}
.margintop50{
    margin-top: 50px;
}

.margintop20{
    margin-top: 20px;
}
.margintop10{
    margin-top: 10px;
}
.strong{
    font-weight: bold;

}
.middlefont{
    font-size: 14.5px;
    margin-left: 10px;
    font-weight: bold;
    margin-bottom: 10px;
}
.partition{
    margin-top: 35px;
}
.test{
	background: red;
    
}
.justify{
    display: flex;
    justify-content: space-around;
}

.widebg{
	background: rgb(255, 227, 250);
    width: 100%;
    min-width: 950px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    
}
.mainsearchBox-slideContent{
    width: 1300px;
    height: 400px;
}
.bannerbtn{
    width: 15px;
    height: 15px;
    background-color: #582810;
    border-radius: 100%;
    margin-left: 10px;
    display: block;
}
.bannerNewbtn{
    width: 15px;
    height: 15px;
    background-color: #582810;
    border-radius: 100%;
    margin-left: 10px;
    display: block;
}
.bannerBg{
    /* background-color: #b7caff; */
    width: 100%;
    min-width: 950px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    
}
.mainbtn{
    align-items: center;
}
.mainslide-pagination{
    display: flex;
    border: 10px solid black;
}
.mainsearchBox-slideBtn-next{
    height: 30px;
    
}
.mainsearchBox-slideBtn-prev{
    height: 30px;
}
.wrap{
    min-width: 950px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.wrap2{
    min-width: 950px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.todaycg{
    width: 70px;
    height: 20px;
    text-align: center;
    margin-left: 10px;
}


.todaybtn1{
    width: 90px;
    height: 25px;
    padding-top: 10px;
}
.todaybtn2{
    width: 90px;
    height: 25px;
    padding-top: 10px;
}
.todaybtn3{
    width: 90px;
    height: 25px;
    padding-top: 10px;
}


.todaycontent{
    width: 250px;
    height: 300px;

    display: flex;
    justify-content: center;
    align-items: center;
    padding-left: 60px;
    padding-right: 60px;
    align-content: center;
}





.todaylevboxset{
    width: 250px;
    height: 300px;
    
    overflow: hidden; 
    position: relative;
}
.todaylev2boxset{
    width: 400px;
    height: 300px;
    
    overflow: hidden;
    position: relative;
}

.boxset{
    width: 817px;
    overflow: hidden;
    position: relative;
}
.boxsetNew{
    width: 950px;
    overflow: hidden;
    position: relative;
}
.hotnewwidebg{
    width: 100%;
    min-width: 950px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    
}

.btndown{
    display: flex;
    align-items: flex-end;
}
.mainbanner{
width: 1300px;

    align-items: center;
}
.mainbanner_obj1{
    width: 1300px;
    height: 400px;
    overflow: hidden;
}

.mainbanner_objcontainer{
    width: 702px;
    background-color: #77f78c;
    height: 40px;
}
.mainbanner_objinner{
    width: 100px;
    background-color: #d65d8b;
    height: 38px;
}
.mainbanner_obj2{
    width: 237px;
    border: 1px solid #5f5858;
    background-color: white;
    height: 370px;
    text-align: center;
    border: 1px solid rgb(206, 206, 206);
}
.mainbanner_add{
    width: 117px;
    margin-left: 10px;
    
}
.bannerwrap{
    
    width: 1200px;
    display: flex;
    justify-content: center;
    /* margin-top: 40px; */
    
}
.todaybooks{
    width: 950px;
    height: 400px;
    display: flex;
    flex-direction: column;
}
.imgborder{
    border: 1px solid #8a8a8a;
}
.hotnewcg{
    margin-top: 20px;
    font-size: 13px;
    color: #5b73fa;
    font-family: "돋움";
}
.hotnewtitle{
    margin-top: 14px;
    font-size: 14px;
    font-weight: bold;
}
.hotnewjccenter{
    justify-content: center;
    align-items: center;
}

.hotListflex{
    display: flex;
    margin-bottom: 30px;
}
.hotnew{
    width: 950px;
    background-color: white;
    height: 400px;
}
.hotnewimgsize{
    width: 100px;
    height: 150px;
    border: 1px solid #8a8a8a;
}
.hotnewbox{
    width: 950px;
    height: 300px;
    
    display: flex;
    justify-content: space-between;

}
.hotnewinner{
    display: flex;
    flex-direction: column;
    width: 221px;
    height: 300px;
    border: 1px solid #c5c5c5;
    
}
.hotslide_btn_next{
    width: 30px;
    height: 30px;
    background-color: #08080873;
}
.hotslide_btn_prev{
    width: 30px;
    height: 30px;
    background-color: #08080873;
}
.hotNewslide_btn_prev{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}
.hotNewslide_btn_next{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}
.todaylev1slide_btn_prev{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}
.todaylev1slide_btn_next{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}
.todaylev2slide_btn_next{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}
.todaylev2slide_btn_prev{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}
.todaylev3slide_btn_next{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}
.todaylev3slide_btn_prev{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}
.todaylev4slide_btn_next{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}
.todaylev4slide_btn_prev{
    width: 30px;
    height: 30px;
    background-color: #08080873;
    margin-top: 25px;
}

.btnleftposition{
    position: absolute;
    top: 40%;
    left: 2%;
    z-index: 1000;
}
.btntodayleftposition{
    position: absolute;
    top: 40%;
    left: 2%;
    z-index: 1000;
}
.btntodayrightposition{
    position: absolute;
    top: 40%;
    right: 0%;
    z-index: 100000;
}
.btntodayrightposition2{
    position: absolute;
    top: 40%;
    right: 2%;
    z-index: 1000;
}
.btntodayrightposition3{
    position: absolute;
    top: 40%;
    right: 2%;
    z-index: 1000;
}

.btnNewleftposition{
    position: absolute;
    top: 40%;
    left: 0.1%;
    z-index: 100000;
}
.btnNewrightposition{
    position: absolute;
    top: 40%;
    right: 0.1%;
    z-index: 1000;
}
.btnrightposition{
    position: absolute;
    top: 40%;
    right: 2%;
    z-index: 1000;
}
.risingStarBg{
    width: 950px;
    background-color: #c8ff00;
    height: 290px;
}
.weekBookBg{
    width: 950px;
    /* background-color: #ff6da5; */
    height: 305px;
}
.risingStar1{
    width: 133px;
    background-color: #582810;
    height: 115px;
 
}
.alignitems{
    align-items: center;
}

.risingStar2{
    width: 817px;
    background-color: #5f5858;
    height: 290px;
}
.hotbtn{
    align-items: center;
}
.hotfont{
    color: rgb(255, 255, 255);
    margin-top: 15px;
    width: 133px;
    height: 10px;
}
.hotfontinner{
    font-family: "바탕";
    line-height: 130%;
    color: rgb(255, 255, 255);
    font-size: x-large;
    text-align: center;
    margin-top: 15px;
}
.hotnewObj{
    width: 224px;
    /* background-color: #86e7ff; */
    height: 350px;
    margin-right: 18px;

}
.hotnewObj2{
    width: 224px;
    /* background-color: #5a0053; */
    height: 350px;
    margin-left: 24px;
}
.todaybooks21{
    width: 600px;
    /* background-color: #32a374; */
    height: 50px;
}
.todaybooks22{
    width: 50px;
    /* background-color: #43ffb1; */
    height: 50px;
}



.flex{
    display: flex;
}

.todaybooksadd1{
    width: 250px;
    
    height: 300px;
}
.todaybooksadd2{
    width: 400px;
    background-color: #ff2655;
    height: 300px;
}
.todaybooksadd3{
    width: 300px;
    height: 200px;
}
.todaybooksadd4{
    width: 300px;
    height: 96px;
}

.bestsellerlist{
    width: 750px;
    height: 260px;
    display: flex;
    align-items: center;
    text-align: center;
    background-color: #ffffff;
}
li[class^="best"]{
    padding-left: 60px;
}
.bestseller12{
    width: 100px;
    height: 146px;
}
.bestseller310{
    width: 73px;
    height: 107px;
}
.author{
    margin-top: 6px;
    font-size: 12px;
    color: #8b8b8b;
}

.bestSeller_chart:not(:first-child){
 
    
    /* background-color: #93bbc2; */
    height: 670px;
    width: 100%;
    min-width: 950px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-image: url('${path}/resources/img/main/bestseller/background.png');
}

.icon{
    padding-bottom: 10px;
    width: 40px;
    height: 30px;
    display: flex;
    align-items: center;
}
.iconred{
    background-color: #c41c1c;
    font-size: 30px;
    color: #ffffff;
}
.icongray{
    background-color: #8a8a8a;
}
.rankwhite{
    font-size: 30px;
    color: #ffffff;
}
.rankgray{
    font-size: 30px;
    color: #ffffff;
}
.rank{
    font-size: 30px;
    color: #8a8a8a;
    
    
}
.bestSellerContainer{
    width: 146px;
    background-color: #ff8080;
    height: 225px;
    margin-top: 10px;
    margin-left: 5px;
    margin-right: 20px;
}


.bestSeller_right{
    
    width: 190px;
    background-color: #ffffff;
    height: 545x;
    margin-left: 10px;
}
.bestSeller_innerRight{

    width: 190px;
    background-color: #00ffea;
    height: 232px;

}



.marginTop45{
    margin-top: 45px;
}


.displaynone{
    display: none;
}






.weekbookcontent{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 150px;
    height: 190px;

    background-color: #f4f4f4;
        
}
.weekBookContainer{
    min-width: 640px;
    width: 100%;
    background-color: #6aff5c;
    height: 270px;

}
.weekBookInnerContainer{
    width: 150px;
    background-color: #ff8080;
    height: 190px;

}
.weekBookObj{

    width: 150px;
    background-color: #ceff8e;
    height: 250px;
    margin-right: 10px;
    margin-left: 10px;
}
.weekBookAdd{
    width: 300px;
    background-color: #2cc46b;
    height: 250px;
    margin-left: 10px;

}

.minibtn{
    width: 50%;
    height: 45px;
    background-color: #2cc46b;
}





.title{
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    
}
.khloverbg1{
    width: 220px;
    height: 410px;
    border: 8px solid #d1d1d1;
}
.khloverbg2{
    width: 704px;
    height: 422px;
    margin-top: 15px;
    flex-direction: column;
    align-items: center;
  
}
.khloverul{
    justify-content: space-between;
    margin-top: 60px;
    text-align: center;
    margin-left: 30px;
}

.khloverright{

    justify-content: center;
    align-items: center;
    width: 150px;
    height: 190px;
    margin-right: 20px;
    /* background-color: #f4f4f4; */
        
}
.khloverBg{
    width: 950px;
    background-color: white;
    height: 460px;
}
.khlover_container1{
    width: 250px;
    /* background-color: #f1f1f1; */
    height: 410px;
    border: 5px solid #d1d1d1;
}
.khlover_container2{
    width: 704px;
    /* background-color: #68c3ff; */
    border: 2px solid #d1d1d1;
    height: 410px;
    margin-left: 10px;
}
.khloverscore{
    font-weight: bold;
}
.khloveritem1{
    width: 130px;
    height: 180px;
}

.khlover_right{
    width: 166px;
    /* background-color: #fff674; */
    height: 350px;
    margin-top: 30px;
    margin-left: 10px;
    margin-right: 10px;
}
.khlover_obj0{
    width: 127px;
    /* background-color: #5b73fa; */
    height: 162px;
    margin-top: 90px;
    margin-left: 50px;
}
.khlover_obj{
    width: 127px;
    /* background-color: #5b73fa; */
    height: 162px;
    margin-top: 60px;
    margin-left: 15px;
}

.upFooterBg{
    width: 950px;
    background-color: white;

}
.upFooter_upSide{
    width: 450px;
    /* background-color: #ff1cf4; */
    height: 30px;
}
.upFooter_upSidegg{
    width: 450px;
    /* background-color: #ff1cf4; */
    height: 30px;
    align-items: center;
}
.upFooter_downSide{
    width: 190px;
    background-color: white;
    height: 200px;
    font-size: 15px;
    line-height: 170%;
    
    
}
.btnFooter{
    width: 180px;
    border: #8a8a8a solid 1px;
    height: 100px;
    
    margin-right: 10px;
}
.btnfootertext{
    font-size: 13px;
    font-weight: bold;
    text-align: center;
    color: black;
    margin-top: 17px;
}
.btnfooterpointer{
    color: #8a8a8a;
}
.mainsearchBox-slideBox{
    width: 1300px;
    height: 400px;
}

.boldline{
    width: 100%;
    height: 1px;
    background-color: #8a8a8a;
    margin-top: 100px;
}
.line{
    width: 100%;

}
.verticalline{
    border-right: 1px solid #8a8a8a;
    height: 200px;
    scale:space-around;
}
.verticalline2{
    border-right: 1px solid #8a8a8a;
    height: 200px;
    scale:space-around;
    opacity:1; 
}

.btnfooterslide{
    width: 15px;
    height: 15px;
}
.plus{
    margin-left: 520px;
    width: 18px;
    height: 18px;
    border: #8a8a8a solid 1px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.footerheadline{
    width: 950px;
}
.footerheadlinebs{
    width: 750px;
    justify-content: space-between;
    margin-right: 200px;
    
}
.footerheadlinetoday{
    width: 70px;
    height: 21px;
}
.basicset{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.footerul{
    margin-left: 10px;
}
.footerp{
    font-weight: bold;
    margin-top: 1px;
    font-size: 13px;
}
.ataggray{
    color: #8a8a8a;
}
.underbar{
    border-bottom: #5f5858;
}
.footerslide{
    width: 350px;
    height: 15px;
}
.borderright{
   width: 80px;
    border-right: #8a8a8a 1px solid;
}
.footernoticebox-slideList{
    width: 250px;
    height: 45px;
    background-color: #bdabab;
}
.footerbtn{
    height: 10px;
}
.footerbox{
    width: 350px;
    height: 20px;
    overflow: hidden;
}
.footerslide-content{
    height: 20px;
}
.footerslide-content:not(:last-child){
padding-bottom: 5px;
}

.footerslide2-content{
    height: 20px;
}

.footerslide2-content:not(:last-child){
padding-bottom: 5px;

}

.hidden {
    display: none;
  }
</style>

<!-- ////////////////////////상위배너/////////////////////// -->

<div class="wrap">
<div class="bannerBg">
<div class="flex bannerwrap">
<div class="">
<!-- <div class="mainbtn flex"> -->
<!-- <button class="mainsearchBox-slideBtn-next">이전</button> -->

<div class="mainbanner_obj1">
    <div class="mainsearchBox-slideBox">
        <div class="btndown mainsearchBox-slideList">
            <div class="mainsearchBox-slideContent mainbanner1">
                <a href="#"><img alt="banner1" src="${path}/resources/img/main/banner/1300add1.png"></a>
            </div>
            <div class="mainsearchBox-slideContent mainbanner2">
                <a href="#"><img alt="banner2" src="${path}/resources/img/main/banner/1300add2.png"></a>
            </div>
            <div class="mainsearchBox-slideContent mainbanner3">
                <a href="#"><img alt="banner3" src="${path}/resources/img/main/banner/1300400.png"></a>
            </div>
            <div class="mainsearchBox-slideContent mainbanner4">
                <a href="#"><img alt="banner4" src="${path}/resources/img/main/banner/1300add3.png"></a>
            </div>
            <div class="mainsearchBox-slideContent mainbanner5">
                <a href="#"><img alt="banner5" src="${path}/resources/img/main/banner/1300add4.png"></a>
            </div>
            <div class="mainsearchBox-slideContent mainbanner6">
                <a href="#"><img alt="banner6" src="${path}/resources/img/main/banner/1300400.png"></a>
            </div>
            <div class="mainsearchBox-slideContent mainbanner7">
                <a href="#"><img alt="banner7" src="${path}/resources/img/main/banner/1300add3.png"></a>
            </div>
        </div>
        
        <ul class="mainslide-pagination" style="width: 20px; height: 10px; display: none;">
        </ul>
    </div>
</div>
<!-- <button class="mainsearchBox-slideBtn-prev">다음</button> -->
</div>
</div>
<div class="flex">
        <p class="maintrigger1 mouseoverbtn mouseoverbtnbg " style="background-color: #582810; color: white;"></p>
        <p class="maintrigger2 mouseoverbtn mouseoverbtnbg "></p>
        <p class="maintrigger3 mouseoverbtn mouseoverbtnbg "></p>
        <p class="maintrigger4 mouseoverbtn mouseoverbtnbg "></p>
        <p class="maintrigger5 mouseoverbtn mouseoverbtnbg "></p>
        <p class="maintrigger6 mouseoverbtn mouseoverbtnbg "></p>
        <p class="maintrigger7 mouseoverbtn mouseoverbtnbg "></p>
    </div>

<!-- <div class="mainbanner_obj2">
    <img alt="bookcast" src="${path}/resources/img/main/banner/bookcast.gif" style="margin-top: 20px;">
    <ul>
        <li class="underbar">
            <a>
                <img alt="prince" src="${path}/resources/img/main/banner/prince.png" style="width: 150; height: 83; margin-top: 20px;" class="outline">
                <p style="margin-top: 20px; font-weight: bold;">지도자의 길</p>
                <p style="margin-top: 8px;">"전 19살이고 <br>복세편살입니다."</p>
            </a>
        </li>
    </ul>
        <hr style="margin-top: 10px;">
        <li style="margin-top: 20px;">안녕하세요</li>
        <li>어제는 편히 쉬셨나요</li>
        <li>식사는 맛있게 하셨나요</li>
        <li>캠 켜주세요 캠</li>
    </ul>
</div>  

</div> -->
<!-- <div>
    <div class="mainbanner_add outline">
        <img alt="bookcast" src="${path}/resources/img/main/banner/booknews.png" >
    </div>
    <div class="mainbanner_add outline" style="margin-top: 8px;">
        <img alt="bookcast" src="${path}/resources/img/main/banner/booknewsadd.png">
    </div>
</div> -->
    
    </div>
    
<!-- ////////////////////////오늘의 책/////////////////////// -->

    <!-- <div class="todaybooks partition">
        <div class="flex alignitems" style="margin-bottom: 5px;" id="fullbox">
            <div class="footerheadlinetoday">
                <p style="font-weight: bold; width: 70px;">오늘의 책</p>
            </div>
            <div class="todaysection">
                <p class="todaycg todaybtn1" style="margin-left: 60px; background-color: #582810; color:white">국내도서</p>
            </div>
            <div class="todaysection">
                <p class="todaycg todaybtn2">eBook</p>
            </div>
            <div class="todaysection">
                <p class="todaycg todaybtn3">기프트</p>
            </div>
            <button class="plus">+</button>
        </div>
        <div class="flex todaydiv1" >
            <div class="container2 flex outline">


        <div class="todaylev1Box-slideBox todaylevboxset">
            <div class="todaylev1slide_btn_prev btntodayleftposition"></div>
            <ul class="todaylev1slide_list flex">
                <li class="todaylev1slide_content todaycontent">
                    <a href="#"><img src="${path}/resources/img/main/dummybooks/dummy1.jpg" style="width: 130px; height: 200px;"></a>
                </li>
                <li class="todaylev1slide_content todaycontent ">
                    <a href="#"><img src="${path}/resources/img/main/bestseller/bestseller12.png" style="width: 120px; height: 180px;"></a>
                </li>
                <li class="todaylev1slide_content todaycontent">
                    <a href="#"><img src="${path}/resources/img/main/week/weekadd1.png" style="width: 130px; height: 200px;"></a>
                </li>
            </ul>
            <div class="todaylev1slide_pagination" style="height: 50px;  justify-content: center;" >
            </div>
            <div class="todaylev1slide_btn_next btntodayrightposition"></div>
        </div>
        <div class="todaylev2Box-slideBox todaylev2boxset">
    <!-- 버튼 
        <div class="todaylev2slide_btn_prev btntodayleftposition"></div>

        <div class="flex todaylev2slide_list inneradd1">
        <div class="todaybooksadd2 todaylev2slide_content todayinnerdt1">
            <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd.png"></a>
        </div>
        <div class="todaybooksadd2 todaylev2slide_content todayinnerdt2">
            <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd2.png"></a>
        </div>
        <div class="todaybooksadd2 todaylev2slide_content todayinnerdt3">
            <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd3.png"></a>
        </div> 
        </div>

        <!-- 리스트 2~3 
        <div class="flex todaylev2slide_list inneradd2">
            <div class="todaybooksadd2 todaylev2slide_content todayinnerdt1">
                <a href=""><img src="${path}/resources/img/main/todaybook/meatadd1.png"></a>
            </div>
            <div class="todaybooksadd2 todaylev2slide_content todayinnerdt2">
                <a href=""><img src="${path}/resources/img/main/todaybook/meatadd2.png"></a>
            </div>
            <div class="todaybooksadd2 todaylev2slide_content todayinnerdt3">
                <a href=""><img src="${path}/resources/img/main/todaybook/meatadd3.png"></a>
            </div> 
            </div>
        
        <div class="flex todaylev2slide_list inneradd3">
                <div class="todaybooksadd2 todaylev2slide_content todayinnerdt1">
                    <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd.png"></a>
                </div>
                <div class="todaybooksadd2 todaylev2slide_content todayinnerdt2">
                    <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd2.png"></a>
                </div>
                <div class="todaybooksadd2 todaylev2slide_content todayinnerdt3">
                    <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd3.png"></a>
            </div> 
        </div>




                    <div class="flex todaylev2slide_list">
                        <div class="todaybooksadd2 todaylev2slide_content todayinnerdt1">
                            <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd.png"></a>
                        </div>
                        <div class="todaybooksadd2 todaylev2slide_content todayinnerdt2">
                            <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd2.png"></a>
                        </div>
                        <div class="todaybooksadd2 todaylev2slide_content todayinnerdt3">
                            <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd3.png"></a>
                        </div> 
                    </div>

                    <div class="flex todaylev2slide_list">
                            <div class="todaybooksadd2 todaylev2slide_content todayinnerdt1">
                                <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd.png"></a>
                            </div>
                            <div class="todaybooksadd2 todaylev2slide_content todayinnerdt2">
                                <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd2.png"></a>
                            </div>
                            <div class="todaybooksadd2 todaylev2slide_content todayinnerdt3">
                            <a href=""><img src="${path}/resources/img/main/todaybook/unclesamadd3.png"></a>
                    </div> 
                    </div>
                <div class="todaylev2slide_pagination" style="height: 50px;  justify-content: center; display: none;" >
                </div>
                <div class="todaylev2slide_btn_next btntodayrightposition2" ></div>
                    </div>
            </div>
            <div class="container2 alignitems textalign">
                <div class="todaybooksadd3 outline">
                    <img alt="bookcast" src="${path}/resources/img/main/todaybook/todaybookadd1.png">
                </div>
                <div class="todaybooksadd4 outline">
                    <img alt="bookcast" src="${path}/resources/img/main/todaybook/todaybookadd3.png" style="margin-top: 7px;">
                </div>
            </div>
        </div>

        
        <div class="flex todaydiv2 hidden" >
            <div class="container2 flex outline">


                <div class="todaylev1Box-slideBox todaylevboxset">
                    <div class="todaylev3slide_btn_prev btntodayleftposition"></div>
                    <ul class="todaylev3slide_list flex">
                        <li class="todaylev3slide_content todaycontent ">
                            <a href="#"><img src="${path}/resources/img/main/bestseller/bestseller12.png" style="width: 120px; height: 180px;"></a>
                        </li>
                        <li class="todaylev3slide_content todaycontent">
                            <a href="#"><img src="${path}/resources/img/main/week/weekadd1.png" style="width: 130px; height: 200px;"></a>
                        </li>
                        <li class="todaylev3slide_content todaycontent">
                            <a href="#"><img src="${path}/resources/img/main/dummybooks/dummy1.jpg" style="width: 130px; height: 200px;"></a>
                        </li>
                    </ul>
                    <div class="todaylev3slide_pagination" style="height: 50px;  justify-content: center;" >
                    </div>
                    <div class="todaylev3slide_btn_next btntodayrightposition"></div>
                </div>


                <div class="todaylev4Box-slideBox todaylev2boxset">
                <div class="todaylev4slide_btn_prev btntodayleftposition"></div>


                <div class="flex todaylev4slide_list">
                <div class="todaybooksadd2 todaylev4slide_content todayinnerdt1">
                    <a href=""><img src="${path}/resources/img/main/todaybook/meatadd1.png"></a>
                </div>
                <div class="todaybooksadd2 todaylev4slide_content todayinnerdt2">
                    <a href=""><img src="${path}/resources/img/main/todaybook/meatadd2.png"></a>
                </div>
                <div class="todaybooksadd2 todaylev4slide_content todayinnerdt3">
                    <a href=""><img src="${path}/resources/img/main/todaybook/meatadd3.png"></a>
                </div> 
            </div>


            <div class="todaylev4slide_pagination" style="height: 50px;  justify-content: center; display: none;" >
            </div>
            <div class="todaylev4slide_btn_next btntodayrightposition3" ></div>
            </div>
        </div>
        <div class="container2 alignitems textalign">
            <div class="todaybooksadd3 outline">
                <img alt="bookcast" src="${path}/resources/img/main/todaybook/todaybookadd1.png">
            </div>
            <div class="todaybooksadd4 outline">
                <img alt="bookcast" src="${path}/resources/img/main/todaybook/todaybookadd3.png" style="margin-top: 7px;">
            </div>
        </div>

            <!-- <div class="container2 flex">
                    <div class="todaybooksadd1">
                        B슬라이드 자리
                    </div>
                    <div class="todaybooksadd2">
                        B상세 슬라이드자리
                    </div>
            </div>
            <div class="container2 alignitems textalign">
                <div class="todaybooksadd3 outline">
                    <img alt="bookcast" src="${path}/resources/img/main/todaybook/todaybookadd1.png">
                </div>
                <div class="todaybooksadd4 outline">
                    <img alt="bookcast" src="${path}/resources/img/main/todaybook/todaybookadd3.png" style="margin-top: 7px;">
                </div>
            </div> 

        </div>

        <div class="flex todaydiv3 hidden" >
            <div class="container2 flex">
                    <div class="todaybooksadd1">
                        C슬라이드 자리
                    </div>
                    <div class="todaybooksadd2">
                        C상세 슬라이드자리
                    </div>
            </div>
            <div class="container2 alignitems textalign">
                <div class="todaybooksadd3 outline">
                    <img alt="bookcast" src="${path}/resources/img/main/todaybook/todaybookadd1.png">
                </div>
                <div class="todaybooksadd4 outline">
                    <img alt="bookcast" src="${path}/resources/img/main/todaybook/todaybookadd3.png" style="margin-top: 7px;">
                </div>
            </div>
        </div>
        
    </div> -->

<!-- ////////////////////////따끈따끈 신작/////////////////////// -->

    <div class="hotnew todaybooks partition">
        <div class="flex alignitems">
            <div class="footerheadline">
                <p style="font-weight: bold;">따끈따끈 신작</p></div>
                <a href="#"><img src="${path}/resources/img/main/icon/plusicon.png"></a>
        </div>
        <div class="hotNewsearchBox-slideBox boxsetNew">
            <div class="hotNewslide_btn_prev btnNewleftposition"></div>
            <ul class="hotNewslide_list hotListflex " style="margin-top: 30px; justify-content: space-around;">

                <li class="hotNewslide_content hotnewbox">
                    <div class="hotnewinner hotnewjccenter">
                    <div>
                        <a href="${path}/sellbookController/sellbookDetail.do"><img class="hotnewimgsize" src="${path}/resources/img/main/bestseller/bestseller12.png" alt=""></a>
                        <input type="hidden" name="" value="">
                    </div>
                    <div class="hotnewcg">[음식/생활]</div>
                    <div>
                        <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">식욕은 어디서 시작되는가?</p></a></div>
                    </div>
                    <div class="hotnewinner hotnewjccenter">
                        <div>
                            <a href="${path}/sellbookController/sellbookDetail.do"><img class="hotnewimgsize" src="${path}/resources/img/main/dummybooks/dummy1.jpg" alt=""></a>
                            <input type="hidden" name="" value="">
                        </div>
                        <div class="hotnewcg">[음식/생활]</div>
                        <div>
                            <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">식욕은 어디서 시작되는가?</p></a></div>
                        </div>
                        <div class="hotnewinner hotnewjccenter">
                            <div>
                                <a href="${path}/sellbookController/sellbookDetail.do"><img class="hotnewimgsize" src="${path}/resources/img/main/bestseller/bestseller12.png" alt=""></a>
                                <input type="hidden" name="" value="">
                            </div>
                            <div class="hotnewcg">[음식/생활]</div>
                            <div>
                                <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">식욕은 어디서 시작되는가?</p></a></div>
                            </div>
                            <div class="hotnewinner hotnewjccenter">
                                <div>
                                    <a href="${path}/sellbookController/sellbookDetail.do"><img class="hotnewimgsize" src="${path}/resources/img/main/bestseller/bestseller12.png" alt=""></a>
                                    <input type="hidden" name="" value="">
                                </div>
                                <div class="hotnewcg">[음식/생활]</div>
                                <div>
                                    <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">식욕은 어디서 시작되는가?</p></a></div>
                                </div>
                </li>


                <li class="hotNewslide_content hotnewbox">
                    <div class="hotnewinner hotnewjccenter">
                        <div>
                            <a href="${path}/sellbookController/sellbookDetail.do"><img class="hotnewimgsize" src="${path}/resources/img/main/bestseller/bestseller12.png" alt=""></a>
                            <input type="hidden" name="" value="">
                        </div>
                        <div class="hotnewcg">[음식/생활]</div>
                        <div>
                            <a href="#"><p class="hotnewtitle">식욕은 어디서 시작되는가?</p></a></div>
                        </div>   
                        

           <div class="hotnewinner hotnewjccenter">
                <div>
                    <a href="${path}/sellbookController/sellbookDetail.do"><img class="hotnewimgsize" src="${path}/resources/img/main/bestseller/bestseller12.png" alt=""></a>
                    <input type="hidden" name="" value="">
                </div>
                <div class="hotnewcg">[음식/생활]</div>
                <div>
                    <a href="#"><p class="hotnewtitle">식욕은 어디서 시작되는가?</p></a></div>
                </div>   




                <div class="hotnewinner hotnewjccenter">
                    <div>
                        <a href="${path}/sellbookController/sellbookDetail.do"><img class="hotnewimgsize" src="${path}/resources/img/main/dummybooks/dummy1.jpg" alt=""></a>
                        <input type="hidden" name="" value="">
                    </div>
                    <div class="hotnewcg">[음식/생활]</div>
                    <div>
                        <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">식욕은 어디서 시작되는가?</p></a></div>
                    </div>
                    <div class="hotnewinner hotnewjccenter">
                        <div>
                            <a href="${path}/sellbookController/sellbookDetail.do"><img class="hotnewimgsize" src="${path}/resources/img/main/dummybooks/dummy1.jpg" alt=""></a>
                            <input type="hidden" name="" value="">
                        </div>
                        <div class="hotnewcg">[음식/생활]</div>
                        <div>
                            <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">식욕은 어디서 시작되는가?</p></a></div>
                        </div>
              

                    
                

            </ul>
            <div class="hotNewslide_btn_next btnNewrightposition"></div>
        </div>
            <div class="hotNewslide_pagination flex" style="height: 50px;  justify-content: center;" >
            </div>
            
            
        </div>




        <!-- <div class="flex" style="width: 1000px;">
            <div class="hotnewObj">제품1</div>
            <div class="hotnewObj">제품2</div>
            <div class="hotnewObj">제품3</div>
            <div class="hotnewObj">제품4</div>
        </div> -->
    </div>


<!-- ////////////////////////라이징스타/////////////////////// -->

    <div class="widebg partition">
        <div class="flex">
            <div class="risingStar1">
                <p class="hotfont">&nbsp;&nbsp;&nbsp;라이징스타★</p>
                <p class="hotfontinner">지금 뜨는 HOT템</p>                
            </div>
            <div class="hotsearchBox-slideBox boxset">
                <div class="hotslide_btn_prev btnleftposition"></div>
                <div class="hotslide_list hotListflex" style="margin-top: 30px;">
                    <div class="hotslide_content">
                        <img alt="banner1" src="${path}/resources/img/main/risingstar/risingstar.png">
                    </div>
                    <div class="hotslide_content">
                        <img alt="banner2" src="${path}/resources/img/main/risingstar/risingstar2.png">
                    </div>
                </div>
                <div class="hotslide_pagination flex" style="height: 50px;  justify-content: center;" >
                </div>
                
                <div class="hotslide_btn_next btnrightposition"></div>
            </div>
        </div>
    </div> 


<!-- 문곰이그림////////////////////////////////////////////////////////// -->


<div class="wrap"><img src="${path }/resources/img/main/banner/insertpic.png"></div>



<!-- ////////////////////////베스트셀러/////////////////////// -->

    <div class="bestSeller_chart partition">
        <div class="flex alignitems">
            <div class="footerheadlinebs flex" >
                <p style="font-weight: bold;">인기가 가장 많은 아이템</p>
                <a href="#"><img src="${path}/resources/img/main/icon/plusicon.png" ></a>
            </div>
        </div>
        <div class="flex">
            <div class="bestSeller_main ">
                <ul class="bestsellerlist" style="margin-top: 5px;">
                    <li class="best1">
                        <div class="icon iconred">
                            <strong class="rankwhite">01</strong>
                        </div>
                        <div class="cover ">
                            <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller1" src="${path}/resources/img/main/bestseller/bestseller12.png" class="bestseller12"></a>
                        </div>
                        <div class="title ">
                            <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                    <li class="best2">
                        <div class="icon">
                            <strong class="rank">02</strong>
                        </div>
                        <div class="cover">
                            <div class="cover">
                                <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller310"></a>
                        </div>
                        <div class="title ">
                            <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                    <li class="best3">
                        <div class="icon">
                            <strong class="rank">03</strong>
                        </div>
                        <div class="cover">
                            <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller3" src="${path}/resources/img/main/bestseller/bestseller310.png" class="bestseller310"></a>
                        </div>
                        <div class="title ">
                            <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                    <li class="best4">
                        <div class="icon">
                            <strong class="rank">04</strong>
                        </div>
                        <div class="cover">
                            <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller4" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller310"></a>
                        </div>
                        <div class="title ">
                            <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                    <li class="best5">
                        <div class="icon">
                            <strong class="rank">05</strong>
                        </div>
                        <div class="cover">
                            <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller5" src="${path}/resources/img/main/bestseller/bestseller310.png" class="bestseller310"></a>
                        </div>
                        <div class="title ">
                            <a href="${path}/sellbookController/sellbookDetail.do"><p class="hotnewtitle">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                </ul>
               

                <ul class="bestsellerlist">
                    <li class="best1">
                        <div class="icon icongray">
                            <strong class="rankgray ">01</strong>
                        </div>
                        <div class="cover ">
                            <a href="#"><img alt="bestseller1" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller12"></a>
                        </div>
                        <div class="title ">
                            <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                    <li class="best2">
                        <div class="icon">
                            <strong class="rank">02</strong>
                        </div>
                        <div class="cover">
                            <a href="#"><img alt="bestseller2" src="${path}/resources/img/main/bestseller/bestseller310.png" class="bestseller310"></a>
                        </div>
                        <div class="title ">
                            <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                    <li class="best3">
                        <div class="icon">
                            <strong class="rank">03</strong>
                        </div>
                        <div class="cover">
                            <a href="#"><img alt="bestseller3" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller310"></a>
                        </div>
                        <div class="title ">
                            <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                    <li class="best4">
                        <div class="icon">
                            <strong class="rank">04</strong>
                        </div>
                        <div class="cover">
                            <a href="#"><img alt="bestseller4" src="${path}/resources/img/main/bestseller/bestseller310.png" class="bestseller310"></a>
                        </div>
                        <div class="title ">
                            <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                    <li class="best05">
                        <div class="icon">
                            <strong class="rank">05</strong>
                        </div>
                        <div class="cover">
                            <a href="#"><img alt="bestseller05" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller310"></a>
                        </div>
                        <div class="title ">
                            <a href="#"><p class="hotnewtitle ">먹어야 산다</p></a>
                        </div>
                        <div class="author">박원재</div>
                    </li>
                </ul>
            </div>
            <div class="bestSeller_right">
                <div class="flex sectionfirst">
                    <p class="trigger1 mouseoverbtn mouseoverbtnbg bottomline">
                    문곰이추천
                    </p>
                    <p class="trigger2 mouseoverbtn mouseoverbtnbg bottomline">인기eBook</p>
                </div>
                <div class="basicform booktubercontainer" style="background-image: url('${path}/resources/img/main/icon/gomchu.png'); margin-top: 72px;">


                    <div class="booktubercontainer textalign margintop50">
                        <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller12"></a>
                    </div>
                    <div class="title "><p class="margintop20 ">[북튜버의 책방]</p></div>
                    <div class="comment">
                        <a href="#"><p class="margintop10">[로그노트] 어지러운 집 정리하는 꿀팁</p></a>
                    </div>
                    <ul>
                        <li>
                            <div class="booktubercontainer textalign margintop50 ">
                                <img alt="booktuber" src="${path}/resources/img/main/bestseller/bestseller310.png" class="bestseller310" style="opacity: 0;"></a>
                            </div>
                            <div class="title">
                                <a href="#"><p class="margintop20" style="opacity: 0;">책의 제목자리</p></a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="hiddenform booktubercontainer hidden">
                    <div class="booktubercontainer textalign margintop50">
                        <a href="#"><img alt="bestseller2" src="${path}/resources/img/main/bestseller/bestseller12.png" class="bestseller12"></a>
                    </div>
                    <div class="title"><p class="margintop20">[유튜버의 책방]</p></div>
                    <div class="comment">
                        <a href="#"><p class="margintop10">[로그노트] 어지러운 집 정리하는 꿀팁</p></a>
                    </div>
                    <ul>
                        <li>
                            <div class="booktubercontainer textalign margintop50">
                                <img alt="booktuber" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller310"></a>
                            </div>
                            <div class="title">
                                <a href="#"><p class="margintop20">책의 제목자리</p></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            </div>
        </div>
    </div>

    <!-- ////////////////////////이주의 책/////////////////////// -->

<!-- <div class="wrap2">
        <div class="weekBookBg partition">
            <div class="flex ">
                <div class="footerheadline">
                    <p style="font-weight: bold;">이주의 책</p></div>
                    <a href="#"><button class="plus">ad</button></a>
            </div>
            <div class="flex">
            <ul class="flex" style="width: 640px; height: 270px;">
                <li class="best2">
                    <div class="cover weekbookcontent">
                        <a href="#"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller12"></a>
                    </div>
                    <div class="title " > 
                        <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                    </div>
                    <div class="author">박원재</div>
                </li>

                <li class="best2">
                    <div class="cover weekbookcontent">
                        <a href="#"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller12"></a>
                    </div>
                    <div class="title " > 
                        <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                    </div>
                    <div class="author">박원재</div>
                </li>

                <li class="best2">
                    <div class="cover weekbookcontent">
                        <a href="#"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller12"></a>
                    </div>
                    <div class="title " > 
                        <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                    </div>
                    <div class="author">박원재</div>
                </li>

                <li class="best2">
                    <div class="cover weekbookcontent">
                        <a href="#"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller12"></a>
                    </div>
                    <div class="title " > 
                        <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                    </div>
                    <div class="author">박원재</div>
                </li>
            </ul>
            
            
                <div class="weekBookAdd">
                    <a href="#">
                        <img alt="weekadd1" src="${path}/resources/img/main/week/weekadd.png">
                    </a>
                </div>
            </div>
            </div>
            </div>
        </div>
</div> -->

<!-- ////////////////////////KHLover평점좋은책/////////////////////// -->

<div class="wrap">
        <div class="khloverBg partition">
            <div class="flex alignitems">
                <div class="footerheadline">
                    <p style="font-weight: bold;">KHLover평점좋은책</p>
                    </div>
                    <a href="#"><img src="${path}/resources/img/main/icon/plusicon.png"></a>
            </div>
            <div class="flex">
                <div class="content">
                    <div class="khloverList flex">
                        <div class="khloverinner1">
                            <p>오늘의 발견</p>
                            <ul>
                                <li>
                                    <div class="cover weekbookcontent khloverbg1">
                                        <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1"></a>
                                        <div class=" " > 
                                            <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                                        </div>
                                        <div class="author">박원재</div>
                                        <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                        <p class="khloverscore">3.2</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="flex khloverbg2 outline">
                            <ul class="flex khloverul">
                                <li>
                                    <div class="cover khloverright ">
                                        <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1"></a>
                                        
                                        <div class="title " > 
                                            <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                                            <div class="author">박원재</div>
                                            <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                                <p class="khloverscore">9.2</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="cover khloverright ">
                                        <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1"></a>
                                        
                                        <div class="title " > 
                                            <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                                            <div class="author">박원재</div>
                                            <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                                <p class="khloverscore">9.5</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="cover khloverright ">
                                        <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1"></a>
                                        
                                        <div class="title " > 
                                            <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                                            <div class="author">박원재</div>
                                            <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                                <p class="khloverscore">8.9</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="cover khloverright">
                                        <a href="${path}/sellbookController/sellbookDetail.do"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1"></a>
                                        <div class="title " > 
                                            <a href="#"><p class="hotnewtitle">먹어야 산다</p></a>
                                            <div class="author">박원재</div>
                                            <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                            <p class="khloverscore">9.9</p>
                                        </div>
                                    </div>
                                </li>
                                
                            </ul>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>   

<!-- ////////////////////////하단푸터/////////////////////// -->

    <div class="wrap">
        <hr class="boldline partition">
        <div class="upFooterBg" style="background-image: url('${path}/resources/img/main/icon/opebear.png');">
            <div class="footernoticebox flex">
                <div class="flex" style="margin-right: 20px; margin-left: 20px;">
                        <p class="borderright footerp">공지사항</p>
                        <div class="footernoticebox-slideContent flex footerbox">
                        
                            <ul class="footerslide-List" style="margin-left: 20px;">
                                    <li class="footerslide-content">
                                        <a href="#">문곰책방 오픈 기념 할인 행사 이벤트!</a></li>
                                    <li class="footerslide-content">
                                        <a href="#">매장에 숨어있는 문곰이를 찾으세요</a></li>  
                                    <li class="footerslide-content">
                                        <a href="#">푸짐한 상품이 기다리고 있습니다</a></li>
                            </ul>
                        </div>   
                <div class="footerslide-pagination""></div>
                <div>
                    <button class="footerslide-button-prev footerbtn"></button>
                    <button class="footerslide-button-next footerbtn"></button>
                </div>    
            </div>
                <div class="flex">
                    <p class="borderright footerp" style="text-align: center;">당첨</p>
                        <div class="footernoticebox-slideContent flex footerbox">
                        
                            <ul class="footerslide2-List" style="margin-left: 20px;">
                                    <li class="footerslide2-content">
                                        <a href="#">[인문영역 문곰이] 유지훈 고객님 당첨!</a></li>
                                    <li class="footerslide2-content">
                                        <a href="#">[요리영역 문곰이] 박원재 고객님 당첨!</a></li>  
                                    <li class="footerslide2-content">
                                        <a href="#">[경매영역 문곰이] 윤양협 고객님 당첨!</a></li>
                            </ul>
                        </div>   
                <div class="footerslide2-pagination"></div>
                <div>
                    <button class="footerslide2-button-prev footerbtn"></button>
                    <button class="footerslide2-button-next footerbtn"></button>
                </div>
            </div>

        </div>
        <hr class="line">
        <div>
            <div class="flex footerul" style="margin-top: 20px;">
                <div class="upFooter_downSide verticalline">
                    <h2><a href="#" class="middlefont">회원혜택</a></h2>
                    <ul class="footerul">
                        <li class="strong"><a href="#" class="ataggray">Prestige Lounge</a></li>
                        <li><a href="#" class="ataggray">신규회원 혜택</a></li>
                        <li><a href="#" class="ataggray">등급별 혜택</a></li>
                        <li><a href="#" class="ataggray">문곰책방 혜택</a></li>
                    </ul>
                    
                </div>
                <div class="upFooter_downSide verticalline">
                    <h2><a href="#" class="middlefont">쇼핑 꿀팁</a></h2>
                    <ul class="footerul">
                        <li><a href="#" class="ataggray">포인트/상품권</a></li>
                        <li><a href="#" class="ataggray"><strong>공동구매</strong></a></li>
                        <li><a href="#" class="ataggray"><strong>대량구매</strong></a></li>
                        <li><a href="#" class="ataggray">출판사전화번호안내</a></li>
                </div>
                <div class="upFooter_downSide verticalline">
                    <h2><a href="#" class="middlefont">간편 서비스</a></h2>
                    <ul class="footerul">
                        <li><a href="#" class="ataggray">맴버십카드 등록</a></li>
                        <li><a href="#" class="ataggray">KH캐시 조회·충전</a></li>
                        <li><a href="#" class="ataggray">휴면고객 조회·복원</a></li>
                    </ul>
                </div>
                <div class="upFooter_downSide verticalline" >
                    <h2><a href="#" class="middlefont">문고 알리미</a></h2>
                    <ul class="footerul">
                        <li><a href="#" class="ataggray">KH페이스북</a></li>
                        <li><a href="#" class="ataggray">KH트위터</a></li>
                        <li><a href="#" class="ataggray">KH인스타그램</a></li>
                        <li><a href="#" class="ataggray">KH유튜브</a></li>
                    </ul>
                </div>
                <div class="upFooter_downSide ">
                    <h2><a href="#" class="middlefont">FAQ</a></h2>
                    <ul class="footerul">
                        <li><a href="#" class="ataggray">주문·결제</a></li>
                        <li><a href="#" class="ataggray">eBook</a></li>
                        <li><a href="#" class="ataggray">도서·상품정보</a></li>
                        <li><a href="#" class="ataggray">중고장터</a></li>
                    </ul>
                </div>
            </div>
            <div class="flex" style="margin-top: 15px;opacity: 0;">
                <a href="#"><div class="btnFooter" ><p class="btnfootertext">모바일교보문고&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;＞</p></div></a>
                <a href="#"><div class="btnFooter"><p class="btnfootertext">바로 찾는 바로드림&nbsp;&nbsp;&nbsp;&nbsp;＞</p></div></a>
                <a href="#"><div class="btnFooter"><p class="btnfootertext">중고장터 스마트비교&nbsp;&nbsp;＞</p></div></a>
                <a href="#"><div class="btnFooter"><p class="btnfootertext">교보문고 기프트카드&nbsp;&nbsp;＞</p></div></a>
                <a href="#"><div class="btnFooter"><p class="btnfootertext">매장 안내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;＞</p></div></a>
            </div>
        </div>
    


    </div>
</div>

<!-- ------------------------------------------------------------------- -->



<script>
    let maintrigger1=document.querySelector('.maintrigger1');
    let mainbanner1=document.querySelector('.mainbanner1');

    let maintrigger2=document.querySelector('.maintrigger2');
    let mainbanner2=document.querySelector('.mainbanner2');
    
    let maintrigger3=document.querySelector('.maintrigger3');
    let mainbanner3=document.querySelector('.mainbanner3');

    let maintrigger4=document.querySelector('.maintrigger4');
    let mainbanner4=document.querySelector('.mainbanner4');

    let maintrigger5=document.querySelector('.maintrigger5');
    let mainbanner5=document.querySelector('.mainbanner5');

    let maintrigger6=document.querySelector('.maintrigger6');
    let mainbanner6=document.querySelector('.mainbanner6');

    let maintrigger7=document.querySelector('.maintrigger7');
    let mainbanner7=document.querySelector('.mainbanner7');

    let mouseoverbtn=document.querySelector('.mouseoverbtn');


    maintrigger1.addEventListener('mouseover', function(){
        maintrigger1.style.backgroundColor="#582810";
        maintrigger1.style.color="#ffffff";
        mainbanner1.style.display="flex";
        mainbanner2.style.display="none";
        maintrigger2.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger2.style.color="black";
        maintrigger3.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger3.style.color="black";
        mainbanner3.style.display="none";
        maintrigger4.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger4.style.color="black";
        mainbanner4.style.display="none";
        maintrigger5.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger5.style.color="black";
        mainbanner5.style.display="none";
        maintrigger6.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger6.style.color="black";
        mainbanner6.style.display="none";
        maintrigger7.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger7.style.color="black";
        mainbanner7.style.display="none";

    });
    maintrigger2.addEventListener('mouseover', function(){
        maintrigger2.style.backgroundColor="#582810";
        maintrigger2.style.color="#ffffff";
        mainbanner2.style.display="flex";
        maintrigger1.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger1.style.color="black";
        mainbanner1.style.display="none";
        maintrigger3.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger3.style.color="black";
        mainbanner3.style.display="none";
        maintrigger4.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger4.style.color="black";
        mainbanner4.style.display="none";
        maintrigger5.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger5.style.color="black";
        mainbanner5.style.display="none";
        maintrigger6.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger6.style.color="black";
        mainbanner6.style.display="none";
        maintrigger7.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger7.style.color="black";
        mainbanner7.style.display="none";

    });

    maintrigger3.addEventListener('mouseover', function(){
        maintrigger3.style.backgroundColor="#582810";
        maintrigger3.style.color="#ffffff";
        mainbanner3.style.display="flex";
        maintrigger1.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger1.style.color="black";
        mainbanner1.style.display="none";
        maintrigger2.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger2.style.color="black";
        mainbanner2.style.display="none";
        maintrigger4.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger4.style.color="black";
        mainbanner4.style.display="none";
        maintrigger5.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger5.style.color="black";
        mainbanner5.style.display="none";
        maintrigger6.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger6.style.color="black";
        mainbanner6.style.display="none";
        maintrigger7.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger7.style.color="black";
        mainbanner7.style.display="none";
    });
    maintrigger4.addEventListener('mouseover', function(){
        maintrigger4.style.backgroundColor="#582810";
        maintrigger4.style.color="#ffffff";
        mainbanner4.style.display="flex";
        maintrigger1.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger1.style.color="black";
        mainbanner1.style.display="none";
        maintrigger3.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger3.style.color="black";
        mainbanner3.style.display="none";
        maintrigger2.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger2.style.color="black";
        mainbanner2.style.display="none";
        maintrigger5.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger5.style.color="black";
        mainbanner5.style.display="none";
        maintrigger6.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger6.style.color="black";
        mainbanner6.style.display="none";
        maintrigger7.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger7.style.color="black";
        mainbanner7.style.display="none";
    });
    maintrigger5.addEventListener('mouseover', function(){
        maintrigger5.style.backgroundColor="#582810";
        maintrigger5.style.color="#ffffff";
        mainbanner5.style.display="flex";
        maintrigger1.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger1.style.color="black";
        mainbanner1.style.display="none";
        maintrigger3.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger3.style.color="black";
        mainbanner3.style.display="none";
        maintrigger4.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger4.style.color="black";
        mainbanner4.style.display="none";
        maintrigger2.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger2.style.color="black";
        mainbanner2.style.display="none";
        maintrigger6.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger6.style.color="black";
        mainbanner6.style.display="none";
        maintrigger7.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger7.style.color="black";
        mainbanner7.style.display="none";
    });
    maintrigger6.addEventListener('mouseover', function(){
        maintrigger6.style.backgroundColor="#582810";
        maintrigger6.style.color="#ffffff";
        mainbanner6.style.display="flex";
        maintrigger1.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger1.style.color="black";
        mainbanner1.style.display="none";
        maintrigger3.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger3.style.color="black";
        mainbanner3.style.display="none";
        maintrigger4.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger4.style.color="black";
        mainbanner4.style.display="none";
        maintrigger2.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger2.style.color="black";
        mainbanner2.style.display="none";
        maintrigger5.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger5.style.color="black";
        mainbanner5.style.display="none";
        maintrigger7.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger7.style.color="black";
        mainbanner7.style.display="none";
    });
    maintrigger7.addEventListener('mouseover', function(){
        maintrigger7.style.backgroundColor="#582810";
        maintrigger7.style.color="#ffffff";
        mainbanner7.style.display="flex";
        maintrigger1.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger1.style.color="black";
        mainbanner1.style.display="none";
        maintrigger3.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger3.style.color="black";
        mainbanner3.style.display="none";
        maintrigger4.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger4.style.color="black";
        mainbanner4.style.display="none";
        maintrigger2.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger2.style.color="black";
        mainbanner2.style.display="none";
        maintrigger6.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger6.style.color="black";
        mainbanner6.style.display="none";
        maintrigger5.style.backgroundColor="rgb(231, 231, 231)";
        maintrigger5.style.color="black";
        mainbanner5.style.display="none";
    });


</script>




<script>
    let  inneradd1=document.querySelector('. inneradd1');
    let  inneradd2=document.querySelector('. inneradd2');
    let  inneradd3=document.querySelector('. inneradd3');

    

</script>

<script>
    let todaybtn1=document.querySelector('.todaybtn1');
    let todaybtn2=document.querySelector('.todaybtn2');
    let todaybtn3=document.querySelector('.todaybtn3');

    let todaydiv1=document.querySelector('.todaydiv1');
    let todaydiv2=document.querySelector('.todaydiv2');
    let todaydiv3=document.querySelector('.todaydiv3');

   


    todaybtn1.addEventListener('mouseover', function(){
        todaydiv1.style.display="flex";
        todaydiv2.style.display="none";
        todaydiv3.style.display="none";
        todaybtn1.style.backgroundColor="#582810";
        todaybtn2.style.backgroundColor="white";
        todaybtn3.style.backgroundColor="white";
        todaybtn1.style.color="white";
        todaybtn2.style.color="black";
        todaybtn3.style.color="black";
        
        
    });
    todaybtn2.addEventListener('mouseover', function(){
        todaydiv2.style.display="flex";
        todaydiv1.style.display="none";
        todaydiv3.style.display="none";
        todaybtn2.style.backgroundColor="#582810";
        todaybtn1.style.backgroundColor="white";
        todaybtn3.style.backgroundColor="white";
        todaybtn2.style.color="white";
        todaybtn1.style.color="black";
        todaybtn3.style.color="black";
    });
    todaybtn3.addEventListener('mouseover', function(){
        todaydiv3.style.display="flex";
        todaydiv2.style.display="none";
        todaydiv1.style.display="none";
        todaybtn3.style.backgroundColor="#582810";
        todaybtn2.style.backgroundColor="white";
        todaybtn1.style.backgroundColor="white";
        todaybtn3.style.color="white";
        todaybtn2.style.color="black";
        todaybtn1.style.color="black";
    });
</script>


<script>
    let trigger1=document.querySelector('.trigger1');
    let basicform=document.querySelector('.basicform');

    let trigger2=document.querySelector('.trigger2');
    let hiddenform=document.querySelector('.hiddenform');
    
    let mouseoverbtn=document.querySelector('.mouseoverbtn');


    trigger1.addEventListener('mouseover', function(){
        trigger1.style.backgroundColor="#582810";
        trigger2.style.backgroundColor="rgb(231, 231, 231)";
        trigger1.style.color="#ffffff";
        trigger2.style.color="black";
        basicform.style.display="block";
        hiddenform.style.display="none";
    });
    trigger2.addEventListener('mouseover', function(){
        trigger2.style.backgroundColor="#582810";
        trigger1.style.backgroundColor="rgb(231, 231, 231)";
        trigger2.style.color="#ffffff";
        trigger1.style.color="black";
        basicform.style.display="none";
        hiddenform.style.display="block";

    });


</script>





</body>





    <!-- <script src="${path}/resources/js/header.js"></script>
	<script src="${path}/resources/js/header(2).js"></script> -->
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

  <script src="${path}/resources/js/mainsellpart/main.js"></script>
  <script src="${path}/resources/js/mainsellpart/mainHot.js"></script>  
  <script src="${path}/resources/js/mainsellpart/mainHotNew.js"></script>
  <script src="${path}/resources/js/mainsellpart/mainfooter1.js"></script> 
  <script src="${path}/resources/js/mainsellpart/mainfooter2.js"></script> 
  <script src="${path}/resources/js/mainsellpart/todaylev1.js"></script> 
  <script src="${path}/resources/js/mainsellpart/todaylev2.js"></script> 
  <script src="${path}/resources/js/mainsellpart/todaylev3.js"></script>
  <script src="${path}/resources/js/mainsellpart/todaylev4.js"></script> 
  <!--<script src="${path}/resources/js/todaylev5.js"></script> 
  <script src="${path}/resources/js/todaylev6.js"></script>  -->
	


<%-- <%-- 
    <div class="wrap">
    <div class="flex bannerwrap">
    <div class="mainbanner flex">
        <div class="mainbanner_obj1">
            <div class="mainbanner_objleft btndown">
            <img alt="banner1" src="${path }/resources/img/main/banner/banner.png">
            <div class="mainbanner_objcontainer flex ">
            </div>
        </div>
        <button class="mainbanner_objinner">버튼2</button>
        <button class="mainbanner_objinner">버튼3</button>
        <button class="mainbanner_objinner">버튼4</button>
        <button class="mainbanner_objinner">버튼5</button>
        <button class="mainbanner_objinner">버튼6</button>
        <button class="mainbanner_objinner">버튼7</button>
        </div>
        <div class="mainbanner_obj2">출판사 북캐스트</div>   
    </div>
    <div>
        <div class="mainbanner_add">북뉴스</div>
        <div class="mainbanner_add">광고</div>
    </div>
    </div>

    <div class="todaybooks">
        <div class="flex">
            <div class="todaybooks21">오늘의책</div>
            <div class="todaybooks22">더보기</div>
        </div>
        <div class="flex">
            <div class="container2">
                <div class="flex">
                    <div class="todaybooksadd1">광고1</div>
                    <div class="todaybooksadd2">광고2</div>
                </div>
            </div>
            <div class="container2">
                <div class="todaybooksadd3">광고3</div>
                <div class="todaybooksadd4">광고4</div>
            </div>
        </div>
    </div>
    <div class="hotnew todaybooks">
        <div class="flex">
            <div class="todaybooks21">화제의 신간</div>
            <div class="todaybooks22">더보기</div>
        </div>
        <div class="flex">
            <div class="hotnewObj">제품1</div>
            <div class="hotnewObj">제품2</div>
            <div class="hotnewObj">제품3</div>
            <div class="hotnewObj">제품4</div>
        </div>
    </div>
    <div class="risingStarBg">
        <div class="flex">
            <div class="risingStar1">지금뜨는HOT템</div>
            <div class="risingStar2">광고영역 </div>
        </div>
    </div>
    <div class="bestSeller_chart">
        <div class="flex">
            <div class="todaybooks21">베스트셀러</div>
            <div class="todaybooks22">더보기</div>
        </div>
        <div class="flex">
            <div class="bestSeller_main">
                <div class="flex">
                    <div class="bestSellerContainer">책들어갈곳</div>
                    <div class="bestSellerContainer">책들어갈곳</div>
                    <div class="bestSellerContainer">책들어갈곳</div>
                    <div class="bestSellerContainer">책들어갈곳</div>
                    <div class="bestSellerContainer">책들어갈곳</div>
                </div>
                <div class="flex">
                    <div class="bestSellerContainer">책들어갈곳</div>
                    <div class="bestSellerContainer">책들어갈곳</div>
                    <div class="bestSellerContainer">책들어갈곳</div>
                    <div class="bestSellerContainer">책들어갈곳</div>
                    <div class="bestSellerContainer">책들어갈곳</div>
                </div>
            </div>
            <div class="bestSeller_right">
                <div class="flex">
                    <div class="minibtn">북튜버책방</div>
                    <div class="minibtn">추천eBook</div>
                </div>
                <div class="bestSeller_innerRight ">추천책1</div>
                <div class="bestSeller_innerRight">추천책2</div>
            </div>
        </div>
        <div class="weekBookBg">
            <div class="weekBookBg">
            <div class="todaybooks21">이주의 책</div>
            <div class="weekBookContainer flex">
                <div class="weekBookObj">
                    <div class="weekBookInnerContainer">책들어갈곳</div>
                    책설명쓰기
                </div>
                <div class="weekBookObj">
                    <div class="weekBookInnerContainer">책들어갈곳</div>
                    책설명쓰기
                </div>
                <div class="weekBookObj">
                    <div class="weekBookInnerContainer">책들어갈곳</div>
                    책설명쓰기
                </div>
                <div class="weekBookObj">
                    <div class="weekBookInnerContainer">책들어갈곳</div>
                    책설명쓰기
                </div>               
                <div class="weekBookAdd">광고</div>
            </div>
            </div>
        </div>
        <div class="khloverBg">
            <div class="flex">
                <div class="todaybooks21">KHLover평점좋은책</div>
                <div class="todaybooks22">더보기</div>
            </div>
            <div class="flex">
                <div class="khlover_container1">
                    <div class="khlover_obj0">책그림0</div>
                    책설명
                </div>
                <div class="khlover_container2 flex">
                    <div class="khlover_right">
                        <div class="khlover_obj">책그림1</div>
                        책설명
                    </div>
                    <div class="khlover_right">
                        <div class="khlover_obj">책그림2</div>
                        책설명
                    </div>
                    <div class="khlover_right">
                        <div class="khlover_obj">책그림3</div>
                        책설명
                    </div>
                    <div class="khlover_right">
                        <div class="khlover_obj">책그림4</div>
                        책설명
                    </div>
                </div>
            </div>
        </div>
        
        <div class="upFooterBg">
            <div class="flex">
                <div class="upFooter_upSide">공지사항</div>
                <div class="upFooter_upSide">당첨</div>
            </div>
            <div class="flex">
                <div class="upFooter_downSide">회원혜택</div>
                <div class="upFooter_downSide">쇼핑TIP</div>
                <div class="upFooter_downSide">빠른서비스</div>
                <div class="upFooter_downSide">문곰책방소식</div>
                <div class="upFooter_downSide">FAQ</div>
            </div>
            <div class="flex">
                <div class="btnFooter">모바일교보문고</div>
                <div class="btnFooter">바로 찾는 바로드림</div>
                <div class="btnFooter">중고장터 스마트비교</div>
                <div class="btnFooter">교보문고 기프트카드</div>
                <div class="btnFooter">매장 안내</div>
            </div>
        </div>
    </div>
    </div>
    
    <script src="${path }/resources/js/header.js"></script>
	<script src="${path }/resources/js/header(2).js"></script> --%>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>