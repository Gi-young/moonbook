<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  


<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
   <div id="wrap">
    <div id="container">
        <div>
            <p><span>level1</span> > <span>level2</span> > <span>물품 이름</span></p>
        </div>



        <div style="display: flex;">
            <div class="auctionview_left line">
                <img src="" alt="">
            </div>
            <div class="auctionview_right">
                <div>
                    <h2>경매 정보</h2>
                    <p>경매 시작일 : <span>2010/12/21 </span></p>
                    <p>경매 종료일: <span>2010/23/31 </span></p>
                    <p>남은 시간: <span>04:20:21 </span></p>
                    <p>입찰자수: <span>0 </span> 명</p>
                    <p>최고 입찰자 <span>입찰자 id</span></p>
                    <p>판매자 id<span>판매자 id</span></p> 
                </div>
                <div>
                    <h2>가격 정보</h2>
                    <p>경매 시작가 : <span>2010/12/21 </span></p>
                    <p>응찰 단위: <span>2010/23/31 </span></p>
                    <p>현재 최고가: <span>04:20:21 </span></p>
                    <p>즉시 구매가격: <span class="auction_buy_now">10000 </span>원</p>
                    <p>입찰가능 가격 <span>0 </span> 명</p>
                    <p>배송비 <span>2000</span></p>
                    <p>판매자 id<span>판매자 id</span></p> 
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
                    본문내용
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

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>