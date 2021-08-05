<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="중고게시판 리스트"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/usedboard/usedboardList.css">
<section id="content">
    <br><br><br>
    <div class="side" style="float: left; margin-top: 20px; margin-left: 150px">
        <div class="">
            <center><h2 style="margin-bottom: 20px	;"><a style="color: orange;">카테고리</a></h2></center>
            <div style="border:1px solid #666; width: 160px;">
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='소설'">소설</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='시/에세이'">시/에세이</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='경제/경영'">경제/경영</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='자기계발'">자기계발</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='인문'">인문</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='역사문화'">역사문화</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='종교'">종교</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='정치/사회'">정치/사회</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='예술/대중문화'">예술/대중문화</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='과학'">과학</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='기술/공학'">기술/공학</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='컴퓨터/IT'">컴퓨터/IT</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='초등학습'">초등학습</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='중/고등학습'">중/고등학습</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='대학교재'">대학교재</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='취업/수험서'">취업/수험서</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='외국어'">외국어</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='동화'">동화</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='아동'">아동</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='가정생활'">가정생활</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='건강'">건강</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='여행'">여행</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='요리'">요리</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='스포츠'">스포츠</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='잡지'">잡지</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='만화'">만화</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='사전'">사전</a></li>
                </ul>
                <ul id="ul1">
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='외서'">외서</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='일서'">일서</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div style="height: 1250px">
        <p id="titi" style="font-size: 35px; color: cornflowerblue;">  중고게시판 &nbsp;&nbsp;&nbsp;
        <c:if test="${loginMember!=null }">
        <a href="${path }/usedboard/usedboardList.do?memberId=${loginMember.memberId}" style="font-size: 20px; color: #964b00">내 중고게시판</a> <a style="font-size: 20px; color: #964b00;">/</a> 
        <a href="${path }/usedboard/usedboardMyPayment.do?memberId=${loginMember.memberId}" style="font-size: 20px; color: #964b00;">내 중고구매목록</a>
        </c:if></p>
        <c:if test="${loginMember!=null }">
        <a href="${path }/usedboard/usedboardInsert.do" id="insertborad" style="left: 65%; font-size: 18px;">거래 등록</a>
        </c:if>
        <br><br>
        <c:if test="${list.isEmpty() }">
	        <div id="secondBorad" style="padding-left: 300px;">
	            <div class="side">
	            <br><hr><br><br>
	            <center><h1>물품이 없습니다.</h1></center>
	            </div>
	            </div>
	        </c:if>
        <c:if test="${list != null }">
        <c:forEach var="b" items="${list }">
        <div id="secondBorad" style="padding-left: 300px;">
            <div class="side">
            	<div  class="aaa" style="border-bottom: 1px solid #999; width: 1330px;">
                    <a href="${path }/usedboard/usedboardView.do?no=${b.usedboard_No }">
                        <span class="artice">
                            <span style="font-size: 15px;">
	                            <c:if test="${b.usedboard_Category != '' }">
									<c:forEach var="l" items="${b.usedboard_Category }" varStatus="vs">
										${l }
									</c:forEach>
								</c:if>
                            </span> 
                    <div id="imgdivback" style=" width: 130px; resize:none; height: 120px; background-color: rgb(234, 234, 234); position: relative; top: 20px;"> 
                        
                            <img src="${path }/resources/upload/usedboard/${b.usedboardfiles[0].usedboardfile_Rename}" width="130" height="120" onerror="" >
                        </div>
                            <strong class="tit" style="display: inline-block;">
                                <span class="txt_de" style="font-size: 23px;">&emsp;${b.usedboard_Title }</span>
                            </strong>
                            <span id="ddssaa" style="font-size: 17px;">책제목 : ${b.usedboard_BookTitle } / 가격 : ${b.usedboard_Price }</span>
                            <br>
                            <span id="ddssaa" style="font-size: 17px;">${b.usedboard_Content }</span></a>
                            <span class="txt_info">
                                <span class="username" style="font-size: 17px;">
                                    ${b.member_Id }
                                    ||
                                </span>
                                <span style="font-size: 17px;">
                                    ${b.usedboard_Date }
                                    ||
                                </span> 
                                <c:if test="${b.usedboard_State == 'y' }">
									<span style="font-size: 17px; color: red;">
                                    거래중 
                                	</span>
								</c:if>
                                <c:if test="${b.usedboard_State != 'y' }">
									<span style="font-size: 17px; color: blue;">
                                    거래완료
                                	</span>
								</c:if>	
								<c:if test="${b.usedboard_State == '1' }">
                                	<c:if test="${b.member_Id == loginMember.memberId }">
                                		<span style="font-size: 17px;"> || </span>
                                		<span style="font-size: 17px; color: black;"> 배송확인중 </span>
                                		<span style="font-size: 17px;"> || </span>
                                		<button onclick="location.assign('${path}/usedboard/usedboardPay1.do?no=${b.usedboard_No }&memberId=${loginMember.memberId }');" style="height: 20px;width: 100px;font-size: 14px">배송확인</button>
                                	</c:if>
								</c:if>	
								<c:if test="${b.usedboard_State == '2' }">
                                	<c:if test="${b.member_Id == loginMember.memberId }">
                                		<span style="font-size: 17px;"> || </span>
                                		<span style="font-size: 17px; color: black;"> 배송중 </span>
                                	</c:if>
								</c:if>	
								<c:if test="${b.usedboard_State == '3' }">
                                	<c:if test="${b.member_Id == loginMember.memberId }">
                                		<span style="font-size: 17px;"> || </span>
                                		<span style="font-size: 17px; color: black;"> 배송완료 </span>
                                	</c:if>
								</c:if>	
                            </span>
                        </span>
                        
                    </div>
                </div>
            </div>
        </c:forEach>
        </c:if>
        
        </div>
        <br><br>
		<div id="pageBarb">${pageBar }</div>
</section>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"></jsp:include>