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
			<form method="post" id="frm" action="${path}/usedboard/usedboardInsertEnd.do" enctype="multipart/form-data">
				<ul>
					<li class="title_input" style="border: 1px solid hotpink;"><textarea name="usedboard_Title" id="subject" rows="1" placeholder="제목을 입력해주세요." maxlength="76" style="height: 26px;"></textarea></li>
					<br>
					<li style="text-align: center;">
						책 제목 : <input type="text" name="usedboard_BookTitle" style="width: 500px; height: 20px">
					</li>
					<br>
					<li style="text-align: center;">
						가격 : <input type="number" name="usedboard_Price" style="width: 500px; height: 20px"> 원 
					</li>
					<br>
					<li style="text-align: center;">
						<a style="font-size: 20px;font-weight: bold; color: brown">카테고리</a><br><br> 
						<input style="margin-left: 60px" type="checkbox" name="usedboard_Category" id="category0" value="한국고전소설" onclick='checkOnlyOne(this)'><label for="category0" class="">한국고전소설</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category1" value="세계문학" onclick='checkOnlyOne(this)'><label for="category1" class="">세계문학</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category2" value="세계고전" onclick='checkOnlyOne(this)'><label for="category2" class="">세계고전</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category3" value="청소년 문학" onclick='checkOnlyOne(this)'><label for="category3" class="">청소년 문학</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category4" value="한국그림책(0~3세)" onclick='checkOnlyOne(this)'><label for="category4" class="">한국그림책(0~3세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category5" value="외국그림책(0~3세)" onclick='checkOnlyOne(this)'><label for="category5" class="">외국그림책(0~3세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category6" value="한국그림책(4~7세)" onclick='checkOnlyOne(this)'><label for="category6" class="">한국그림책(4~7세)</label>&nbsp;<br><br>
						<input type="checkbox" name="usedboard_Category" id="category7" value="외국그림책(4~7세)" onclick='checkOnlyOne(this)'><label for="category7" class="">외국그림책(4~7세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category8" value="세계 명작 동화(유아)" onclick='checkOnlyOne(this)'><label for="category8" class="">세계 명작 동화(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category9" value="한국 전래 동화(유아)" onclick='checkOnlyOne(this)'><label for="category9" class="">한국 전래 동화(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category10" value="국내 창작 동화(유아)" onclick='checkOnlyOne(this)'><label for="category10" class="">국내 창작 동화(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category11" value="다른나라 그림책(유아)" onclick='checkOnlyOne(this)'><label for="category11" class="">다른나라 그림책(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category12" value="어린이동화(초등1~2)" onclick='checkOnlyOne(this)'><label for="category12" class="">어린이동화(초등1~2)</label>&nbsp;<br><br>
						<input style="margin-left: 250px" type="checkbox" name="usedboard_Category" id="category13" value="어린이동화(초등3~4)" onclick='checkOnlyOne(this)'><label for="category13" class="">어린이동화(초등3~4)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category14" value="어린이동화(초등5~6)" onclick='checkOnlyOne(this)'><label for="category14" class="">어린이동화(초등5~6)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category15" value="어린이동화(공통)" onclick='checkOnlyOne(this)'><label for="category15" class="">어린이동화(공통)</label>&nbsp;
					</li>
					<br>
					<div class="image-container" style=" text-align: center;">
					    <img style="width: 500px; height: 400px; border: 1px solid black;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
					    <input style="display: block;" name="upFile" type="file" id="input-image" accept="image/gif,image/jpeg,image/png" onchange="fileCheck(this)">
					</div>
					<br>
					<li><textarea name="usedboard_Content" id="content"></textarea></li>
				</ul>
				<br>
				<hr>
				<br>
				<div class="btn">
				<input type="hidden" name="member_Id" value="${loginMember.memberId }">
				<input class="btnbtn" type="submit" value="등록하기" width="20" height="20">
				<input class="btnbtn2" type="button" value="취소하기" width="20" height="20" onclick="fn_cancel();">
				</div>
			</form>
		</div>	
	</section>
	<script src="${path }/resources/ckeditor/ckeditor.js"></script>
	<script>
		CKEDITOR.replace('content',{filebrowserUploadUrl:'${path}/usedboard/fileUpload.do?member_Id=${loginMember.memberId}'});
	</script>
	<script>
		var checkimg=1;
		function fileCheck(obj) {
			pathpoint=obj.value.lastIndexOf('.');
			filepoint=obj.value.substring(pathpoint+1,obj.length);
			filetype=filepoint.toLowerCase();
			if(filetype=='jpg'||filetype=='gif'||filetype=='png'||filetype=='jpeg'||filetype=='bmp'){
				//정상적인 이미지
				checkimg=1;
			}else{
				alert('이미지 파일만 선택할 수 있습니다.');
				parentObj=obj.parentNode;
				node=parentObj.replaceChild(obj.cloneNode(true),obj);
				document.getElementById("input-image").value = "";
				document.getElementById("input-image").select(); 
				document.selection.clear();  
				checkimg=0;
				return false;
			}
			if(filetype=='bmp'){
				upload=confirm('BMP파일은 웹상에서 사용하기엔 적절한 이미지 포맷이 아닙니다.\n그래도 계속 하시겠습니까?');
				if(!upload)return false;
			}
		}
		function checkOnlyOne(element) {
		  
		  const checkboxes = document.getElementsByName("usedboard_Category");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
		function readImage(input) {
			if(checkimg==1){
				// 인풋 태그에 파일이 있는 경우
			    if(input.files && input.files[0]) {
			        // 이미지 파일인지 검사 (생략)
			        // FileReader 인스턴스 생성
			        const reader = new FileReader()
			        // 이미지가 로드가 된 경우
			        reader.onload = e => {
			            const previewImage = document.getElementById("preview-image")
			            previewImage.src = e.target.result
			        }
			        // reader가 이미지 읽도록 하기
			        reader.readAsDataURL(input.files[0])
			    }else{
			    	document.getElementById("preview-image").src = "https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image";
			    }
			}
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("input-image")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		})
		
		$(function(){
			$("#frm").submit(function(){
				if($("#subject").val()==""){
					alert("제목을 입력하세요...");
					return false;
				}
				if(CKEDITOR.instances.content.getData()==""){
					alert("내용을 입력하세요...");
					return false;
				}
				return true;
			})
		});
		const fn_cancel=()=>{
	
	  		const result=confirm("정말로 취소하시겠습니까?");
			if(result){
				location.assign('${path}/usedboard/usedboardList.do');			
			}	
	
		};
		function setThumbnail(event) { var reader = new FileReader(); reader.onload = function(event) { var img = document.createElement("img"); img.setAttribute("src", event.target.result); document.querySelector("div#image_container").appendChild(img); }; reader.readAsDataURL(event.target.files[0]); };
	</script>
	
<jsp:include page="/WEB-INF/views/common/newFooter.jsp"></jsp:include>