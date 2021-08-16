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
					<li class="title_input"><textarea name="usedboard_Title" id="subject" rows="1" placeholder="제목을 입력해주세요." maxlength="76" style="height: 26px;"></textarea></li>
					<br>
					<li>
						책 제목 : <input type="text" name="usedboard_BookTitle" style="width: 500px; height: 20px">
					</li>
					<br>
					<li>
						가격 : <input type="number" name="usedboard_Price" style="width: 500px; height: 20px"> 원 
					</li>
					<br>
					<li>
						카테고리 : &nbsp; 
						<input type="checkbox" name="usedboard_Category" id="category0" value="한국고전소설"><label for="category0" class="">한국고전소설</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category1" value="세계문학"><label for="category1" class="">세계문학</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category2" value="세계고전"><label for="category2" class="">세계고전</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category3" value="청소년 문학"><label for="category3" class="">청소년 문학</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category4" value="한국그림책(0~3세)"><label for="category4" class="">한국그림책(0~3세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category5" value="외국그림책(0~3세)"><label for="category5" class="">외국그림책(0~3세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category6" value="한국그림책(4~7세)"><label for="category6" class="">한국그림책(4~7세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category7" value="외국그림책(4~7세)"><label for="category7" class="">외국그림책(4~7세)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category8" value="세계 명작 동화(유아)"><label for="category8" class="">세계 명작 동화(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category9" value="한국 전래 동화(유아)"><label for="category9" class="">한국 전래 동화(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category10" value="국내 창작 동화(유아)"><label for="category10" class="">국내 창작 동화(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category11" value="다른나라 그림책(유아)"><label for="category11" class="">다른나라 그림책(유아)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category12" value="어린이동화(초등1~2)"><label for="category12" class="">어린이동화(초등1~2)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category13" value="어린이동화(초등3~4)"><label for="category13" class="">어린이동화(초등3~4)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category14" value="어린이동화(초등5~6)"><label for="category14" class="">어린이동화(초등5~6)</label>&nbsp;
						<input type="checkbox" name="usedboard_Category" id="category15" value="어린이동화(공통)"><label for="category15" class="">어린이동화(공통)</label>&nbsp;
					</li>
					<li>
						<div id="attachFileDiv">
						<input type="button" value="파일 추가" onclick="attachFile.add()" style="margin:8px;">
						</div>
				    </li>
					<li><div id="image_container"></div><li>
					<li><textarea name="usedboard_Content" id="content" cols="100" rows="50" ></textarea></li>
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

	<script src="//cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
	<script>
		attachFile = {
	        idx:0,
	        add:function(){ // 파일필드 추가
	            var o = this;
	            var idx = o.idx;
	
	            var div = document.createElement('div');
	            div.style.marginTop = '3px';
	            div.style.marginBottom = '3px';
	            div.id = 'file' + o.idx;
	
	            var dv = document.createElement('dv');
	            dv.style.marginTop = '3px';
	            dv.style.marginBottom = '3px';
	            dv.id = 'dv' + o.idx;
	
	            var file = document.all ? document.createElement('<input name="files">') : document.createElement('input');
	            file.type = 'file';
	            file.name = 'upFile';
	            file.size = '40';
	            file.id = 'fileField' + o.idx;
	            file.onchange = function(){o.prev(this,'dv'+idx)};
	
	            var btn = document.createElement('input');
	            btn.type = 'button';
	            btn.value = '삭제';
	            btn.onclick = function(){o.del(idx)};
	            btn.style.marginLeft = '5px';
	
	
	
	            div.appendChild(file);
	            div.appendChild(btn);
	            document.getElementById('attachFileDiv').appendChild(div);
	                        document.getElementById('attachFileDiv').appendChild(dv);
	
	            o.idx++;
	        },
	        del:function(idx){ // 파일필드 삭제
	            if(document.getElementById('fileField' + idx).value != '' && !confirm('삭제 하시겠습니까?')){
	                return;
	            }
	            document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));
	                        document.getElementById('attachFileDiv').removeChild(document.getElementById('dv' + idx));
	        },
	        prev:function(targetObj,View_area){ // 이미지 미리보기
	            var preview = document.getElementById(View_area); //div id
	           var ua = window.navigator.userAgent;
	  	//ie일때(IE8 이하에서만 작동)
	    if (ua.indexOf("MSIE") > -1) {
	        targetObj.select();
	        try {
	            var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
	            var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
	
	
	            if (ie_preview_error) {
	                preview.removeChild(ie_preview_error); //error가 있으면 delete
	            }
	
	            var img = document.getElementById(View_area); //이미지가 뿌려질 곳
	
	            //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
	            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
	        } catch (e) {
	            if (!document.getElementById("ie_preview_error_" + View_area)) {
	                var info = document.createElement("<p>");
	                info.id = "ie_preview_error_" + View_area;
	                info.innerHTML = e.name;
	                preview.insertBefore(info, null);
	            }
	        }
	  	//ie가 아닐때(크롬, 사파리, FF)
	    } else {
	        var files = targetObj.files;
	        for ( var i = 0; i < files.length; i++) {
	            var file = files[i];
	            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
	            var prevImg = document.getElementById("prev_" + View_area);
	            if (!file.type.match(imageType)){
	                preview.removeChild(prevImg);
	                continue;
	                }
	             //이전에 미리보기가 있다면 삭제
	            if (prevImg) {
	                preview.removeChild(prevImg);
	            }
	            var img = document.createElement("img");
	            img.id = "prev_" + View_area;
	            img.classList.add("obj");
	            img.file = file;
	            img.style.width = '100px';
	            img.style.height = '100px';
	            preview.appendChild(img);
	            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
	                var reader = new FileReader();
	                reader.onloadend = (function(aImg) {
	                    return function(e) {
	                        aImg.src = e.target.result;
	                    };
	                })(img);
	                reader.readAsDataURL(file);
	            } else { // safari is not supported FileReader
	                //alert('not supported FileReader');
	                if (!document.getElementById("sfr_preview_error_"
	                        + View_area)) {
	                    var info = document.createElement("p");
	                    info.id = "sfr_preview_error_" + View_area;
	                    info.innerHTML = "not supported FileReader";
	                    preview.insertBefore(info, null);
	                }
	            }
	        }
	    }
	
	        }
	    }
	
		$(function(){
			CKEDITOR.replace("content");
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