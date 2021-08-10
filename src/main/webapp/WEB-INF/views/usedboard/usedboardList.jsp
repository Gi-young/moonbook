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
            <center style="margin-bottom: 20px;"><a href="${path }/usedboard/usedboardList.do" style="color: orange; font-size: 20px; font-weight: 900;">카테고리</a></center>
            <div style="border:1px solid #666; width: 200px; height: 520px">
                <ul id="ul1" style="border-bottom:1px solid #666;">
                	<li style="font-size: 20px;font-weight: 900;margin-left: 20px;margin-bottom: 10px;color: ">-고전/문학-</li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='한국고전소설'">한국고전소설</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='세계문학'">세계문학</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='세계고전'">세계고전</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                	<li style="font-size: 20px;font-weight: 900;margin-left: 35px;margin-bottom: 10px">-청소년-</li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='청소년문학'">청소년문학</a></li>
                </ul>
                <ul id="ul1" style="border-bottom:1px solid #666;">
                	<li style="font-size: 20px;font-weight: 900;margin-left: 45px;margin-bottom: 10px">-유아-</li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='한국그림책(0~3세)'">한국그림책(0~3세)</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='외국그림책(0~3세)'">외국그림책(0~3세)</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='한국그림책(4~7세)'">한국그림책(4~7세)</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='외국그림책(4~7세)'">외국그림책(4~7세)</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='세계명작동화'">세계명작동화</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='한국전래동화'">한국전래동화</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='국내창작동화'">국내창작동화</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='다른나라그림책'">다른나라그림책</a></li>
                </ul>
                <ul id="ul1">
                	<li style="font-size: 20px;font-weight: 900;margin-left: 35px;margin-bottom: 10px">-어린이-</li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='어린이동화(초1~2학년)'">어린이동화(초1~2학년)</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='어린이동화(초3~4학년)'">어린이동화(초3~4학년)</a></li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='어린이동화(초5~6학년)'">어린이동화(초5~6학년)</a></li>
                    <li style="margin-bottom: 17px;"><a href="${path}/usedboard/usedboardList.do?catagory='스포츠'">어린이동화(공통)</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div style="height: 1250px">
        <p id="titi" style="font-size: 35px; color: cornflowerblue;">  중고게시판 &nbsp;&nbsp;&nbsp;
        <c:if test="${loginMember!=null }">
        <a href="${path }/usedboard/usedboardList.do?memberId=${loginMember.memberId}" style="font-size: 20px; color: #964b00">내 중고게시판</a> <a style="font-size: 20px; color: #964b00;">/</a> 
        <a href="${path }/usedboard/usedboardMyPayment.do?memberId=${loginMember.memberId}" style="font-size: 20px; color: #964b00;">내 중고구매목록</a> 
        <c:if test="${loginMember.memberId=='admin' }"> 
        <a style="font-size: 20px; color: #964b00;">/</a> <a href="${path }/usedboard/usedboardSingoList.do" style="font-size: 20px; color: #964b00;">신고관리</a>
        </c:if>
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
        <div id="secondBorad" style="padding-left: 350px;">
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
                            <span id="ddssaa" style="font-size: 17px;">책제목 : ${b.usedboard_BookTitle } / 가격 : ${b.usedboard_Price }원</span>
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