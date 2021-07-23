<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 생성</title>
<script>
	funtion submitAddForm(form){
		form.title.value=form.title.value.trim();
		
		if(form.title.value.length == 0){
			alert('채팅방 이름을 입력해주세요.');
			form.title.focus();
			
			return false;
		}
	}
	
	funtion submitAddForm(form){
		form.passwd.value=form.passwd.value.trim();
		
		if(form.title.value.length == 0){
			alert('비밀번호를 입력해주세요.');
			form.passwd.focus();
			return false;
		}
		
	funtion submitAddForm(form){
		form.passwd.value=form.passwd.value.trim();
			
		if(form.passwd.value != form.passwdConfirm.value){
			alert('비밀번호 확인이 일치하지 않습니다.');
			form.passwd.focus();
			return false;
	}
		form.submit();
	}
</script>
<style>
.con{
	width:1000px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<h1 class="con">채팅방 생성</h1>
	<div class="con">
	
		<form name="addForm" onsubmit="submitAddForm(this); return false;" action="./doAdd" method="POST">
		<div>
			<span>채팅방 이름</span>
			<div>
				<input autocomplete="off" type="text" name="title"
				required="required" autofocus="autofocus" maxlength="30" placeholder="아이디"/>
			</div>
		</div>
		<div>
		<span>비밀번호</span>
			<div>
				<input autocomplete="off" type="password" name="passwd"
				required="required" maxlength="30" placeholder="비밀번호"/>
			</div>
		</div>
		<span>비밀번호 확인</span>
			<div>
				<input autocomplete="off" type="password" name="passwdConfirm"
				required="required" maxlength="30" placeholder="비밀번호 확인"/>
			</div>
		</div>
		<div>
			<span>로그인</span>
			<div>
				<input type="submit" value="생성">
			</div>
		</div>
		</form>
	
	</div>
	
</body>
</html>