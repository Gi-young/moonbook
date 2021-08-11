<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="auctioncateFirst" value="${auctionlist[0].auctioncate[0].auctioncateFirst }"/>

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value=""/>
</jsp:include>

	<link rel="stylesheet" type="text/css" href="${path}/resources/css/auction/auctionlist.css">

    <div id="wrap">
	    <div id="container">
	        <div class="auction_cate">
	            <p><span>${param["auctioncateName"]}</span> > <span>${param["auctioncateFrist"] }</span></p>
	        </div>
	        
	        <div class="auctionlist_level2">
				<c:forEach items="${auctioncate }" var="a">         
					<c:if test="${a.auctioncateName eq param['auctioncateName']}">
						<div>
							<a href="${path }/auction/auctionlist?auctioncateFrist=${a.auctioncateFirst}&auctioncateName=${a.auctioncateName}">${a.auctioncateFirst }</a>
						</div>
					</c:if>
				</c:forEach>
	        </div>
	        
	        <div id="auction_serach_name">
	            <div>
	                <form action="${path }/auction/auctionlist.do">
	                	<input type="hidden" value="${auctioncateFirst}" name="auctioncateFrist">
	                    <select name="type" id="">
	                        <option value="auction_name">상품명</option>
	                    </select>
	                    <input type="text" name="keyword">
	                    <input type="submit" value="검색">
	                </form>
	            </div>
	        </div>
	        
			<div class="auctionlist">
	            <table>
		            <tr>
		            	<th colspan="7" style="text-align:center;">*해당 컬럼명을 클릭하면 내림차순으로 볼수 있습니다.(시작가,등록일,경매 종료일)</th>
		            </tr>
	                <tr>
	                    <th>이미지</th>
	                    <th style="width: 300px;">물품이름</th>
	                    <th class="desc">시작가<span></span><input type="hidden" value="start_price"></th>
	                    <th>입찰자수</th>
	                    <th>현재 입찰가</th>
	                    <th class="desc">등록일 <input type="hidden" value="start_date"></th>
	                    <th class="desc">경매 종료일 <input type="hidden" value="end_date"></th>
	
	                </tr>
					<c:forEach items="${auctionlist }" var="a">
						<tr>
							<td class="auctionlist_img">
								<a href="${path }/auction/acutionview?auctionNo=${a.auctionNo}">
						  	 		<img src="${path }/resources/auction/images/${a.auctionImg[0]}" alt="리스트사진" width="150px;" height="100px;">  	 	
						   		</a>
							</td>
							<td class="auctionlist_title">
								<a href="${path }/auction/acutionview?auctionNo=${a.auctionNo}">${a.auctionName } </a>
							</td>
							<td class="auctionlist_price">${a.startPrice }</td>
							<td class="auctionlist_person">${a.auctionbid.size() }명</td>
							<td class="auctionlist_person">${a.auctionbid.size()==0?"0":a.auctionbid[0].bidPrice} </td>
							<td>${a.startDate }</td>
							<td>${a.endDate }</td>
						</tr>
					</c:forEach>
	            </table>
	            
	            <div class="pagebar">${pageBar }</div>
	
	        </div>
		</div>
	</div>

	<script>
		$(".desc").click(e=>{
			console.log($(e.target))
			console.log($(e.target).children("input[type=hidden]").val())
			
			let value=$(e.target).children("input[type=hidden]").val();
			location.replace('${path}/auction/auctionlist?auctioncateFrist=${param["auctioncateFrist"] }&auctioncateName=${param["auctioncateName"]}&desc='+value)
		})
	</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value=""/>
</jsp:include>