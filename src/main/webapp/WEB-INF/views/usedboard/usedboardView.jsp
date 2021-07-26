<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/usedboard/usedboardView.css">
<section id="content">
<br><br>
    <article id="ar">
        <div class="divdivv">
            <h3 class="tit_subject" style="font-size: 40px;">제목 : 안녕하세요</h3>
            <br>
            <span class="spandd">
                <a><h3 style="font-size: 25px;"><img alt="" width="30" height="30" style="border-radius: 100px; vertical-align:middle"
                src="${path }/resources/images/usedboard/2.jpg">닉네임</h3></a>
                <br>
                <span class="numnum" style="font-size: 20px;">날짜</span>
            </span>
            <span class="desc_subjeck">
                <a id="gomain" role="button" class="btnbtn_1" style="font-size: 15px; cursor: pointer;">목록</a>
                <a href="" role="button" class="btnbtn_2" style="font-size: 15px;">수정</a>
                <a id="deletebtn" role="button" class="btnbtn_2" style="font-size: 15px; cursor: pointer;">삭제</a>
            </span>
        </div>
        <div class="view_info">
            <img src="3.jpg" width="450" height="300" >
            <img src="3.jpg" width="450" height="300" >
            <img src="3.jpg" width="450" height="300" >
            <br>
            <center><div id="article" style="font-size: 20px;">책제목 : 아기돼지삼형제 / 가격 : 1000원</div></center>
            <div id="article" style="font-size: 20px;">내용</div>
        </div>
        <div class="viewrecom">
            <div>
                <ul class="tab_tt">
                    <li class="on">
                        <a class="ahref" style="font-size: 20px;">댓글<span class="num_total">/댓글수</span></a>
                    </li>
                </ul>
                <ul class="level1">
                    <li>
                        <div class="reply_div">
                            <span class="txt_info" style="font-size: 15px;">
                                작성자
                                <span class="txt_bar" style="font-size: 15px;">|</span>
                                <span class="txt_num" style="font-size: 15px;">작성일</span>
                            </span>
                            <strong class="reply_st">
                                <span class="txt_de" style="font-size: 20px;">9</span>
                            </strong>
                            <button onclick="" class="btn-reply" style="font-size: 20px;" value="">삭제</button>
                            <button class="btn-reply" style="font-size: 20px;"  value="">답글</button>
                        </div>
                    </li>
                </ul>
                <ul class="level2">
                    <li>
                        <div class="reply_div">
                            <span class="txt_info" style="font-size: 15px;">
                                ㄴ 작성자
                                <span class="txt_bar" style="font-size: 15px;">|</span>
                                <span class="txt_num" style="font-size: 15px;">작성일</span>
                            </span>
                            <strong class="reply_st">
                                <span class="txt_de" style="font-size: 20px;">내용</span>
                            </strong>
                        </div>
                    </li>
                </ul>
            </div>
            <br><br>
                <div class="comment-editor">
                    <div class="inner-comment">
                        <form action="" method="post">
                            <textarea name="comment" rows="3" cols="195" style="resize: none; width: 95%" placeholder="로그인을 하셔야 댓글에 글을 쓸수 있습니다."></textarea>
                            <input type="hidden" name="level" value="1">
                            <input type="hidden" name="commentWriter" value="">
                            <input type="hidden" name="boardRef" value="">
                            <input type="hidden" name="commentRef" value="0">
                            <button type="submit" value="등록" id="btn-insert">등록</button>
                        </form>
                    </div>
                </div>
        </div>
        <br><br><br>
    
    </article>
</section>
<script>
	$(".btn-reply").click(e=>{
		const ul=$("<ul>");
		const form=$(".inner-comment>form").clone();
		form.find("textarea").attr("rows","1");
		form.find("textarea").attr("cols","95");
		form.find("[name=level]").val("2");
		form.find("[name=commentRef]").val($(e.target).val());
		form.find("button").removeAttr("id").addClass("btn-insert2");
		console.log($(e.target).val());
		const li=$("<li>").attr("colspan","2");
		ul.append(li.append(form));
		ul.find("li").css("display","none");
		
		ul.insertAfter($(e.target).parents("ul")).children("li").slideDown(800);
		
		$(e.target).off("click");
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>