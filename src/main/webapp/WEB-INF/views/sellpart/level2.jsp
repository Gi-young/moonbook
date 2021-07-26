<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>

<section id="content">
 <div id="level_container" class="line">
        <div id="banner">
            <div id="banner_left" class="line">배너왼쪽</div>
            <div id="banner_right" class="line">배너오른쪽</div>
        </div>
        <div>
            <div id="level_cho">
                <!--1 레벨
                    주소값 받아서 a안에 값 설정
                -->
                <div class="level_catagory_cho">
                    <a> 홈 ></a>
                </div>

                <div class="level_catagory_cho">
                    <a> 국내도서 ></a>
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
                            <li><a>국내도서</a></li>
                            <li><a>외국도서</a></li>
                            <li><a>ebook</a></li>
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
                            <li><a>국내도서</a></li>
                            <li><a>외국도서</a></li>
                            <li><a>ebook</a></li>
                        </ul>
                    </div>
                </div>

                <div class="level_catagory_cho">
                    <a> 한국 소설 ></a>

                </div>


                
                <div id="serach-form" class="line" style="float: right;">
                        <form action="">
                            <input type="text" name="search">
                            <input type="submit" value="검색">
                        </form>
                </div>
            </div>
     
 
        </div>

    

        <div id="btn_chose2">
            <ul>
                <li><span><a>베스트 셀러</a></span></li>
                <li><span><a>베스트 셀러</a></span></li>
                <li><span><a>베스트 셀러</a></span></li>
                <li><span><a>베스트 셀러</a></span></li>
                <li><span><a>베스트 셀러</a></span></li>
            </ul>
                

        </div>
        <div id="select_bar">
            <p>인터넷에서 판매되는 상품 중 지난 1주일간 가장 많이 판매된 상품</p>
            <div style="float: right;">
                <form action="">
                <select name="" id="">
                    <option value="20">20개씩보기</option>
                    <option value="50">50개씩보기</option>
                </select>
                <select name="" id="">
                    <option value="20">펼쳐보기</option>
                    <option value="50">간략보기</option>
                </select>
                </form>
            </div>
        </div>

        <div style="margin: 10px;">
            <div style="display: inline-block;"> 1 - 2- 3 -4  - 5 - 6 - 7 </div>
            <div style="display: inline-block; float: right;">
                <button class="btn_1">전체선택</button>
                <button class="btn_1">장바구니 담기</button>
                <button class="btn_1">구매</button>
            </div>
        </div>

        <!--for문 돌려서 조건에 맞는 도서 목록 출력-->
        <div class="booklist">
            <input type="checkbox">
            <div class="booklist_img line"><img src="2.png" alt="#" width="200px" height="200px"></div>
            <div class="booklist_ex line">
                <strong>책 제목을 적는 공간입니다</strong>
                <div>
                    <span class="bcontent">지은이</span>
                    <span class="bcontent">출판사</span>
                    <span class="bcontent">출간일</span>
                </div>
                <p class="bprice" style="margin: 10px;">가격</p>
                <p class="bcontent">책 설명</p>
                <p class="bcontent" style="border-bottom: 1px dotted black;"> <img src="" alt="클로버 사진"> <span>9.9</span>  / <span>10</span><span>리뷰 : 개수</span></p>
                <p>배송일정</p>

            </div>
            <div class="booklist_btn line">
                <div>장바구니 담기</div>
                <div>바로구매</div>
                <div>보관함담기</div>   
            </div>
        </div>
        <div class="booklist">
            <input type="checkbox">
            <div class="booklist_img line"><img src="2.png" alt="#" width="200px" height="200px"></div>
            <div class="booklist_ex line">
                <strong>책 제목을 적는 공간입니다</strong>
                <div>
                    <span class="bcontent">지은이</span>
                    <span class="bcontent">출판사</span>
                    <span class="bcontent">출간일</span>
                </div>
                <p class="bprice" style="margin: 10px;">가격</p>
                <p class="bcontent">책 설명</p>
                <p class="bcontent" style="border-bottom: 1px dotted black;"> <img src="" alt="클로버 사진"> <span>9.9</span>  / <span>10</span><span>리뷰 : 개수</span></p>
                <p>배송일정</p>

            </div>
            <div class="booklist_btn line">
                <div>장바구니 담기</div>
                <div>바로구매</div>
                <div>보관함담기</div>   
            </div>
        </div>
        <div class="booklist">
            <input type="checkbox">
            <div class="booklist_img line"><img src="2.png" alt="#" width="200px" height="200px"></div>
            <div class="booklist_ex line">
                <strong>책 제목을 적는 공간입니다</strong>
                <div>
                    <span class="bcontent">지은이</span>
                    <span class="bcontent">출판사</span>
                    <span class="bcontent">출간일</span>
                </div>
                <p class="bprice" style="margin: 10px;">가격</p>
                <p class="bcontent">책 설명</p>
                <p class="bcontent" style="border-bottom: 1px dotted black;"> <img src="" alt="클로버 사진"> <span>9.9</span>  / <span>10</span><span>리뷰 : 개수</span></p>
                <p>배송일정</p>

            </div>
            <div class="booklist_btn line">
                <div>장바구니 담기</div>
                <div>바로구매</div>
                <div>보관함담기</div>   
            </div>
        </div>


        <!--for문-->
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

    </script>
	


</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>