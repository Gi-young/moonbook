<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문곰템 | 잡화</title>
    <link rel="stylesheet" href="${path }/resources/css/gift/category.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

  <style>
    .post-slider{
      border:1px solid red;
    }
    .post-slider .post-wrapper{
      width:84%;
      height:350px;
      margin:0px auto;
      border:1px dashed red;
    }
    .post-slider .post-wrapper .post{
      width:300px;
      height:350px;
      display:inline-block;
      background:gray;
    }
</style>   
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
    <div class="wrap">
    <jsp:include page="/WEB-INF/views/gift/hotTracksMenu.jsp">
    <jsp:param name="" value=""/>
    </jsp:include>
        <div class="category-box">
            <div class="main-title">
                <p class="main">잡화</p>
            </div>
            <div class="sub-title">
                <p class="sub">당신에게 필요한 여러가지 상품들을 준비해봤어요!</p>
            </div>
        </div> 
        <div class="space"></div>
        <div class="thing9">
            <div>
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">과자집 씰 스티커</p>
                            <div class="flex">
                                <p class="discount">할인율</p>
                                <p class="price">가격</p>
                            </div>
                        </div>
                    </div>
                    <img src="${path }/resources/images/gift/led스탠드레드.jpg" alt="">
                </a>
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">과자집 씰 스티커</p>
                            <div class="flex">
                                <p class="discount">할인율</p>
                                <p class="price">가격</p>
                            </div>
                        </div>
                    </div>
                    <img src="${path }/resources/images/gift/전신거울스탠드.jpg" alt="">
                </a>
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">과자집 씰 스티커</p>
                            <div class="flex">
                                <p class="discount">할인율</p>
                                <p class="price">가격</p>
                            </div>
                        </div>
                    </div>
                    <img src="${path }/resources/images/gift/과자집씰스티커.jpg" alt="">
                </a>
            </div>
            <div>
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">과자집 씰 스티커</p>
                            <div class="flex">
                                <p class="discount">할인율</p>
                                <p class="price">가격</p>
                            </div>
                        </div>
                    </div>
                    <img src="${path }/resources/images/gift/led스탠드레드.jpg" alt="">
                </a>
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">과자집 씰 스티커</p>
                            <div class="flex">
                                <p class="discount">할인율</p>
                                <p class="price">가격</p>
                            </div>
                        </div>
                    </div>
                    <img src="${path }/resources/images/gift/전신거울스탠드.jpg" alt="">
                </a>
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">과자집 씰 스티커</p>
                            <div class="flex">
                                <p class="discount">할인율</p>
                                <p class="price">가격</p>
                            </div>
                        </div>
                    </div>
                    <img src="${path }/resources/images/gift/과자집씰스티커.jpg" alt="">
                </a>
            </div>
            <div>
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">과자집 씰 스티커</p>
                            <div class="flex">
                                <p class="discount">할인율</p>
                                <p class="price">가격</p>
                            </div>
                        </div>
                    </div>
                    <img src="${path }/resources/images/gift/led스탠드레드.jpg" alt="">
                </a>
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">과자집 씰 스티커</p>
                            <div class="flex">
                                <p class="discount">할인율</p>
                                <p class="price">가격</p>
                            </div>
                        </div>
                    </div>
                    <img src="${path }/resources/images/gift/전신거울스탠드.jpg" alt="">
                </a>
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">과자집 씰 스티커</p>
                            <div class="flex">
                                <p class="discount">할인율</p>
                                <p class="price">가격</p>
                            </div>
                        </div>
                    </div>
                    <img src="${path }/resources/images/gift/과자집씰스티커.jpg" alt="">
                </a>
            </div>
        </div>
        <div class="space"></div>
    </div>
    <div class="slide-wrapper">
        <div class="slider">
            <div>
                1
                <img src="${path }/resources/images/gift/과자집씰스티커.jpg" alt="">
            </div>
            <div>
                2
                <img src="${path }/resources/images/gift/과자집씰스티커.jpg" alt="">
            </div>
            <div>
                3
                <img src="${path }/resources/images/gift/과자집씰스티커.jpg" alt="">
            </div>
            <div>
                4
                <img src="${path }/resources/images/gift/과자집씰스티커.jpg" alt="">
            </div>
            <div>
                5
                <img src="${path }/resources/images/gift/과자집씰스티커.jpg" alt="">
            </div>
            <div>
                6
                <img src="${path }/resources/images/gift/과자집씰스티커.jpg" alt="">
            </div>
        </div>
    </div> 
    <!-- <div class="post-slider">
        <h1 class="sider-title">Treding Posts</h1>
        <div class="post-wrapper">
          <div class="post">1</div>
          <div class="post">2</div>
          <div class="post">3</div>
          <div class="post">4</div>
          <div class="post">5</div>
        </div>
</div> -->
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
    /* $(document).ready(function(){
    // 헤더
    $(".header").load("../html/header.html");
    });
    $(document).ready(function(){
    // 푸터
    $(".footer").load("../html/footer.html");
    }); */

    // img hover시 설명클래스 출력
    let thing9 = $(".thing9-a");
    $(thing9).on("mouseover", function(e){
        
        $(this).children().first().removeClass('none');
    });
    $(thing9).on("mouseout", function(e){
        $(this).children().first().addClass("none");
    })

    // slick slide
    $('.slider').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000
    });
   
</script>

</body>
</html>