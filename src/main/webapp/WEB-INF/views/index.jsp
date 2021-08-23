<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>

<script>

window.onload = function() {
	
	searchHotnew({
		keyword: "",
		searchType: "title",
		categoryCode: "300050",
		pubdateOrder: "DESC",
		salesOrder: "DESC",
		priceOrder: "DESC",
		importancePubdate: "1",
		importanceSales: "2",
		importanceRating: "3",
		importancePrice: "4",
		dataVolume: 8
		
	});
	
	searchBestseller({
		keyword: "",
		searchType: "title",
		categoryCode: "310020020",
		pubdateOrder: "DESC",
		salesOrder: "DESC",
		priceOrder: "DESC",
		importancePubdate: "2",
		importanceSales: "1",
		importanceRating: "3",
		importancePrice: "4",
		dataVolume: 5
	});
	
	searchRating({
		keyword: "",
		searchType: "title",
		categoryCode: "100020020",
		pubdateOrder: "DESC",
		salesOrder: "DESC",
		priceOrder: "DESC",
		ratingOrder: "DESC",
		importancePubdate: "3",
		importanceSales: "2",
		importanceRating: "1",
		importancePrice: "4",
		dataVolume: 5
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
	
	/* 따끈따끈 Link */
	let hotnewLink0=$(".hotnewLink0");
	let hotnewLink1=$(".hotnewLink1");
	let hotnewLink2=$(".hotnewLink2");
	let hotnewLink3=$(".hotnewLink3");
	let hotnewLink4=$(".hotnewLink4");
	let hotnewLink5=$(".hotnewLink5");
	let hotnewLink6=$(".hotnewLink6");
	let hotnewLink7=$(".hotnewLink7");

	
	
	
	/* 따끈따끈신작 타이틀 */
	let hotnewtitle0=$(".hotnewtitle0");
	let hotnewtitle1=$(".hotnewtitle1");
	let hotnewtitle2=$(".hotnewtitle2");
	let hotnewtitle3=$(".hotnewtitle3");
	let hotnewtitle4=$(".hotnewtitle4");
	let hotnewtitle5=$(".hotnewtitle5");
	let hotnewtitle6=$(".hotnewtitle6");
	let hotnewtitle7=$(".hotnewtitle7");
	
	/* 따끈따끈신작 도서 작가 1-5 */
	let hotnewauthor0=$(".hotnewauthor0");
	let hotnewauthor1=$(".hotnewauthor1");
	let hotnewauthor2=$(".hotnewauthor2");
	let hotnewauthor3=$(".hotnewauthor3");
	let hotnewauthor4=$(".hotnewauthor4");
	let hotnewauthor5=$(".hotnewauthor5");
	let hotnewauthor6=$(".hotnewauthor6");
	let hotnewauthor7=$(".hotnewauthor7");
	
	let src = "${path}/sellpart/bookDetail.do?bindNo=";
	
	$.ajax({
		url: "${path}/ebook/search.do",
		type: "post",
		data: searchData,
		dataType: "json",
		success: data => {
			/* 따끈따끈 Link */
			$(hotnewLink0).attr('href',src+data[0].bindNo);
			$(hotnewLink1).attr('href',src+data[1].bindNo);
			$(hotnewLink2).attr('href',src+data[2].bindNo);
			$(hotnewLink3).attr('href',src+data[3].bindNo);
			$(hotnewLink4).attr('href',src+data[4].bindNo);
			$(hotnewLink5).attr('href',src+data[5].bindNo);
			$(hotnewLink6).attr('href',src+data[6].bindNo);
			$(hotnewLink7).attr('href',src+data[7].bindNo);
			
			
	
			/* 따끈따끈신작 이미지 */
			$(hotnewimg0).attr('src',data[0].image );
			$(hotnewimg1).attr('src',data[1].image );
			$(hotnewimg2).attr('src',data[2].image );
			$(hotnewimg3).attr('src',data[3].image );
			$(hotnewimg4).attr('src',data[4].image );
			$(hotnewimg5).attr('src',data[5].image );
			$(hotnewimg6).attr('src',data[6].image );
			$(hotnewimg7).attr('src',data[7].image );
			
			/* 따끈따끈신작 타이틀 */
			var hntitle0=(data[0].title).split('(');
			var hntitle1=(data[1].title).split('(');
			var hntitle2=(data[2].title).split('(');
			var hntitle3=(data[3].title).split('(');
			var hntitle4=(data[4].title).split('(');
			var hntitle5=(data[5].title).split('(');
			var hntitle6=(data[6].title).split('(');
			var hntitle7=(data[7].title).split('(');
			
			$(hotnewtitle0).html(hntitle0[0] );
			$(hotnewtitle1).html(hntitle1[0] );
			$(hotnewtitle2).html(hntitle2[0] );
			$(hotnewtitle3).html(hntitle3[0] );
			$(hotnewtitle4).html(hntitle4[0] );
			$(hotnewtitle5).html(hntitle5[0] );
			$(hotnewtitle6).html(hntitle6[0] );
			$(hotnewtitle7).html(hntitle7[0] );
			
			/* 따끈따끈신작 작가 */
			$(hotnewauthor0).html(data[0].author );
			$(hotnewauthor1).html(data[1].author );
			$(hotnewauthor2).html(data[2].author );
			$(hotnewauthor3).html(data[3].author );
			$(hotnewauthor4).html(data[4].author );
			$(hotnewauthor5).html(data[5].author );
			$(hotnewauthor6).html(data[6].author );
			$(hotnewauthor7).html(data[7].author );
		}
	});
	

}

  function searchBestseller(searchData) {
		let src = "${path}/sellpart/bookDetail.do?bindNo=";
	 /* 가장 인기있는 아이템 도서 이미지 1-5 */
	let bestsellerimg0=$(".bestsellerimg0");
	let bestsellerimg1=$(".bestsellerimg1");
	let bestsellerimg2=$(".bestsellerimg2");
	let bestsellerimg3=$(".bestsellerimg3");
	let bestsellerimg4=$(".bestsellerimg4");
	
	/* 인기가 많은 Link */
	let bsLink0=$(".bsLink0");
	let bsLink1=$(".bsLink1");
	let bsLink2=$(".bsLink2");
	let bsLink3=$(".bsLink3");
	let bsLink4=$(".bsLink4");
	let bsLink5=$(".bsLink5");
	
	
	 /* 가장 인기있는 아이템 도서 타이틀 1-5 */
	let bestsellertitle0=$(".bestsellertitle0");
	let bestsellertitle1=$(".bestsellertitle1");
	let bestsellertitle2=$(".bestsellertitle2");
	let bestsellertitle3=$(".bestsellertitle3");
	let bestsellertitle4=$(".bestsellertitle4");
	 
	 /* 가장 인기있는 아이템 도서 작가 1-5 */
	let bestsellerauthor0=$(".bestsellerauthor0");
	let bestsellerauthor1=$(".bestsellerauthor1");
	let bestsellerauthor2=$(".bestsellerauthor2");
	let bestsellerauthor3=$(".bestsellerauthor3");
	let bestsellerauthor4=$(".bestsellerauthor4");
	 
	 
	 
	$.ajax({
		url:"${path}/ebook/search.do",
		type: "post",
		data: searchData,
		dataType: "json",
		success: data=>{
			/* 베스트셀러 이미지 */
			$(bestsellerimg0).attr('src',data[0].image );
			$(bestsellerimg1).attr('src',data[1].image );
			$(bestsellerimg2).attr('src',data[2].image );
			$(bestsellerimg3).attr('src',data[3].image );
			$(bestsellerimg4).attr('src',data[4].image );
			
			/* 인기있는 Link */
			$(bsLink0).attr('href',src+data[0].bindNo);
			 $(bsLink1).attr('href',src+data[1].bindNo);
			 $(bsLink2).attr('href',src+data[2].bindNo);
			 $(bsLink3).attr('href',src+data[3].bindNo);
			 $(bsLink4).attr('href',src+data[4].bindNo);
			/*  $(bsLink5).attr('href',src+data[5].bindNo); */
			
			/* 베스트셀러 타이틀 ( 괄호 앞 잘라내기 */
			
			var bstitle0=(data[0].title).split('(');
			var bstitle1=(data[1].title).split('(');
			var bstitle2=(data[2].title).split('(');
			var bstitle3=(data[3].title).split('(');
			var bstitle4=(data[4].title).split('(');
			
			$(bestsellertitle0).html(bstitle0[0] );
			$(bestsellertitle1).html(bstitle1[0] );
			$(bestsellertitle2).html(bstitle2[0] );
			$(bestsellertitle3).html(bstitle3[0] );
			$(bestsellertitle4).html(bstitle4[0] );

			/* 베스트셀러 작가 */
			$(bestsellerauthor0).html(data[0].author );
			$(bestsellerauthor1).html(data[1].author );
			$(bestsellerauthor2).html(data[2].author );
			$(bestsellerauthor3).html(data[3].author );
			$(bestsellerauthor4).html(data[4].author );
			
		
		}
	})
}   
  function searchRating(searchData) {
	let src = "${path}/sellpart/bookDetail.do?bindNo=";
	 /* 가장 평점 높은 도서 이미지 1-5 */
	let bestratingimg0=$(".bestratingimg0");
	let bestratingimg1=$(".bestratingimg1");
	let bestratingimg2=$(".bestratingimg2");
	let bestratingimg3=$(".bestratingimg3");
	let bestratingimg4=$(".bestratingimg4");
	
	/* 평점 좋은 Link */
	let ratingLink0=$(".ratingLink0");
	let ratingLink1=$(".ratingLink1");
	let ratingLink2=$(".ratingLink2");
	let ratingLink3=$(".ratingLink3");
	let ratingLink4=$(".ratingLink4"); 

	/* 평점 입력 */
	let khloverscore0=$(".khloverscore0"); 
	let khloverscore1=$(".khloverscore1"); 
	let khloverscore2=$(".khloverscore2"); 
	let khloverscore3=$(".khloverscore3"); 
	let khloverscore4=$(".khloverscore4"); 
	
	 /* 가장 평점 높은 도서 타이틀 1-5 */
	let bestratingtitle0=$(".bestratingtitle0");
	let bestratingtitle1=$(".bestratingtitle1");
	let bestratingtitle2=$(".bestratingtitle2");
	let bestratingtitle3=$(".bestratingtitle3");
	let bestratingtitle4=$(".bestratingtitle4");

	 /* 가장 평점 높은 도서 작가 1-5 */
	let bestratingauthor0=$(".bestratingauthor0");
	let bestratingauthor1=$(".bestratingauthor1");
	let bestratingauthor2=$(".bestratingauthor2");
	let bestratingauthor3=$(".bestratingauthor3");
	let bestratingauthor4=$(".bestratingauthor4");
	
	
	$.ajax({
		url:"${path}/ebook/search.do",
		type: "post",
		data: searchData,
		dataType: "json",
		success: data=>{
			/* 평점 좋은 이미지 */
			$(bestratingimg0).attr('src',data[0].image );
			$(bestratingimg1).attr('src',data[1].image );
			$(bestratingimg2).attr('src',data[2].image );
			$(bestratingimg3).attr('src',data[3].image );
			$(bestratingimg4).attr('src',data[4].image );
			
			/* 평접 입력 */
			/* $(khloverscore0).html(data[0].rating);
			$(khloverscore1).html(data[1].rating);
			$(khloverscore2).html(data[2].rating);
			$(khloverscore3).html(data[3].rating);
			$(khloverscore4).html(data[4].rating); */
			
			/* 평점 좋은 Link */
			$(ratingLink0).attr('href',src+data[0].bindNo);
			$(ratingLink1).attr('href',src+data[1].bindNo);
			$(ratingLink2).attr('href',src+data[2].bindNo);
			$(ratingLink3).attr('href',src+data[3].bindNo);
			$(ratingLink4).attr('href',src+data[4].bindNo);
			
			
			/* 평점 좋은 타이틀 ( 괄호 앞 잘라내기 */
			
			var brtitle0=(data[0].title).split('(');
			var brtitle1=(data[1].title).split('(');
			var brtitle2=(data[2].title).split('(');
			var brtitle3=(data[3].title).split('(');
			var brtitle4=(data[4].title).split('(');
			
			$(bestratingtitle0).html(brtitle0[0] );
			$(bestratingtitle1).html(brtitle1[0] );
			$(bestratingtitle2).html(brtitle2[0] );
			$(bestratingtitle3).html(brtitle3[0] );
			$(bestratingtitle4).html(brtitle4[0] );

			/* 평점 좋은 작가 */
			$(bestratingauthor0).html(data[0].author );
			$(bestratingauthor1).html(data[1].author );
			$(bestratingauthor2).html(data[2].author );
			$(bestratingauthor3).html(data[3].author );
			$(bestratingauthor4).html(data[4].author );

			var bindNo0=data[0].bindNo;
			var bindNo1=data[1].bindNo;
			var bindNo2=data[2].bindNo;
			var bindNo3=data[3].bindNo;
			var bindNo4=data[4].bindNo;
			
			
			$.ajax({
				url:"/service/searchAvgRating.do",
				data:{
					bindNo0:bindNo0,
					bindNo1:bindNo1,
					bindNo2:bindNo2,
					bindNo3:bindNo3,
					bindNo4:bindNo4,
				success: data=>{
					$(khloverscore0).html(data[0].bookScore);
					$(khloverscore1).html(data[1].bookScore);
					$(khloverscore2).html(data[2].bookScore);
					$(khloverscore3).html(data[3].bookScore);
					$(khloverscore4).html(data[4].bookScore);
				}
				
				}
				
			})
		}
	})
}   

</script>


<style>

@import url(${path}/resources/css/style.css);
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
    border-bottom: rgba(88,40,16,0.2) 2px solid;
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
	display:none;
    
}
.mainsearchBox-slideBtn-prev{
    height: 30px;
	display:none;
  
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
    justify-content: space-evenly;
}
li[class^="best"]{
    /* padding-left: 60px; */
}
li{
display:block;
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
  .flex5{
 display:flex; 
  }
  
  
  .trigger1{
   background-color:white;
   color:rgba(88,40,16,1);
  }
  .trigger1:hover{
   background-color:rgba(88,40,16,1);
   color:white;
  }
  .trigger2{
   background-color:white;
   color:rgba(88,40,16,1);
  }
  .trigger2:hover{
   background-color:rgba(88,40,16,1);
   color:white;
  }
  
</style>
<link rel="stylesheet" href="${path }/resources/css/index/stickymenu.css">
<!-- ////////////////////////상위배너/////////////////////// -->
<div class="wrap">

<jsp:include page="/WEB-INF/views/sellpart/stickymenu/stickymenu.jsp">
<jsp:param name="" value=""/>
</jsp:include>

<div class="bannerBg">
<div class="flex bannerwrap">
<div class="">
<!-- <div class="mainbtn flex"> -->
<button class="mainsearchBox-slideBtn-next">이전</button>

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
                <a href="#"><img alt="banner3" src="${path}/resources/img/main/banner/moongom.png"></a>
            </div>
            <%-- <div class="mainsearchBox-slideContent mainbanner4">
                <a href="#"><img alt="banner4" src="${path}/resources/img/main/banner/1300add3.png"></a>
            </div> --%>
            <div class="mainsearchBox-slideContent mainbanner5">
                <a href="#"><img alt="banner5" src="${path}/resources/img/main/banner/1300add4.png"></a>
            </div>
            <%-- <div class="mainsearchBox-slideContent mainbanner6">
                <a href="#"><img alt="banner6" src="${path}/resources/img/main/banner/1300400.png"></a>
            </div>
            <div class="mainsearchBox-slideContent mainbanner7">
                <a href="#"><img alt="banner7" src="${path}/resources/img/main/banner/1300add3.png"></a>
            </div> --%>
        </div>
        
        <ul class="mainslide-pagination" style="width: 20px; height: 10px; display: none;">
        </ul>
    </div>
</div>
<button class="mainsearchBox-slideBtn-prev">다음</button>
</div>
</div>
    </div>
    


<!-- ////////////////////////따끈따끈 신작/////////////////////// -->

<audio autoplay  id="octo"> 
<source src="${path }/resources/audio/main/OctopusDream.mp3" type="audio/mp3"> 
</audio>

    <div class="hotnew todaybooks partition">
        <div class="flex alignitems">
            <div class="footerheadline">
                <p style="font-weight: bold;">따끈따끈 신작</p></div>
                <a href="#"><img  src="${path}/resources/img/main/icon/plusicon.png"></a>
        </div>
        <div class="hotNewsearchBox-slideBox boxsetNew">
            <div class="hotNewslide_btn_prev btnNewleftposition"></div>
            <ul class="hotNewslide_list hotListflex " style="margin-top: 30px; justify-content: space-around;">

                <li class="hotNewslide_content hotnewbox">
                    
                    
                    
                    <div class="hotnewinner hotnewjccenter">
                    <div>
                   
                        <a href="#" class="hotnewLink0"><img class="hotnewimg0 hotnewimgsize" src="#" alt=""></a>
                        <input type="hidden" name="" value="">
                    </div>
                    <div class="hotnewcg">[음식/생활]</div>
                    <div>
                        <a href="#" class="hotnewLink0"><p class="hotnewtitle hotnewtitle0"></p></a></div>
                    <div class="author hotnewauthor0">박원재</div>
                    </div>
                  
                    <div class="hotnewinner hotnewjccenter">
                        <div>
                            <a href="#" class="hotnewLink1"><img class="hotnewimg1 hotnewimgsize" src="#" alt=""></a>
                            <input type="hidden" name="" value="">
                        </div>
                        <div class="hotnewcg">[음식/생활]</div>
                        <div>
                            <a href="#" class="hotnewLink1"><p class="hotnewtitle hotnewtitle1"></p></a></div>
                            <div class="author hotnewauthor1">박원재</div>
                        </div>
                        <div class="hotnewinner hotnewjccenter">
                            <div>
                                <a href="#" class="hotnewLink2"><img class="hotnewimgsize hotnewimg2" src="#" alt=""></a>
                                <input type="hidden" name="" value="">
                            </div>
                            <div class="hotnewcg">[음식/생활]</div>
                            <div>
                                <a href="#" class="hotnewLink2"><p class="hotnewtitle hotnewtitle2"></p></a></div>
                                <div class="author hotnewauthor2">박원재</div>
                            </div>
                            <div class="hotnewinner hotnewjccenter">
                                <div>
                                    <a href="#" class="hotnewLink3"><img class="hotnewimgsize hotnewimg3" src="#" alt=""></a>
                                    <input type="hidden" name="" value="">
                                </div>
                                <div class="hotnewcg">[음식/생활]</div>
                                <div>
                                    <a href="#" class="hotnewLink3"><p class="hotnewtitle hotnewtitle3"></p></a></div>
                                    <div class="author hotnewauthor3">박원재</div>
                                </div>
                </li>

                <li class="hotNewslide_content hotnewbox">
                    <div class="hotnewinner hotnewjccenter">
                        <div>
                            <a href="#" class="hotnewLink4"><img class="hotnewimgsize hotnewimg4" src="#" alt=""></a>
                            <input type="hidden" name="" value="">
                        </div>
                        <div class="hotnewcg">[음식/생활]</div>
                        <div>
                            <a href="#" class="hotnewLink4"><p class="hotnewtitle hotnewtitle4"></p></a></div>
                            <div class="author hotnewauthor4">박원재</div>
                        </div>   

           <div class="hotnewinner hotnewjccenter">
                <div>
                    <a href="#" class="hotnewLink5"><img class="hotnewimgsize hotnewimg5" src="#" alt=""></a>
                    <input type="hidden" name="" value="">
                </div>
                <div class="hotnewcg">[음식/생활]</div>
                <div>
                    <a href="#" class="hotnewLink5"><p class="hotnewtitle hotnewtitle5"></p></a></div>
                    <div class="author hotnewauthor5">박원재</div>
                </div>   

                <div class="hotnewinner hotnewjccenter">
                    <div>
                        <a href="#" class="hotnewLink6"><img class="hotnewimgsize hotnewimg6" src="#" alt=""></a>
                        <input type="hidden" name="" value="">
                    </div>
                    <div class="hotnewcg">[음식/생활]</div>
                    <div>
                        <a href="#" class="hotnewLink6"><p class="hotnewtitle hotnewtitle6"></p></a></div>
                        <div class="author hotnewauthor6">박원재</div>
                    </div>
                    <div class="hotnewinner hotnewjccenter">
                        <div>
                            <a href="#" class="hotnewLink7"><img class="hotnewimgsize hotnewimg7" src="#" alt=""></a>
                            <input type="hidden" name="" value="">
                        </div>
                        <div class="hotnewcg">[음식/생활]</div>
                        <div>
                            <a href="#" class="hotnewLink7"><p class="hotnewtitle hotnewtitle7"></p></a></div>
                            <div class="author hotnewauthor7">박원재</div>
                 </div>

            </ul>
            <div class="hotNewslide_btn_next btnNewrightposition"></div>
        </div>
            <div class="hotNewslide_pagination flex" style="height: 50px;  justify-content: center; display:none;" >
            </div>
            
        </div>



<!-- ////////////////////////라이징스타/////////////////////// -->

    <div class="widebg partition">
        <div class="flex">
            <div class="risingStar1">
                <p class="hotfont" style="font-family:'한컴 말랑말랑';">&nbsp;&nbsp;&nbsp;급상승★</p>
                <p class="hotfontinner" style="font-family:'한컴 말랑말랑'; font-size:50px;">it템</p>                
            </div>
            <div class="hotsearchBox-slideBox boxset">
                <div class="hotslide_btn_prev btnleftposition" style="display:none;"></div>
                <div class="hotslide_list hotListflex" style="margin-top: 30px;">
                    <div class="hotslide_content">
                        <a href="${path }/gift/giftDetail.do?giftNo=1184"><img alt="banner1" src="${path}/resources/img/main/risingstar/11.png"></a>
                    </div>
                    <div class="hotslide_content">
                       <a href="${path }/gift/giftDetail.do?giftNo=435"><img alt="banner2" src="${path}/resources/img/main/risingstar/22.png"></a>
                    </div>
                </div>
                <div class="hotslide_pagination flex" style="height: 50px; display:none; justify-content: center;" >
                </div>
                
                <div class="hotslide_btn_next btnrightposition" style="display:none;"></div>
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
                <div style="width:700px; height:220px; justify-content:space-around; display:flex; margin-left:10px; margin-top:20px;">
                    <li class="best1" style="border:2px solid rgba(88,40,16,0.2); width:120px;" >
                        <div class="icon iconred" >
                            <strong class="rankwhite">01</strong>
                        </div>
                        <div class="cover ">
                            <a href="#" class="bsLink0"><img alt="bestseller1" src="${path}/resources/img/main/bestseller/bestseller12.png" class="bestseller12 bestsellerimg0" style="width:70px; height:70px;"></a>
                        </div>
                        <div class="title ">
                            <a href="#" class="bsLink0"><p class="hotnewtitle bestsellertitle0"></p></a>
                        </div>
                        <div class="author bestsellerauthor0">박원재</div>
                    </li>
                    <li class="best2" style="border:2px solid rgba(88,40,16,0.2); width:120px;">
                        <div class="icon">
                            <strong class="rank">02</strong>
                        </div>
                        <div class="cover">
                            <div class="cover">
                                <a href="#" class="bsLink1"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller310 bestsellerimg1"></a>
                        </div>
                        <div class="title ">
                            <a href="#" class="bsLink1"><p class="hotnewtitle bestsellertitle1"></p></a>
                        </div>
                        <div class="author bestsellerauthor1">박원재</div>
                    </li>
                    <li class="best3" style="border:2px solid rgba(88,40,16,0.2); width:120px;">
                        <div class="icon">
                            <strong class="rank">03</strong>
                        </div>
                        <div class="cover">
                            <a href="#" class="bsLink2"><img alt="bestseller3" src="${path}/resources/img/main/bestseller/bestseller310.png" class="bestseller310 bestsellerimg2"></a>
                        </div>
                        <div class="title ">
                            <a href="#" class="bsLink2"><p class="hotnewtitle bestsellertitle2"></p></a>
                        </div>
                        <div class="author bestsellerauthor2">박원재</div>
                    </li>
                    <li class="best4" style="border:2px solid rgba(88,40,16,0.2); width:120px;">
                        <div class="icon">
                            <strong class="rank">04</strong>
                        </div>
                        <div class="cover">
                            <a href="#" class="bsLink3"><img alt="bestseller4" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="bestseller310 bestsellerimg3"></a>
                        </div>
                        <div class="title ">
                            <a href="#" class="bsLink3"><p class="hotnewtitle bestsellertitle3"></p></a>
                        </div>
                        <div class="author bestsellerauthor3">박원재</div>
                    </li>
                    <li class="best5" style="border:2px solid rgba(88,40,16,0.2); width:120px;">
                        <div class="icon">
                            <strong class="rank">05</strong>
                        </div>
                        <div class="cover">
                            <a href="#" class="bsLink4"><img alt="bestseller5" src="${path}/resources/img/main/bestseller/bestseller310.png" class="bestseller310 bestsellerimg4"></a>
                        </div>
                        <div class="title ">
                            <a href="#" class="bsLink4"><p class="hotnewtitle bestsellertitle4"></p></a>
                        </div>
                        <div class="author bestsellerauthor4">박원재</div>
                    </li>
                    </div>
                </ul>
               
			<!-- 기프트 1~5위 -->
                <ul class="bestsellerlist">
                <div style="width:700px; justify-content:space-around; display:flex; margin-left:10px;" >
                    <c:forEach var="ng" items="${gift }" begin="141" end="145">
                    <li class="best1" style="border:2px solid rgba(88,40,16,0.2); width:120px; ">
                        <div class="cover " style="margin-top:15px;">
                            <a href="${path}/gift/giftDetail.do?giftNo=${ng.gift_no }&loginMember=${loginMember.memberId } "><img alt="bestseller1" src="${ng.gift_img }" class="bestseller12"></a>
                        </div>
                        <div class="title ">
                            <a href="${path}/gift/giftDetail.do?giftNo=${ng.gift_no }&loginMember=${loginMember.memberId } "><p class="hotnewtitle">${ng.gift_title }</p></a>
                        </div>
                        <div class="author">${ng.gift_brand }</div>
                    </li>
                    </c:forEach>
                </div>
                </ul>
            </div>
            <div class="bestSeller_right">
                <div class="flex sectionfirst">
                    <a href="${path }/ebook/pageEbook.do?currentFocus=ebook"><p class="trigger1 mouseoverbtn mouseoverbtnbg bottomline">
                    문곰이추천
                    </p></a>
                    <a href="${path }/ebook/pageEbook.do?currentFocus=ebook"><p class="trigger2 mouseoverbtn mouseoverbtnbg bottomline">인기eBook</p></a>
                </div>
                <div class="basicform booktubercontainer" style="background-image: url('${path}/resources/img/main/icon/gomchu.png'); margin-top: 99px;">


                    <div class="booktubercontainer textalign margintop50">
                        <a href="${path }/ebook/pageEbook.do?currentFocus=ebook"><img alt="bestseller2" src="${path}/resources/img/main/bestseller/ebook.jpg" class="bestseller12"></a>
                    </div>
                    <div class="title"><p class="margintop20" style="font-weight:bold;">신비한 동물 사전</p></div>
                    <div class="comment" style="text-align:center;">
                        <a href="#"><p class="margintop10">J.K.롤링</p></a>
                    </div>
                    <ul>
                        <li>
                            <div class="booktubercontainer textalign margintop50 ">
                                <img alt="booktuber" src="${path}/resources/img/main/bestseller/bestseller310.png" class="bestseller310" style="opacity: 0;"></a>
                            </div>
                            <!-- <div class="title">
                                <a href="#"><p class="margintop20" style="opacity: 0;">책의 제목자리</p></a>
                            </div> -->
                        </li>
                    </ul>
                </div>
                <div class="hiddenform booktubercontainer hidden">
                    <div class="booktubercontainer textalign margintop50">
                        <a href="${path }/ebook/pageEbook.do?currentFocus=ebook"><img alt="bestseller2" src="${path}/resources/img/main/bestseller/ebook.png" class="bestseller12"></a>
                    </div>
                    <div class="title"><p class="margintop20">신비한 동물 사전</p></div>
                    <div class="comment">
                        <a href="#"><p class="margintop10">J.K.롤링</p></a>
                    </div>
                    <ul>
                        <li>
                            <div class="booktubercontainer textalign margintop50">
                                <a href="${path }/ebook/pageEbook.do?currentFocus=ebook"><img alt="bestseller2" src="${path}/resources/img/main/bestseller/ebook.png" class="bestseller12"></a>
                            </div>
                            <div class="title">
                                <a href="#"><p class="margintop20">신비한 동물 사전</p></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            </div>
        </div>
    </div>


<!-- ////////////////////////KHLover평점좋은책/////////////////////// -->

<div class="wrap">
        <div class="khloverBg partition">
            <div class="flex alignitems">
                <div class="footerheadline">
                    <p style="font-weight: bold;">MG평점좋은책</p>
                    
                    </div>
                    <a href="#"><img src="${path}/resources/img/main/icon/plusicon.png"></a>
            </div>
            <div class="flex">
                <div class="content">
                    <div class="khloverList flex">
                        <div class="khloverinner1">
                            <ul>
                                <li>
                                    <div class="cover weekbookcontent khloverbg1">
                                        <a href="#" class="ratingLink0"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1 bestratingimg0"></a>
                                        <div class=" " > 
                                            <a href="#" class="ratingLink0"><p class="hotnewtitle bestratingtitle0">먹어야 산다</p></a>
                                        </div>
                                        <div class="author bestratingauthor0">박원재</div>
                                        <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                        <p class="khloverscore0">9.9</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="flex  outline">
                            <ul class="flex khloverul">
                                <li>
                                    <div class="cover khloverright ">
                                        <a href="#" class="ratingLink1"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1 bestratingimg1"></a>
                                        
                                        <div class="title " > 
                                            <a href="#" class="ratingLink1"><p class="hotnewtitle bestratingtitle1">먹어야 산다</p></a>
                                            <div class="author bestratingauthor1">박원재</div>
                                            <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                                <p class="khloverscore1">9.7</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="cover khloverright ">
                                        <a href="#" class="ratingLink2"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1 bestratingimg2"></a>
                                        
                                        <div class="title " > 
                                            <a href="#" class="ratingLink2"><p class="hotnewtitle bestratingtitle2">먹어야 산다</p></a>
                                            <div class="author bestratingauthor2">박원재</div>
                                            <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                                <p class="khloverscore2">9.5</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="cover khloverright ">
                                        <a href="#" class="ratingLink3"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1 bestratingimg3"></a>
                                        
                                        <div class="title " > 
                                            <a href="#" class="ratingLink3"><p class="hotnewtitle bestratingtitle3">먹어야 산다</p></a>
                                            <div class="author bestratingauthor3">박원재</div>
                                            <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                                <p class="khloverscore3">9.3</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="cover khloverright">
                                        <a href="#" class="ratingLink4"><img alt="bestseller2" src="${path}/resources/img/main/dummybooks/dummy1.jpg" class="khloveritem1 bestratingimg4"></a>
                                        <div class="title " > 
                                            <a href="#" class="ratingLink4"><p class="hotnewtitle bestratingtitle4">먹어야 산다</p></a>
                                            <div class="author bestratingauthor4">박원재</div>
                                            <img src="${path}/resources/img/main/khlover/mark.png" style="margin-top: 10px;">
                                            <p class="khloverscore4">9.3</p>
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
                <div class="flex5" style="margin-right: 20px; margin-left: 20px;">
                        <p class="borderright footerp">공지사항</p>
                        <div class="footernoticebox-slideContent flex footerbox">
                        
                            <ul class="footerslide-List" style="margin-left: 20px;">
                                   <c:forEach var="n" items="${notice }">
                                    <li class="footerslide-content">
                                        <a href="${path }/service/serviceMain.do">${n.noticeboardTitle }</a></li>
                                    </c:forEach>
                            </ul>
                        </div>   
                <div class="footerslide-pagination""></div>
                <div>
                    <button class="footerslide-button-prev footerbtn" style="display:none;"></button>
                    <button class="footerslide-button-next footerbtn" style="display:none;"></button>
                </div>    
            </div>
                <div class="flex5">
                    <p class="borderright footerp" style="text-align: center;">이벤트</p>
                        <div class="footernoticebox-slideContent flex footerbox">
                        
                            <ul class="footerslide2-List" style="margin-left: 20px;">
                                    <c:forEach var="e" items="${event }">
                                    <li class="footerslide2-content">
                                        <a href="${path }/service/eventBoard.do">${e.eventboardTitle }</a></li>
                                    </c:forEach>
                            </ul>
                        </div>   
                <div class="footerslide2-pagination"></div>
                <div>
                    <button class="footerslide2-button-prev footerbtn" style="display:none;"></button>
                    <button class="footerslide2-button-next footerbtn" style="display:none;"></button>
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
                        <li><a href="#" class="ataggray">문곰캐시 조회·충전</a></li>
                        <li><a href="#" class="ataggray">휴면고객 조회·복원</a></li>
                    </ul>
                </div>
                <div class="upFooter_downSide verticalline" >
                    <h2><a href="#" class="middlefont">문곰책방 알리미</a></h2>
                    <ul class="footerul">
                        <li><a href="#" class="ataggray">문곰페이스북</a></li>
                        <li><a href="#" class="ataggray">문곰트위터</a></li>
                        <li><a href="#" class="ataggray">문곰인스타그램</a></li>
                        <li><a href="#" class="ataggray">문곰유튜브</a></li>
                    </ul>
                </div>
                <div class="upFooter_downSide ">
                    <h2><a href="#" class="middlefont">FAQ</a></h2>
                    <ul class="footerul">
                        <li><a href="#" class="ataggray">주문·결제</a></li>
                        <li><a href="#" class="ataggray">문곰e북</a></li>
                        <li><a href="#" class="ataggray">도서·상품정보</a></li>
                        <li><a href="#" class="ataggray">중고장터</a></li>
                    </ul>
                </div>
            </div>
            <div class="flex5" style="margin-top: 15px;opacity: 0;">
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
	var octo = document.getElementById("octo");
	octo.volume = 0.3;
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

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>