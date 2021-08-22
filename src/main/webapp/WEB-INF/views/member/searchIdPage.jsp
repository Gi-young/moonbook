<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/login/reset.css">
<link rel="stylesheet"
	href="${path }/resources/css/login/searchIdPage.css">
</head>
<body>	
	<div class="searchId-container">
		<p class="searchMyInfo-title2">내 정보로 아이디 간편 찾기</p>
		
		<div class="searchIdType">
			<input class="howIdSearch" type="radio" name="searchHow" id="phone" value="phone" checked><label for="phone">휴대폰</label>
			<!-- <input class="howIdSearch2" type="radio" name="searchHow" id="email" value="email"><label for="email">이메일</label> -->
		</div>
		
		<div class="search1Ver-container">
			<form action="${path}/member/searchId.do" method="post">
				<table class="search1Ver">
					<tr>
						<th class="search-Th">
							<label>이름</label>
						</th>
						<td><input type="text" name="memberName"></td>
					</tr>
					
					<tr>
						<th class="search-Th">
							<label>휴대폰번호</label>
						</th>
						<td><input type="text" name="memberPhone" placeholder="-없이"></td>
					</tr>
				</table>
				<div class="search1VerBtns">
					<input type="submit" value="확인"/>
					<button onclick="fn_close();">닫기</button>
				</div>
			</form>
		</div>
		
		<div class="search2Ver-container">
			<form action="${path}/member/searchId2.do">
			<table class="searchVer2">
				<tr>
					<th class="search-Th">
						<label>이름</label>
					</th>
					<td><input type="text" name="memberName"></td>
				</tr>
				
				<tr>
					<th class="search-Th">
						<label>이메일</label>
					</th>
					<td><input type="text" name="memberEmail" placeholder=""></td>
				</tr>
				
			</table>
			<div class="search1VerBtns">
				<input type="submit" value="확인"/>
				<button onclick="fn_close();">닫기</button>
			</div>
			</form>
		</div>
		
		<div class="searchIdInfo">
		<p>
			※ 매장 혹은 제휴 채널에서 기가입한 고객은 '회원가입>기존 매장/제휴 회원'에서 아이디 생성 후, 이용해 주세요.
		</p>
		
		</div>
		
	</div>

</body>
</html>

<script>
	$("input[name=searchHow]").click(e=>{
		$("input[name=searchHow]").each((i,v)=>{
			if(v.checked=="stockBookT"){
				if(v.value=="phone"){
					$(".search1Ver-container").css("display","block");
					$(".search2Ver-container").css("display","none");
				}else{
					$(".search2Ver-container").css("display","block");
					$(".search1Ver-container").css("display","none");
				}
			}
		})
	})
	
	function fn_close(){
		self.close();
	}
	
	
	
</script>