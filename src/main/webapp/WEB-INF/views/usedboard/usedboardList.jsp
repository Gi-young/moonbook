<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="중고게시판 리스트"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/usedboard/usedboardList.css">
<section id="content">
    <br><br><br>
    <div class="side" style="float: left; margin-top: 20px; margin-left: 150px">
        <div class="">
            <center><h2 style="margin-bottom: 20px;"><a style="color: orange;">카테고리</a></h2></center>
            <div style="border:1px solid #666; width: 140px;">
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="">소설</a></li>
                    <li><a href="">시/에세이</a></li>
                    <li><a href="">경제/경영</a></li>
                    <li style="margin-bottom: 17px;"><a href="">자기계발</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="">인문</a></li>
                    <li><a href="">역사문화</a></li>
                    <li><a href="">종교</a></li>
                    <li><a href="">정치/사회</a></li>
                    <li><a href="">예술/대중문화</a></li>
                    <li><a href="">과학</a></li>
                    <li><a href="">기술/공학</a></li>
                    <li style="margin-bottom: 17px;"><a href="">컴퓨터/IT</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="">초등학습</a></li>
                    <li><a href="">중/고등학습</a></li>
                    <li><a href="">대학교재</a></li>
                    <li><a href="">취업/수험서</a></li>
                    <li style="margin-bottom: 17px;"><a href="">외국어</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="">동화</a></li>
                    <li style="margin-bottom: 17px;"><a href="">아동</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="">가정생활</a></li>
                    <li><a href="">건강</a></li>
                    <li><a href="">여행</a></li>
                    <li><a href="">요리</a></li>
                    <li style="margin-bottom: 17px;"><a href="">스포츠</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="">잡지</a></li>
                    <li><a href="">만화</a></li>
                    <li style="margin-bottom: 17px;"><a href="">사전</a></li>
                </ul>
                <ul id="ul1">
                    <li><a href="">외서</a></li>
                    <li style="margin-bottom: 17px;"><a href="">일서</a></li>
                </ul>
            </div>
        </div><!-- .nav_category -->
    </div>
    <div>
        <p id="titi" style="font-size: 35px; color: cornflowerblue;">  중고게시판</p>
        <p id="insertborad" style="left: 65%; font-size: 18px;">거래 등록</p>
        <div id="secondBorad" style="position: relative; padding-left: 140px">
            <div class="side">
                    <a href="" class="aaa" style="border-bottom: 1px solid #999; width: 1330px;">
                        <span class="artice">
                            <span style="font-size: 15px;">
                                (장르)
                            </span> 
                    <div id="imgdivback" style=" width: 130px; resize:none; height: 120px; background-color: rgb(234, 234, 234); position: relative; top: 20px;"> 
                        
                            <img src="" width="130" height="120" onerror="" >
                        </div>
                            <strong class="tit" style="display: inline-block;">
                                <span class="txt_de" style="font-size: 23px;">&emsp;첫번째글</span>
                            </strong>
                            <span id="ddssaa" style="font-size: 17px;">책정보</span>
                            <span class="txt_info">
                                <span class="username" style="font-size: 17px;">
                                    아이디
                                    ||
                                </span>
                                <span style="font-size: 17px;">
                                    날짜
                                    ||
                                </span> 
                                <span style="font-size: 17px; color: red;">
                                    거래중 
                                </span>
                                <span style="font-size: 17px; color: blue;">
                                    거래완료
                                </span>
                            </span>
                        </span>
                        
                    </a>
                </div>
            </div>


        <div id="secondBorad" style="position: relative; padding-left: 140px">
            <div class="side">
                <a href="" class="aaa" style="border-bottom: 1px solid #999; width: 1330px;">
                        <span class="artice">
                            <span style="font-size: 15px;">
                                (장르)
                            </span> 
                    <div id="imgdivback" style=" width: 130px; resize:none; height: 120px; background-color: rgb(234, 234, 234); position: relative; top: 20px;"> 
                        
                            <img src="" width="130" height="120" onerror="" >
                        </div>
                            <strong class="tit" style="display: inline-block;">
                                <span class="txt_de" style="font-size: 23px;">&emsp;두번째글</span>
                            </strong>
                            <span id="ddssaa" style="font-size: 17px;">제목 : 아기돼지삼형제 / 글쓴이 : 제이콥스 / 출판사 : 글송이 / 가격 : 6300원</span>
                            <span class="txt_info">
                                <span class="username" style="font-size: 17px;">
                                    아이디
                                    ||
                                </span>
                                <span style="font-size: 17px;">
                                    날짜
                                    ||
                                </span> 
                                <span style="font-size: 17px; color: red;">
                                    거래중 
                                </span>
                                <span style="font-size: 17px; color: blue;">
                                    거래완료
                                </span>
                            </span>
                        </span>
                    </a>
                </div>
            </div>


            <!-- <div id="secondBorad" style="position: relative; padding-left: 140px">
                <div class="side">
                    <a href="" class="aaa" style="border-bottom: 1px solid #999; width: 1330px;">
                            <span class="artice">
                                <span style="font-size: 15px;">
                                    (장르)
                                </span> 
                        <div id="imgdivback" style=" width: 130px; resize:none; height: 120px; background-color: rgb(234, 234, 234); position: relative; top: 20px;"> 
                            
                                <img src="" width="130" height="120" onerror="" >
                            </div>
                                <strong class="tit" style="display: inline-block;">
                                    <span class="txt_de" style="font-size: 23px;">&emsp;세번째글</span>
                                </strong>
                                <span id="ddssaa" style="font-size: 17px;">책정보</span>
                                <span class="txt_info">
                                    <span class="username" style="font-size: 17px;">
                                        아이디
                                        ||
                                    </span>
                                    <span style="font-size: 17px;">
                                        날짜
                                        ||
                                    </span> 
                                    <span style="font-size: 17px; color: red;">
                                        거래중 
                                    </span>
                                    <span style="font-size: 17px; color: blue;">
                                        거래완료
                                    </span>
                                </span>
                            </span>
                        </a>
                    </div>
                </div>
                <div id="secondBorad" style="position: relative; padding-left: 140px">
                <div class="side">
                    <a href="" class="aaa" style="border-bottom: 1px solid #999; width: 1330px;">
                            <span class="artice">
                                <span style="font-size: 15px;">
                                    (장르)
                                </span> 
                        <div id="imgdivback" style=" width: 130px; resize:none; height: 120px; background-color: rgb(234, 234, 234); position: relative; top: 20px;"> 
                            
                                <img src="" width="130" height="120" onerror="" >
                            </div>
                                <strong class="tit" style="display: inline-block;">
                                    <span class="txt_de" style="font-size: 23px;">&emsp;세번째글</span>
                                </strong>
                                <span id="ddssaa" style="font-size: 17px;">책정보</span>
                                <span class="txt_info">
                                    <span class="username" style="font-size: 17px;">
                                        아이디
                                        ||
                                    </span>
                                    <span style="font-size: 17px;">
                                        날짜
                                        ||
                                    </span> 
                                    <span style="font-size: 17px; color: red;">
                                        거래중 
                                    </span>
                                    <span style="font-size: 17px; color: blue;">
                                        거래완료
                                    </span>
                                </span>
                            </span>
                        </a>
                    </div>
                </div>
                <div id="secondBorad" style="position: relative; padding-left: 140px ">
                <div class="side">
                    <a href="" class="aaa" style="border-bottom: 1px solid #999; width: 1330px;">
                            <span class="artice">
                                <span style="font-size: 15px;">
                                    (장르)
                                </span> 
                        <div id="imgdivback" style=" width: 130px; resize:none; height: 120px; background-color: rgb(234, 234, 234); position: relative; top: 20px;"> 
                            
                                <img src="" width="130" height="120" onerror="" >
                            </div>
                                <strong class="tit" style="display: inline-block;">
                                    <span class="txt_de" style="font-size: 23px;">&emsp;세번째글</span>
                                </strong>
                                <span id="ddssaa" style="font-size: 17px;">책정보</span>
                                <span class="txt_info">
                                    <span class="username" style="font-size: 17px;">
                                        아이디
                                        ||
                                    </span>
                                    <span style="font-size: 17px;">
                                        날짜
                                        ||
                                    </span> 
                                    <span style="font-size: 17px; color: red;">
                                        거래중 
                                    </span>
                                    <span style="font-size: 17px; color: blue;">
                                        거래완료
                                    </span>
                                </span>
                            </span>
                        </a>
                    </div>
                </div> -->
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>