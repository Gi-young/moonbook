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
	    <%-- <div class="side-menu">
            <center>
            	<a href="${path }/usedboard/usedboardList.do">카테고리</a>
            </center>
            
            <div>
                <ul id="ul1">
                	<li>-고전/문학-</li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='한국고전소설'">한국고전소설</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='세계문학'">세계문학</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='세계고전'">세계고전</a>
                    </li>
                </ul>
                
                <ul id="ul1">
                	<li>-청소년-</li>
                    <li><a href="${path}/usedboard/usedboardList.do?catagory='청소년문학'">청소년문학</a></li>
                </ul>
                
                <ul id="ul1">
                	<li>-유아-</li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='한국그림책(0~3세)'">한국그림책(0~3세)</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='외국그림책(0~3세)'">외국그림책(0~3세)</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='한국그림책(4~7세)'">한국그림책(4~7세)</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='외국그림책(4~7세)'">외국그림책(4~7세)</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='세계명작동화'">세계명작동화</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='한국전래동화'">한국전래동화</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='국내창작동화'">국내창작동화</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='다른나라그림책'">다른나라그림책</a>
                    </li>
                </ul> 
                
                <ul id="ul1">
                	<li>-어린이-</li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='어린이동화(초1~2학년)'">어린이동화(초1~2학년)</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='어린이동화(초3~4학년)'">어린이동화(초3~4학년)</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='어린이동화(초5~6학년)'">어린이동화(초5~6학년)</a>
                    </li>
                    <li>
                    	<a href="${path}/usedboard/usedboardList.do?catagory='스포츠'">어린이동화(공통)</a>
                    </li>
                </ul>
            </div>
	    </div> --%>
	    
	    <div class="used-board-container">
	        <div class="upper-board">
	        	<p id="titi">중고게시판</p>
	        	
	        	<c:if test="${loginMember!=null }">
		        	<div class="upper-menu">
		        		<a href="${path }/usedboard/usedboardList.do?memberId=${loginMember.memberId}">내 중고게시판</a>
				        <a href="${path }/usedboard/usedboardMyPayment.do?memberId=${loginMember.memberId}">내 중고구매목록</a> 
				        <a href="${path }/usedboard/usedboardInsert.do" id="insertborad">거래 등록</a>
				        
				        <c:if test="${loginMember.memberId=='admin' }"> 
				        	<a href="${path }/usedboard/usedboardSingoList.do">신고관리</a>
				        </c:if>
		        	</div>
		        </c:if>
	        </div>
	        
	        <div class="searchBox">
				<div>
					<select name="searchType" id="searchType" onchange="typeChange()">
						<option value="title">제목</option>
						<option value="bookTitle">책이름</option>
						<option value="memberid">아이디</option>
						<option value="topPrice">가격(이상)</option>
						<option value="botPrice">가격(이하)</option>
					</select>
				</div>
				
				<div>
					<select name="searchCategory" id="searchCategory"></select>
				</div>
				
				<div class="keyword">
					<input type="text" name="keyword" id="keyword">
				</div>
				
				<div class="searchBtn">
					<button name="btnSearch" id="btnSearch">검색</button>
				</div>
			</div>
	        
	        <c:if test="${list.isEmpty() }">
		        <div class="secondBoard">
		            <div class="side">
		            <hr>
		            <center><h1>물품이 없습니다.</h1></center>
		            </div>
	            </div>
	        </c:if>
	        
	        <c:if test="${list != null }">
		        <c:forEach var="b" items="${list }">
		        <c:set var="i" value="${i=0 }"/>
			        <div class="secondBoard">
			            <div class="side">
			            	<div class="aaa">
			                    <a href="${path }/usedboard/usedboardView.do?no=${b.usedboard_No }">
			                        <div class="artice">
			                        <div class="imgdivback">
			                        <c:forEach var="d" items="${b.usedboardfiles }">
			                             <c:set var="i" value="${i+1 }"/>
			                             
			                             <c:if test="${b.usedboardfiles[i-1].memberId==null }">
			                             
				                            <img src="${path }/resources/upload/usedboard/${b.usedboardfiles[i-1].usedboardfile_Rename}" onerror="" >
				                        
			                             </c:if>
			                             </c:forEach></div>
				                    	
				                        
				                        <div class="used-board-content">
				                            <span class="used-item-title">${b.usedboard_Title }</span>
					                        
					                        <span class="used-item-category">분류 : 
					                            <c:if test="${b.usedboard_Category != '' }">
													<c:forEach var="l" items="${b.usedboard_Category }" varStatus="vs">
														${l}
													</c:forEach>
												</c:if>
				                            </span>
					                        
				                            <span id="ddssaa">책제목 : ${b.usedboard_BookTitle }</span>
				                     
				                     		<span>가격 : ${b.usedboard_Price }원</span>
				                     
				                            <span class="used-item-info">
				                                <span class="username">
				                                    ${b.member_Id }
				                                    ||
				                                </span>
				                                <span>
				                                    ${b.usedboard_Date }
				                                    ||
				                                </span> 
				                                <c:if test="${b.usedboard_State == 'y' }">
													<span style="color: red;">
				                                    거래중 
				                                	</span>
												</c:if>
				                                <c:if test="${b.usedboard_State != 'y' }">
													<span style="color: blue;">
				                                    거래완료
				                                	</span>
												</c:if>	
												<c:if test="${b.usedboard_State == '1' }">
				                                	<c:if test="${b.member_Id == loginMember.memberId }">
				                                		<span> || </span>
				                                		<span> 배송확인중 </span>
				                                		<span> || </span>
				                                		<button onclick="confirmDelivery(event,'${b.usedboard_No }','${loginMember.memberId }');">배송확인</button>
				                                	</c:if>
												</c:if>
												<c:if test="${b.usedboard_State == '2' }">
				                                	<c:if test="${b.member_Id == loginMember.memberId }">
				                                		<span> || </span>
				                                		<span> 배송중 </span>
				                                	</c:if>
												</c:if>	
												<c:if test="${b.usedboard_State == '3' }">
				                                	<c:if test="${b.member_Id == loginMember.memberId }">
				                                		<span> || </span>
				                                		<span> 배송완료 </span>
				                                	</c:if>
												</c:if>	
			                            	</span>
		                            	</div>
		                            	
	                        		</div>
		                        </a>
		                        
		                    </div>
		                </div>
		            </div>
		        </c:forEach>
	        </c:if>
	        
	        <div class="pageBar">${pageBar }</div>
        </div>
	</section>

	<script>
		window.onload = function() {
			getBookCategory();
		}
	
		function getBookCategory() {
			$.ajax({
				url: "${path}/ebook/getBookCategory.do",
				type: "GET",
				success: data => {
					console.log(data);
					
					let searchCategory = document.getElementById("searchCategory");
					
					data.forEach((v, i) => {
						let option = document.createElement("option");
						option.value = v.CATEGORY_NAME;
						option.innerText = v.CATEGORY_NAME;
						
						searchCategory.appendChild(option);
					});
				}
			});
		}
	
		function confirmDelivery(event, usedboardNo, memberId) {
			event.preventDefault();
			location.assign('${path}/usedboard/usedboardPay1.do?no=' + usedboardNo + '&memberId=' + memberId);
		}
	
		function typeChange() {
			var searchType=$('#searchType').val();
			if(searchType=="title"||searchType=="bookTitle"||searchType=="memberid"){
				$('#keyword').prop("type", "text")
			}else{
				$('#keyword').prop("type", "number")
			}
		}
		
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			var keyword=$('#keyword').val();
			var searchType=$('#searchType').val();
			var catagory=$('#searchCategory').val();
			var url = "${path}/usedboard/usedboardList.do";
			url = url + "?searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			url = url + "&catagory=" + catagory;
			if(keyword.replace(/(\s*)/g,"")==null||keyword.replace(/(\s*)/g,"")==""){
				alert("값을 입력해주세요");
			}else{
				location.href = url;
			}
		});	
	</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp"></jsp:include>