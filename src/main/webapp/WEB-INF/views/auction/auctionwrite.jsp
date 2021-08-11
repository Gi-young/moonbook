<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>  

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
   <jsp:param name="" value=""/>
</jsp:include>

	<link rel="stylesheet" href="${path}/resources/css/auction/auctionwrite.css">
    
    <div id="wrap">
		<div id="container">
		    <div>
		         <h2>경매 등록하기</h2>
		    </div>
		
			<form action="${path }/auction/auctionwriteEnd.do" method="post" enctype="multipart/form-data" onsubmit="return check();">
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
			                        <option value="음반">음반</option>
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
			                    <input type="text" name="auctionName" required>
			                </td>
			            </tr>
			            <tr>
			                      <th>물품크기</th>
			                        <td>
			                        <input type="text" name="auctionSize" required> <span>크기/쪽 첨부</span>
			                    </td>
			            </tr>
			            <tr>
			                      <th>보관상태</th>
			                        <td>
			                       <input type="radio" name="auctionQuality" value="상" required>상
			                       <input type="radio" name="auctionQuality" value="중상">중상
			                       <input type="radio" name="auctionQuality" value="중">중
			                       <input type="radio" name="auctionQuality" value="중하">중하
			                       <input type="radio" name="auctionQuality" value="하">하
			                    </td>
			            </tr>
			            <tr>
			                <tr>
			                    <th>경매 기간</th>
			                    <td> 
			                    <input type="date" name="endDate" required> 까지
			                </td>
			            </tr>
			            <tr>
			                <tr>
			                    <th>시작가</th>
			                    <td>
			                    <input type="number" value="0" name="startPrice" required>
			                </td>
			            </tr>
			            <tr>
			                <tr>
			                    <th>즉시 구매가</th>
			                    <td>
			                    <input type="number" value="0" name="buyNow" required>
			                </td>
			            </tr>
			            <tr>
			                <tr>
			                    <th>응찰 단위</th>
			                    <td>
			                    <input type="number" value="0" step="1000" name="priceUnit" required> <span>1000원 단위로 입력해주세요</span>
			             
			                </td>
			            </tr>
			            <tr>
			                <tr>
			                    <th>물품 설명</th>
			                    <td>
			                    <textarea style="width: 810px; height: 240px;" name="auctionEx" required></textarea>
			                </td>
			            </tr>
			            <tr>
			                <tr>
			                    <th>대표 이미지</th>
			                    <td>
			                    <input type="file" name="upfile" required> <span id="img_add">추가</span>
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
	
		//이미지 추가 삭제 기능
		$(document).on("click","#img_del",e=>{
		    $(e.target).parent().parent().remove();
		})
		
		$("#img_add").click(e=>{
		    if($("input[name=upfile]").length>3){
		        alert("최대 3개까지 등록가능합니다");
		        return;
		    }
		    let tr=$("<tr>")
		    let th=$("<th>").text("추가된 이미지")
		    let td=$("<td>");
		    let span=$("<span>").text("삭제").attr({
		        id:"img_del"
		    })
		    let inputfile=$("<input>").attr({
		        type:"file",
		        name:"upfile"
		    })
		    tr.append(th).append(td.append(inputfile).append(span))           
		    $(e.target).parent().parent().parent().append(tr);
		})
                
		const check=()=>{
			let endDate= new Date($("input[name=endDate]").val());
			let sysdate = new Date();
			if(endDate<sysdate){
			    alert("적어도 하루이상의 날짜의 선택해주세요")
			        return false;
			}
			
			if(parseInt($("input[name=startPrice]").val())>parseInt($("input[name=buyNow]").val())){
			    alert("시작가는 즉시 구매가 보다 높을수 없습니다");
			    return false;
			}else if(parseInt($("input[name=buyNow]").val())-parseInt($("input[name=startPrice]").val()) < parseInt($("input[name=priceUnit]").val())){
			    alert("응찰가격은 즉시 구매가 보다 높을 수 없습니다");
			    return false;
			}
		}
	</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value=""/>
</jsp:include>