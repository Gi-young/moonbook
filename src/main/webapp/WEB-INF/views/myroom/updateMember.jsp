<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="prevMonth" value="<%=new java.util.Date().getMonth()%>" />
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/myroom/layout.css">
<link rel="stylesheet" href="${path }/resources/css/memberGrade.css">
<link rel="stylesheet" href="${path }/resources/css/mainCss.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="title" value="회원정보수정 - 문곰책방" />
</jsp:include>
<div class="wrap">
	<div class="container margin_top2e">
		<jsp:include page="/WEB-INF/views/common/myroomMenubar.jsp">
			<jsp:param name="title" value="" />
		</jsp:include>
		<div class="myroom_contents">
			<div class="content_head2">
				<img src="${path }/resources/img/login/enroll1.PNG" />
				<p>회원 정보 수정</p>
			</div>
			<hr>
			<form action="${path }/member/myroom/updateMemberEnd.do"
				method="post">
				<div class="fm_div">
					<div class="fm_valDiv">
						<div class="fm_valNam">아이디</div>
						<div>
							<input name="memberId" value="${loginMember.memberId }"
								type="text" readonly>
						</div>
					</div>
				</div>
				<div class="fm_div">
					<div class="fm_valDiv">
						<div class="fm_valNam">이름</div>
						<div>
							<input name="memberName" value="${loginMember.memberName } "
								type="text" required>
						</div>
					</div>
				</div>
				<div class="fm_div">
					<div class="fm_valDiv">
						<div class="fm_valNam">이메일</div>
						<input class="emailId" type="email"
							value="${loginMember.memberEmail}" id="memberEmail"
							name="memberEmail" required>
						<button id="sendEmail" class="btn" type="button" disabled>코드전송</button>
						<div id="sendInfo" class="padding10 fs15" style="display: none">전송되었습니다.</div>
					</div>
				</div>
				<div class="fm_div" style="display: none" id="checkCode">
					<div class="fm_valDiv">
						<div class="fm_valNam">인증코드</div>
						<div>
							<input type="hidden" placeholder="이메일로 전송했습니다." id="codeVal"
								required>
						</div>
						<div>
							<button id="checkEmail" class="btn" type="button">인증하기</button>
						</div>
						<div class="padding10 fs15" id="checkInfoT" style="display: none">인증되었습니다.</div>
						<div class="padding10 fs15" id="checkInfoF"
							style="display: none; color: red;">
							잘못된 코드.<input type="hidden" value="ok" id="wC">
						</div>
					</div>
				</div>
				<div class="fm_div">
					<div class="fm_valDiv">
						<div class="fm_valNam">전화번호</div>
						<div>
							<input type="text" name="memberPhone"
								value="${loginMember.memberPhone}" required>
						</div>
					</div>
				</div>
				<div class="fm_div">
					<div class="fm_valDiv">
						<div class="fm_valNam">주소</div>
						<div>
							<input id="member_addr" type="text" placeholder="주소명"
								name="memberAddress" value="${loginMember.memberAddress}"
								required onclick="findAddr()" class="inputLong" readonly> <input
								id="member_post" type="text" placeholder="도로명/번호"
								name="memberAddressNum" value="${loginMember.memberAddressNum }"
								readonly> <input type="text" placeholder="상세주소"
								name="memberDetailAddress"
								value="${loginMember.memberDetailAddress }" required>
						</div>
					</div>
				</div>
				<div class="fm_div">
					<div class="fm_valDiv">
						<div class="fm_valNam">성별</div>
						<div>
							<input id="male" name="memberGender"
								${loginMember.memberGender=='M'?'checked':''} required
								type="radio" value="M">
						</div>
						<label for="male">남</label>
						<div>
							<input id="female" name="memberGender"
								${loginMember.memberGender=='F'?'checked':''} required
								type="radio" value="F">
						</div>
						<label for="female">여</label>
					</div>
				</div>
				<div class="fm_div">
					<div class="fm_valDiv">
						<div class="fm_valNam">생일</div>
						<div>
							<input type="Date" name="memberBirth"
								value="${loginMember.memberBirth}" required>
						</div>
					</div>
				</div>
				<div class="btn_div">
					<input class="enrollchoice3" type="submit" value="완료" id="subBtn"
						onclick="return fn_frmsubmit();">
				</div>
			</form>
		</div>
	</div>
</div>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}
$(".emailId").click(e=>{
	if(confirm('이메일 주소 변경시 반드시 이메일 인증을 완료해야합니다.\n이메일 주소를 변경하시겠습니까?')){
		$("#memberEmail").removeAttr("readonly");
		$("#codeVal").removeAttr("readonly");
		$("#codeVal").attr("type", "text");
		$(".emailId").val("").focus();
		$("#sendEmail").removeAttr("disabled");
		$("#subBtn").attr("disabled");
	}else{
		$(".emailId").blur();
	}
})

$("#sendEmail").click(e=>{
	const memberEmail = $(".emailId").val();
	$.get("${path}/member/checkEmail.do?memberEmail="+memberEmail, data=>{
		$("#sendInfo").css("display", "block");
		console.log(data);
		$("#checkCode").css("display", "flex");
		$("#checkEmail").click(e=>{
			const val = $("#codeVal").val();
			if(data == $("#codeVal").val()){
				$("#checkInfoT").css("display", "block");
				$("#checkInfoF").css("display", "none");
				$("#wC").val("yes");
				$("#codeVal").attr("readonly", true);
				$("#memberEmail").attr("readonly", true);
			}else{
				$("#checkInfoF").css("display", "block");
				$("#checkInfoT").css("display", "none");
				$("#wC").val("no");
			}
		})
	})
})

const fn_frmsubmit=()=> {
	if($("#wC").val() == 'no'){
		alert("잘못된 인증코드입니다.");
		$("#codeVal").focus();
		return false;
	}else{
		return true;
	}
}
</script>
<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>