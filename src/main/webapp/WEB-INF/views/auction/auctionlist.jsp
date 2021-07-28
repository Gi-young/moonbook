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
            <p><span>level1</span> > <span>level2</span></p>
        </div>
        <div class="auctionlist_level2">
            <div>
                <a href="">도서 카테고리 level2</a>
            </div>
            <div>
                <a href="">도서 카테고리 level2</a>
            </div>
            <div>
                <a href="">도서 카테고리 level2</a>
            </div>
            <div>
                <a href="">도서 카테고리 level2</a>
            </div>
            <div>
                <a href="">도서 카테고리 level2</a>
            </div>
            <div>
                <a href="">도서 카테고리 level2</a>
            </div>
            <div>
                <a href="">도서 카테고리 level2</a>
            </div>
            <div>
                <a href="">도서 카테고리 level2</a>
            </div>
        </div>

        <div class="auctionlist">
            <table>
                <tr>
                    <th>이미지</th>
                    <th style="width: 300px;">물품이름</th>
                    <th>시작가</th>
                    <th>입찰자수</th>
                    <th>현재 입찰가</th>
                    <th>등록일</th>
                    <th>경매 종료일</th>
                    <th>남은 시간</th>
                </tr>
                <tr>
                    <td class="auctionlist_img"><img src="" alt=""></td>
                    <td class="auctionlist_title"><a>물품명</a></td>
                    <td class="auctionlist_price">10000</td>
                    <td class="auctionlist_person">0명</td>
                    <td>1000</td>
                    <td>10/10/10</td>
                    <td>10/10/10</td>
                    <td>22:22:22</td>
                </tr>
                <tr>
                    <td class="auctionlist_img"><img src="" alt=""></td>
                    <td class="auctionlist_title"><a>물품명</a></td>
                    <td class="auctionlist_price">10000</td>
                    <td class="auctionlist_person">0명</td>
                    <td>1000</td>
                    <td>10/10/10</td>
                    <td>10/10/10</td>
                    <td>22:22:22</td>
                </tr>
                <tr>
                    <td class="auctionlist_img"><img src="" alt=""></td>
                    <td class="auctionlist_title"><a>물품명</a></td>
                    <td class="auctionlist_price">10000</td>
                    <td class="auctionlist_person">0명</td>
                    <td>1000</td>
                    <td>10/10/10</td>
                    <td>10/10/10</td>
                    <td>22:22:22</td>
                </tr>
                <tr>
                    <td class="auctionlist_img"><img src="" alt=""></td>
                    <td class="auctionlist_title"><a>물품명</a></td>
                    <td class="auctionlist_price">10000</td>
                    <td class="auctionlist_person">0명</td>
                    <td>1000</td>
                    <td>10/10/10</td>
                    <td>10/10/10</td>
                    <td>22:22:22</td>
                </tr>
                <tr>
                    <td class="auctionlist_img"><img src="" alt=""></td>
                    <td class="auctionlist_title"><a>물품명</a></td>
                    <td class="auctionlist_price">10000</td>
                    <td class="auctionlist_person">0명</td>
                    <td>1000</td>
                    <td>10/10/10</td>
                    <td>10/10/10</td>
                    <td>22:22:22</td>
                </tr>
            </table>
            <div class="pagebar">pagebar</div>

        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>