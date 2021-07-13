<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="" value=""/>
</jsp:include>

    <div class="wrap">
    <div class="flex bannerwrap">
    <div class="mainbanner flex">
        <div class="mainbanner_obj1">
        <div class="mainsearchBox-slideBox">
            <div class="mainbanner_objleft btndown mainsearchBox-slideList">
            	<div class="mainsearchBox-slideContent">
            	<img alt="banner1" src="${path }/resources/img/main/banner/banner.png">
            	</div>
            	<div class="mainsearchBox-slideContent">
            	<img alt="banner1" src="${path }/resources/img/main/banner/banner2.png">
            	</div>
            <!-- <div class="mainbanner_objcontainer flex ">
            </div>
        	</div> -->
	        <!-- <button class="mainbanner_objinner">버튼2</button>
	        <button class="mainbanner_objinner">버튼3</button>
	        <button class="mainbanner_objinner">버튼4</button>
	        <button class="mainbanner_objinner">버튼5</button>
	        <button class="mainbanner_objinner">버튼6</button>
	        <button class="mainbanner_objinner">버튼7</button> -->
        </div>
        </div>
        <div class="slide-pagination"></div>
                <button class="searchBox-slideBtn-prev"><</button>
                <button class="searchBox-slideBtn-next">></button>
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
                <div class="upFooter_downSide">KH문고소식</div>
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
	<script src="${path }/resources/js/header(2).js"></script>
	<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp">
<jsp:param name="" value=""/>
</jsp:include>

<script src="${path }/resources/js/main.js"></script>