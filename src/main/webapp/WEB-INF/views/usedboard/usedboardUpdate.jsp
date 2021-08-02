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
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
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
					<input type="checkbox" name="usedboard_Category" id="category0" value="소설" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("소설")?"checked":"" }</c:forEach>><label for="category0" class="">소설</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category1" value="시/에세이" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("시/에세이")?"checked":"" }</c:forEach>><label for="category1" class="">시/에세이</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category2" value="경제/경영" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("경제/경영")?"checked":"" }</c:forEach>><label for="category2" class="">경제/경영</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category3" value="자기계발" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("자기계발")?"checked":"" }</c:forEach>><label for="category3" class="">자기계발</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category4" value="인문" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("인문")?"checked":"" }</c:forEach>><label for="category4" class="">인문</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category5" value="역사문화" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("역사문화")?"checked":"" }</c:forEach>><label for="category5" class="">역사문화</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category6" value="종교" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("종교")?"checked":"" }</c:forEach>><label for="category6" class="">종교</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category7" value="정치/사회" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("정치/사회")?"checked":"" }</c:forEach>><label for="category7" class="">정치/사회</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category8" value="예술/대중문화" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("예술/대중문화")?"checked":"" }</c:forEach>><label for="category8" class="">예술/대중문화</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category9" value="과학" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("과학")?"checked":"" }</c:forEach>><label for="category9" class="">과학</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category10" value="기술/공학" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("기술/공학")?"checked":"" }</c:forEach>><label for="category10" class="">기술/공학</label>&nbsp;<br>
					<input type="checkbox" name="usedboard_Category" id="category11" value="컴퓨터/IT" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("컴퓨터/IT")?"checked":"" }</c:forEach>><label for="category11" class="">컴퓨터/IT</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category12" value="초등학습" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("초등학습")?"checked":"" }</c:forEach>><label for="category12" class="">초등학습</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category13" value="중/고등학습" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("중/고등학습")?"checked":"" }</c:forEach>><label for="category13" class="">중/고등학습</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category14" value="대학교재" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("대학교재")?"checked":"" }</c:forEach>><label for="category14" class="">대학교재</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category15" value="취업/수험서" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("취업/수험서")?"checked":"" }</c:forEach>><label for="category15" class="">취업/수험서</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category16" value="외국어" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("외국어")?"checked":"" }</c:forEach>><label for="category16" class="">외국어</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category17" value="동화" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("동화")?"checked":"" }</c:forEach>><label for="category17" class="">동화</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category18" value="아동" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("아동")?"checked":"" }</c:forEach>><label for="category18" class="">아동</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category19" value="가정생활" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("가정생활")?"checked":"" }</c:forEach>><label for="category19" class="">가정생활</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category20" value="건강" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("건강")?"checked":"" }</c:forEach>><label for="category20" class="">건강</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category21" value="여행" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("여행")?"checked":"" }</c:forEach>><label for="category21" class="">여행</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category22" value="요리" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("요리")?"checked":"" }</c:forEach>><label for="category22" class="">요리</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category23" value="스포츠" <c:set var="i" value="${i=0 }"/><c:forEach var="b" items="${usedboard.usedboard_Category}"><c:set var="i" value="${i+1 }"/> ${usedboard.usedboard_Category[i-1].contains("스포츠")?"checked":"" }</c:forEach>><label for="category23" class="">스포츠</label>&nbsp;<br>
					<input type="checkbox" name="usedboard_Category" id="category24" value="잡지" <c:set var="i" value="${i=0 }"/><c:forEach var="b" items="${usedboard.usedboard_Category}"><c:set var="i" value="${i+1 }"/> ${usedboard.usedboard_Category[i-1].contains("잡지")?"checked":"" }</c:forEach>><label for="category24" class="">잡지</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category25" value="만화" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("만화")?"checked":"" }</c:forEach>><label for="category25" class="">만화</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category26" value="사전" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("사전")?"checked":"" }</c:forEach>><label for="category26" class="">사전</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category27" value="외서" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("외서")?"checked":"" }</c:forEach>><label for="category27" class="">외서</label>&nbsp;
					<input type="checkbox" name="usedboard_Category" id="category28" value="일서" <c:set var="i" value="${i=0 }"/> <c:forEach var="b" items="${usedboard.usedboard_Category}"> <c:set var="i" value="${i+1 }"/>  ${usedboard.usedboard_Category[i-1].contains("일서")?"checked":"" }</c:forEach>><label for="category28" class="">일서</label>&nbsp;
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

<script>
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