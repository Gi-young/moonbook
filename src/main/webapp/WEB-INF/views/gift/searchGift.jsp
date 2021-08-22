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
    <title>문곰템 | 전자기기</title>
    <link rel="stylesheet" href="${path }/resources/css/gift/category.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
 
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
                <p class="main">${keyword }을(를) 찾아봤어요.</p>
            </div>
            <div class="sub-title">
                <p class="sub">찾으시는 물건이 있나요?</p>
            </div>
        </div> 
        <div class="space"></div>
		<div class="searchBox">
			<p style="font-weight:800; font-size:18px;">도움이 필요하신가요?</p>
			<form action="${path }/gift/searchGift.do?" method="post">
				<p class="searchInput">
					<input type="text" class="searchText" id="keyword" name="keyword">	 
					좀 찾아주세요.	
				</p>
				<div style="width:240px; height:32px; margin-top:10px; display:flex; justify-content: center; align-items:center; align-content:center;">
					<button class="searchBtn">네, 알겠습니다.</button>		
				</div>
			</form>		
		</div>        
        <div class="space"></div>
        <div class="thing9">
            <div style="word-break:break-all;">
            	<c:forEach var="e" items="${list }" begin="${num }" end="${num+2 }"> 
            	
                <a href="${path }/gift/giftDetail.do?giftNo=${e.gift_no}" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">${e.gift_title }</p>
                            <div class="flex">
                                <!-- <p class="discount">할인율</p> -->
                                <p class="price"><fmt:formatNumber value="${e.gift_price }" type="number"/></p>
                            </div>
                        </div>
                    </div>
                    <img src="${e.gift_img }" alt="" style="width:300px; height:300px;">
                </a>            
                </c:forEach>
            </div>
             <div>
                <c:forEach var="e" items="${list }" begin="${num+3 }" end="${(num+3)+2 }"> 
                
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">${e.gift_title }</p>
                            <div class="flex">
                                <!-- <p class="discount">할인율</p> -->
                                <p class="price"><fmt:formatNumber value="${e.gift_price }" type="number"/></p>
                            </div>
                        </div>
                    </div>
                    <img src="${e.gift_img }" alt="" style="width:300px; height:300px;">
                </a>            
                </c:forEach>
            </div>
            <div>
                <c:forEach var="e" items="${list }" begin="${num+5 }" end="${(num+5)+2}"> 
                <a href="#" class="thing9-a">
                    <div class="inner-a none">
                        <div class="inner-div">
                            <p class="explan">${e.gift_title }</p>
                            <div class="flex">
                                <!-- <p class="discount">할인율</p> -->
                                <p class="price"><fmt:formatNumber value="${e.gift_price }" type="number"/></p>
                            </div>
                        </div>
                    </div>
                    <img src="${e.gift_img }" alt="" style="width:300px; height:300px;">
                </a>            
                </c:forEach>
            </div> 
        </div>
        <div class="space"></div>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>

    // img hover시 설명클래스 출력
    let thing9 = $(".thing9-a");
    $(thing9).on("mouseover", function(e){
        
        $(this).children().first().removeClass('none');
    });
    $(thing9).on("mouseout", function(e){
        $(this).children().first().addClass("none");
    })
   
</script>

</body>
</html>        