<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>  


<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/auction/auction.css">
    <div id="wrap">
    <div id="container">

        <div>
             <h2>경매 등록하기</h2>
        </div>

       <form action="${path }/auction/auctionwriteEnd.do" method="post" enctype="multipart/form-data">
        <div class="auctionwrite">
                <table>
                    <tr>
                        <th>판매자</th>
                        <td>
               				<input type="text" value="${loginMember.memberId }" readonly="readonly" name="memberId">
                        </td>
                    </tr>
                    <tr>
                        <th>카태고리 선택</th>
                        <td>
                            <select name="level1" id="level1">
                            	<option value="none">===선택===</option>
                                <option value="도서">도서</option>
                                <option value="문구">문구</option>
                                <option value="기타">기타</option>
                            </select>
                 
                             <select name="level2" id="level2" >
                           		<option value="none">===선택===</option>
                            </select>
                            
                            <input type="hidden" name="auctioncateCode" value="">
                        </td>
                    </tr>
                    <tr>
                        <th>물품명</th>
                        <td>
                            <input type="text" name="auctionName">
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <th>물품크기</th>
                            <td>
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <th>현상태</th>
                            <td>
                            <textarea style="width: 810px; height: 100px;" name=""></textarea>
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <th>경매 기간</th>
                            <td> 
                            <input type="date" name="endDate"> 까지
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <th>시작가</th>
                            <td>
                            <input type="number" value="0" name="startPrice">
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <th>즉시 구매가</th>
                            <td>
                            <input type="number" value="0" name="buyNow">
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <th>응찰 단위</th>
                            <td>
                            <input type="number" value="0" step="1000" name="priceUnit"> <span>1000원 단위로 입력해주세요</span>
                     
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <th>물품 설명</th>
                            <td>
                            <textarea style="width: 810px; height: 240px;" name="auctionEx"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <tr>
                            <th>물품 사진</th>
                            <td>
                            <input type="file" name="upfile"> <button>추가</button>
                        </td>
                    </tr>
                </table>
                
            
        </div>

        <div class="auctionwrite_submit">
            <input type="submit" value="등록하기">
        </div>
     </form>
    </div>
</div>
<script>
		
		
		 $("#level1").change((e)=>{
		     let catename=$(e.target).val();
		     $("#level2").html("").append($("<option>").text("===선택==="))	    
		     $.ajax({
		    	 url:"${path}/auction/auctioncate.do",
		    	 type:"get",
		    	 data:{
		    		 catename:catename
		    	 },
		    	 success:data=>{
		    		 console.log(data);
		    		 for(var i=0;i<data.length;i++){     
		    			$("#level2").append($("<option>").text(data[i].auctioncateFirst).attr("value",data[i].auctioncateFirst))
		    		 }	 
		    	 }
		     })
		 })
		 
	$(function(){
		$("#level2").change(e=>{
			 	const level1=$("#level1").val();
			 	const level2=$("#level2").val();
				$.get("${path}/auction/auctioncateCode.do?acutioncateName="+level1+"&acutioncateFrist="+level2,data=>{
					$("input[name=auctioncateCode]").val(data.auctioncateCode)
					
				});
			
		});
	})
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
<jsp:param name="" value=""/>
</jsp:include>