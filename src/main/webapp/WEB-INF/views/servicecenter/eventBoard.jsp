<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/service/serviceMain.css">
<link rel="stylesheet" href="${path }/resources/css/bookdetail/bookdetail.css">
<body>
<div class="service-container">
	<div class="service-box1">
		<div class="service-box3">
			<jsp:include page="/WEB-INF/views/common/serviceSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="service-box2">
		<div style="display:flex; justify-content:center; margin-top:20px; margin-bottom:30px;" ><p style="font-size:30px;">이벤트</p></div>
			<div style="display:flex; justify-content:flex-end; margin-right:5px; margin-bottom:8px;">
        	<button class="reviewBtn" style="width:120px; height:40px; border:1px solid black; background-color:#E5E2DB;" onclick="window.open('<%=request.getContextPath()%>/ServiceboardController/insertEventBoard.do', '이벤트 작성!', 'width=500, height=600')">이벤트 작성하기</button>
        </div>
          <div class="service-box2" style="board:none;">
           <table class="review-exp review-board" id="targetTable" style="width:770px;">
               <tr>
            <th style='width:50px;'>번호</th>
            <th style='width:480px;'>제목</th>
            <th style='width:110px;'>작성자</th>
            <th style='width:110px;'>작성일</th>
            <th style='width:50px;'>삭제</th>
            </tr>
            <c:forEach var="e" items="${event }">
            <tr class='review-text review-tr'>
	            <td class='review-num' id="noticeboardNo">${e.eventboardNo}</td>
		   	    <td>
			   	    <div class='review'>
			   	    	<a class='review-title-a' href="#">${e.eventboardTitle}</a>
			   	    </div>
		   	    </td>
		   	    <td class='review-writer'>${e.memberId}</td>
		   	    <td class='review-date'>${e.eventboardDate}</td>
		   	    <td><button type="button" id="deleteBtn" onclick="location.assign('<%=request.getContextPath()%>/ServiceboardController/deleteEventBoard.do?eventboardNo='+${e.eventboardNo})">삭제</button>
	   	    </tr>
	   	   </c:forEach>
           </table>		

        <div id="pageBar"></div> 
		</div>
		</div>
		</div>
		
	</div>

</body>
<script>
		/* 작성 삭제버튼 */
		function fn_deleteNoticeBoard(){
			
		} 
		
		
		/* let deleteBtn = document.getElementById("#deleteBtn");
		
		deleteBtn.addEventListener('click',function(){
			$.ajax{
				url:"${path}/ServiceboardController/deleteNoticeBoard.do",
				data: ,
				success:data=>{
					
				}
					
				
			}
			
		}) */
		
		
		
		
		
		
		
		
		
        /* 상품리뷰, 상품문의 */
    	    var noticeBtn = document.getElementById("noticeBtn");
            console.log("noticeBtn은 나와야한다 : "+noticeBtn);
    	    var eventBtn = document.getElementById("eventBtn");
    	    var faqBtn = document.getElementById("faqBtn");
    	         
 	       	let pageBar = document.getElementById("pageBar");
    	   	let pager = "";
    	    let exp = document.getElementsByClassName('review-board');
    	    
    	   let tb = document.createElement('tbody');
    	   /* console.log("tb 입니다 ; ->>>>"+tb); */
  			let tr = ""; 
  			let tr2 = ""; 
       		let html2 = ""; /* thead */
       		html2 += "<tr><th style='width:105px;'>번호</th>";
            html2 += "<th style='width:515px;'>내용</th>";    
            html2 += "<th style='width:165px;'>작성자</th>";    
            html2 += "<th style='width:165px;'>작성일</th></tr>";    
            /* console.log(html2); */    
  			tr2 = document.createElement("tr");
  			tr2.innerHTML=html2;
  			
  			/* 상품리뷰 JS */
         $(noticeBtn).on('click', getTrs(1)); 
          
          function getTrs(cPage) {
        	 $.ajax({
            		type: 'post',
            		url: '${path}/SellbookController/productReview2.do',
            		data: {
            			bindNo: bindNo,
            			cPage: cPage,
            			numPerPage: 10
            		},
            		/* dataType: "json", */
            		success: data => {
            			
            			console.log("페이지바 넘겨온 데이터"+data);
            			pageBar.innerHTML = data;
            		} 
            	}); // pageBar ajax
            	 /* console.log(exp[0].children[0].children);
            	 console.log(exp[0].firstChild); */
            	 /*  console.log(exp[0].lastChild.childNodes);
            	 console.log($(".review-board").children(".review-text")); */
            	 /* console.log(tr); */
            	 /*  console.log(exp[0].child[0]);
            	 console.log(exp[0].child); */
            	 /* exp[0].children[0].html(); */
            	 /* exp[0].children.html(); */
            	    
            	 /*  exp[0].children[0].children.html();  */
         	 exp[0].lastChild.innerHTML = "";
            	 
         	 /* console.log(exp[0].lastChild.childNodes); */
         	 console.log("================= ajax 실행 후 ==================");
         	$.ajax({
              	type: 'post',
              	url: '${path}/SellbookController/productReview.do',
              	data: {
              		bindNo: bindNo,
              		cPage: cPage,
              		numPerPage: 10
              	},
              	dataType: "json",
              	success: data => {  
              		console.log(data);
              		exp[0].appendChild(tb).appendChild(tr2);
              		data.forEach((v, i) => {   

              			 let html = ""; /* 테이블 본문 내용 */
              		     html += "<tr class='review-text review-tr'>";   
                 	     html += "<td class='review-num'>"+v.rownum+"</td>";
                 	     html += "<td class='gpa'>";
                 	     html += "<div class='gpa-circle'>";
                 	     html += "<p class='gpa-circle-a'>"+v.book_score+"</p></div></td>";
                 	     html += "<td><div class='review'><a class='review-title-a'>"+v.book_board_content+"</a></div></td>";
                 	     html += " <td class='review-writer'>"+v.writer+"</td>";
                 	     html += "<td class='review-date'>"+v.write_date+"</td></tr>";
     
                 	    tr = document.createElement('tr'); 
               			tr.classList.add('review-text');
                 	    tr.classList.add('review-tr');
                 	    tr.innerHTML=html;
                 	       
                 	    pager = document.createElement('div');
                 	    pager.innerHTML = pageBar;
                 	    
                 	    console.log(tb);
                 	    
                 	    exp[0].appendChild(tb).appendChild(tr);

                 	 //exp[0].appendChild(tb[0]).appendChild(tr);
                 	    //exp[0].appendChild(tr);
                 	    // document.getElementById("targetTable").appendChild(tr);
                 	    /*  console.log("tb 입니다 ; ->>>>"+tb);
                 	    console.log(tb);
                 	    console.log(tb[0]); */
                 	    //exp[0].appendChild(pager);    
             		 });    
              		
              	  } 
              	
              }); // 1번째 ajax 끝
                       
         }
             		  			
        </script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>