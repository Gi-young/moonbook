<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/usedboard/usedboardInsert.css">

	<section id="content2">
		<div class="iscontainer">
			<form method="post" id="frm" action="${path}/usedboard/usedboardUpdateEnd.do?usedboard_No=${no}" enctype="multipart/form-data">
				<ul>
					<li class="title_input"><textarea name="usedboard_Title" id="subject" rows="1" maxlength="76" style="height: 26px;">${usedboard.usedboard_Title }</textarea></li>
					<br>
					<li>
						책 제목 : <input type="text" style="width: 500px; height: 20px" value="${usedboard.usedboard_BookTitle  }" disabled>
					</li>
					<br>
					<li>
						가격 : <input type="number" style="width: 500px; height: 20px" value="${usedboard.usedboard_Price  }" disabled> 원 
					</li>
					<br>
					<li>
						카테고리 : &nbsp; 
						<input type="checkbox" name="usedboard_Category" id="category0" value="한국고전소설" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("한국고전소설")?"checked":"" }</c:forEach>><label for="category0" class="">한국고전소설</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category1" value="세계문학" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("세계문학")?"checked":"" }</c:forEach>><label for="category1" class="">세계문학</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category2" value="세계고전" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("세계고전")?"checked":"" }</c:forEach>><label for="category2" class="">세계고전</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category3" value="청소년 문학" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("청소년 문학")?"checked":"" }</c:forEach>><label for="category3" class="">청소년 문학</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category4" value="한국그림책(0~3세)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("한국그림책(0~3세)")?"checked":"" }</c:forEach>><label for="category4" class="">한국그림책(0~3세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category5" value="외국그림책(0~3세)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("외국그림책(0~3세)")?"checked":"" }</c:forEach>><label for="category5" class="">외국그림책(0~3세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category6" value="한국그림책(4~7세)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("한국그림책(4~7세)")?"checked":"" }</c:forEach>><label for="category6" class="">한국그림책(4~7세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category7" value="외국그림책(4~7세)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("외국그림책(4~7세)")?"checked":"" }</c:forEach>><label for="category7" class="">외국그림책(4~7세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category8" value="세계 명작 동화(유아)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("세계 명작 동화(유아)")?"checked":"" }</c:forEach>><label for="category8" class="">세계 명작 동화(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category9" value="한국 전래 동화(유아)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("한국 전래 동화(유아)")?"checked":"" }</c:forEach>><label for="category9" class="">한국 전래 동화(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category10" value="국내 창작 동화(유아)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("국내 창작 동화(유아)")?"checked":"" }</c:forEach>><label for="category10" class="">국내 창작 동화(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category11" value="다른나라 그림책(유아)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("다른나라 그림책(유아)")?"checked":"" }</c:forEach>><label for="category11" class="">다른나라 그림책(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category12" value="어린이동화(초등1~2)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("어린이동화(초등1~2)")?"checked":"" }</c:forEach>><label for="category12" class="">어린이동화(초등1~2)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category13" value="어린이동화(초등3~4)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("어린이동화(초등3~4)")?"checked":"" }</c:forEach>><label for="category13" class="">어린이동화(초등3~4)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category14" value="어린이동화(초등5~6)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("어린이동화(초등5~6)")?"checked":"" }</c:forEach>><label for="category14" class="">어린이동화(초등5~6)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category15" value="어린이동화(공통)" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("어린이동화(공통)")?"checked":"" }</c:forEach>><label for="category15" class="">어린이동화(공통)</label>&nbsp;
					</li>
					<li>
						<div id="orifile">
							<c:forEach var="f" items="${usedboard.usedboardfiles }">
								<c:set var="ff" value="${ff+1 }"/>
								<span id="${ff }s" name="usedboardfile_Oriname">${usedboard.usedboardfiles[ff-1].usedboardfile_Oriname}</span><br>
								<img id="${ff }img" name="${ff }img" src="${path }/resources/upload/usedboard/${usedboard.usedboardfiles[ff-1].usedboardfile_Rename}" width="100px" height="100px"><a id="${ff }br"><br></a>
							</c:forEach>
						</div>
				    </li>
					<li><div id="image_container"></div><li>
					<li><textarea name="usedboard_Content" id="content" cols="100" rows="50" >${usedboard.usedboard_Content  }</textarea></li>
				</ul>
				<br>
				<hr>
				<br>
				<div class="btn">
				<input class="btnbtn" type="submit" value="변경하기" width="20" height="20" >
				<input class="btnbtn2" type="button" value="취소하기" width="20" height="20" onclick="fn_cancel();">
				</div>
			</form>
		</div>
	</section>

	<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<script>
		function checkOnlyOne(element) {
		  
		  const checkboxes = document.getElementsByName("usedboard_Category");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
		$(function(){
			CKEDITOR.replace("content");
		});
		const fn_cancel=()=>{
	
	  		const result=confirm("정말로 취소하시겠습니까?");
			if(result){
				location.assign('${path}/usedboard/usedboardView.do?no=${no}');			
			}	
	
		};
		function setThumbnail(event) { var reader = new FileReader(); reader.onload = function(event) { var img = document.createElement("img"); img.setAttribute("src", event.target.result); document.querySelector("div#image_container").appendChild(img); }; reader.readAsDataURL(event.target.files[0]); };
		
	</script>
	
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"></jsp:include>