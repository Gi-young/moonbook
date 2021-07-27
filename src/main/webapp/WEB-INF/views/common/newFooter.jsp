<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<div class="color-bar"></div>
        <div class="footer-background">
            <div class="center"> 
                <div class="left">
                    <img src="${path }/resources/images/common/mgbook.png" alt="문곰책방" 
                    />
                </div> 
                <div class="mid">
                    <ul>
                        <li>㈜ 문곰책방</li>
                        <li>서울시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</li>
                        <li>대표이사 : 유지훈 반장</li>
                        <h3 class="copyright">COPYRIGHT(C) KH BOOKS CENTRE ALL RIGHTS RESERVED.</h3>
                    </ul>
                </div>
                <div class="right">     
                    <p class="mid-right">만든 이 :</p> 
                    <ul>
                        <li>정의상민</li>
                        <li>김기0</li>
                        <li>작업중..</li>
                    </ul>
                    <ul>
                        <li>오류혜신</li>
                        <li>7원재</li>
                        <li>역시양협</li>
                    </ul>
                </div>
            </div>     
        </div>
        <jsp:include page="/WEB-INF/views/common/quickBar.jsp">
			<jsp:param name="" value=""/> 
		</jsp:include>
       <%--  System.out.println(${path }); --%>
	<%-- <script>
		$(document).ready(function(){
	        // 사이드 퀵메뉴바
	        console.log("<%=request.getContextPath()%>/quickBar.jsp");
	        $(".quickBar").html("quickBar.jsp");
	    }) 
	</script> --%>
</body>
</html>
