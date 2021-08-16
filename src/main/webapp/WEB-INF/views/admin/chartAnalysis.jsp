<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/newHeader.jsp">
	<jsp:param name="" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/login/reset.css">
<link rel="stylesheet" href="${path}/resources/css/admin/chartAnalysis.css">


<div class="admin-container">
	<div class="admin-box1">
		<div class="admin-box3">
			<jsp:include page="/WEB-INF/views/common/adminSideBar.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
		<div class="admin-box2">
		<c:forEach var="e" items="${list1 }"> 
			<%-- <input type="hidden" value="${fn:split(e.btitle,'(')}" name="bTitle"> --%>
			<input type="hidden" value="${e.btitle}" name="bTitle">
			<input type="hidden" value="${e.btotalcost}" name="bTotalCost">
			<input type="hidden" value="${e.bprofit}" name="bProfit">
			<input type="hidden" value="${e.bcost}" name="bcost">
			
		</c:forEach> 
		<c:forEach var="e" items="${list2 }"> 
			<%-- <input type="hidden" value="${fn:split(e.btitle,'(')}" name="bTitle"> --%>
			<input type="hidden" value="${e.ebtitle}" name="ebTitle">
			<input type="hidden" value="${e.ebtotalcost}" name="ebTotalCost">
			<input type="hidden" value="${e.ebprofit}" name="ebProfit">
			<input type="hidden" value="${e.ebcost}" name="ebcost">
			
		</c:forEach> 
		<c:forEach var="e" items="${list3 }"> 
			<%-- <input type="hidden" value="${fn:split(e.btitle,'(')}" name="bTitle"> --%>
			<input type="hidden" value="${e.ngtitle}" name="ngtitle">
			<input type="hidden" value="${e.ngiftTotalcost}" name="ngiftTotalcost">
			<input type="hidden" value="${e.ngiftProfit}" name="ngiftProfit">
			<input type="hidden" value="${e.ngiftCost}" name="ngiftCost">
			
		</c:forEach> 
		 

		
			
			
			
			
			<div class="chart1">
				<!-- <p>매출이 높은 책 TOP 3</p> -->
				<div id="columnchart_material1"></div>
				
			</div>
			<div class="chart2">
				<!-- <p>매출이 높은 e북 TOP 3</p> -->
				<div id="columnchart_material2"></div>
			</div>
			<div class="chart3">
				<!-- <p>매출이 높은 기프트 TOP 3</p> -->
				<div id="columnchart_material3"></div>
			</div>
			
			
			
			
			
		</div>
	</div>
</div>


<style>
      
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart2);
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart3);
	
	/* $.ajax({
		drawChart(arr1, arr2, arr3,arr4)
	}) */
	/* $.ajax({
		url: "${path}/admin/getChartTopBook.do",
		data: {
			
		},
		success: data => {
			
			drawChart(arr1, arr2, arr3,arr4);
		}
	}); */
	function drawChart2() {
		let EB_TITLE1 = document.getElementsByName("ebTitle")[0].value.split('(');
		let EB_TITLE2 = document.getElementsByName("ebTitle")[1].value.split('(');
		let EB_TITLE3 = document.getElementsByName("ebTitle")[2].value.split('(');
		
		let EB_TOTAL_COST1 = document.getElementsByName("ebTotalCost")[0].value;
		let EB_TOTAL_COST2 = document.getElementsByName("ebTotalCost")[1].value;
		let EB_TOTAL_COST3 = document.getElementsByName("ebTotalCost")[2].value;
		
		let EB_PROFIT1 = document.getElementsByName("ebProfit")[0].value;
		let EB_PROFIT2 = document.getElementsByName("ebProfit")[1].value;
		let EB_PROFIT3 = document.getElementsByName("ebProfit")[2].value;
		
		let EBCOST1 = document.getElementsByName("ebcost")[0].value;
		let EBCOST2 = document.getElementsByName("ebcost")[1].value;
		let EBCOST3 = document.getElementsByName("ebcost")[2].value;
		console.log("test");
		console.log(EB_TITLE1[0]);
		
		console.log(typeof EB_TOTAL_COST1);
		
		console.log(typeof EB_PROFIT1);
		
	 /*  var data = google.visualization.arrayToDataTable([
	    ['e북제목', '매출액', '이익', '판매량'],
	    [EB_TITLE1[0], EB_TOTAL_COST1, EB_PROFIT1, ESALES_VOLUME1],
	    [EB_TITLE2[0], EB_TOTAL_COST2, EB_PROFIT2, ESALES_VOLUME2],
	    [EB_TITLE3[0], EB_TOTAL_COST3, EB_PROFIT3, ESALES_VOLUME3]
	    
	  ]); */
	  
	  var data = google.visualization.arrayToDataTable([
		    ['e북제목', '매출액', '이익', '비용'],
		    [EB_TITLE1[0], Number(EB_TOTAL_COST1), Number(EB_PROFIT1), Number(EBCOST1)],
		    [EB_TITLE2[0], Number(EB_TOTAL_COST2), Number(EB_PROFIT2), Number(EBCOST2)],
		    [EB_TITLE3[0], Number(EB_TOTAL_COST3), Number(EB_PROFIT3), Number(EBCOST3)]
		    
		  ]);
	
	  var options = {
	    chart: {
	      	title: '매출이 높은 E북 TOP 3'
	      /* subtitle: 'Sales, Expenses, and Profit: book-title', */
	    	
	    }
	  };
	
	  var chart = new google.charts.Bar(document.getElementById('columnchart_material2'));
	
	  chart.draw(data, google.charts.Bar.convertOptions(options));
	}
	/* Ebook */
	
	function drawChart() {
		let B_TITLE1 = document.getElementsByName("bTitle")[0].value.split('(');
		let B_TITLE2 = document.getElementsByName("bTitle")[1].value.split('(');
		let B_TITLE3 = document.getElementsByName("bTitle")[2].value.split('(');
		
		let B_TOTAL_COST1 = document.getElementsByName("bTotalCost")[0].value;
		let B_TOTAL_COST2 = document.getElementsByName("bTotalCost")[1].value;
		let B_TOTAL_COST3 = document.getElementsByName("bTotalCost")[2].value;
		
		let B_PROFIT1 = document.getElementsByName("bProfit")[0].value;
		let B_PROFIT2 = document.getElementsByName("bProfit")[1].value;
		let B_PROFIT3 = document.getElementsByName("bProfit")[2].value;
		
		let BCOST1 = document.getElementsByName("bcost")[0].value;
		let BCOST2 = document.getElementsByName("bcost")[1].value;
		let BCOST3 = document.getElementsByName("bcost")[2].value;
		
		
		
	  var data = google.visualization.arrayToDataTable([
	    ['책제목', '매출액', '이익', '비용'],
	    [B_TITLE1[0], Number(B_TOTAL_COST1), Number(B_PROFIT1), Number(BCOST1)],
	    [B_TITLE2[0], Number(B_TOTAL_COST2), Number(B_PROFIT2), Number(BCOST2)],
	    [B_TITLE3[0], Number(B_TOTAL_COST3), Number(B_PROFIT3), Number(BCOST3)]
	    
	  ]);
	
	  var options = {
	    chart: {
	      title: '매출이 높은 책 TOP 3',
	      /* subtitle: 'Sales, Expenses, and Profit: book-title', */
	    }
	  };
	
	  var chart = new google.charts.Bar(document.getElementById('columnchart_material1'));
	
	  chart.draw(data, google.charts.Bar.convertOptions(options));
	}
	function drawChart3() {
		let GIFT_TITLE1 = document.getElementsByName("ngtitle")[0].value.replace('<b>',"").replace('</b>','');
		let GIFT_TITLE2 = document.getElementsByName("ngtitle")[1].value.replace('<b>',"").replace('</b>','');
		let GIFT_TITLE3 = document.getElementsByName("ngtitle")[2].value.replace('<b>',"").replace('</b>','');
		
		let GIFT_TOTAL_COST1 = document.getElementsByName("ngiftTotalcost")[0].value;
		let GIFT_TOTAL_COST2 = document.getElementsByName("ngiftTotalcost")[1].value;
		let GIFT_TOTAL_COST3 = document.getElementsByName("ngiftTotalcost")[2].value;
		
		let GIFT_PROFIT1 = document.getElementsByName("ngiftProfit")[0].value;
		let GIFT_PROFIT2 = document.getElementsByName("ngiftProfit")[1].value;
		let GIFT_PROFIT3 = document.getElementsByName("ngiftProfit")[2].value;
		
		let GIFTCOST1 = document.getElementsByName("ngiftCost")[0].value;
		let	GIFTCOST2 = document.getElementsByName("ngiftCost")[1].value;
		let GIFTCOST3 = document.getElementsByName("ngiftCost")[2].value;
		
		if(GIFT_TITLE1.length > 12){
			GIFT_TITLE1 = document.getElementsByName("ngtitle")[0].value.replace('<b>',"").split('</b>');
		} else {
			GIFT_TITLE1 = ("haha</b>" + GIFT_TITLE1).split("</b>");
		}
		if(GIFT_TITLE2.length > 12){
			GIFT_TITLE2 = document.getElementsByName("ngtitle")[1].value.replace('<b>',"").split('</b>');
		} else {
			GIFT_TITLE2 = ("haha</b>" + GIFT_TITLE2).split("</b>");
		}
		if(GIFT_TITLE3.length > 12){
			GIFT_TITLE3 = document.getElementsByName("ngtitle")[2].value.replace('<b>',"").split('</b>');
		} else {
			GIFT_TITLE3 = ("haha</b>" + GIFT_TITLE3).split("</b>");
		}
		
	  var data = google.visualization.arrayToDataTable([
	    ['상품명', '매출액', '이익', '비용'],
	    [GIFT_TITLE1[1], Number(GIFT_TOTAL_COST1), Number(GIFT_PROFIT1), Number(GIFTCOST1)],
	    [GIFT_TITLE2[1], Number(GIFT_TOTAL_COST2), Number(GIFT_PROFIT2), Number(GIFTCOST2)],
	    [GIFT_TITLE3[1], Number(GIFT_TOTAL_COST3), Number(GIFT_PROFIT3), Number(GIFTCOST3)]
	    
	  ]);
	
	  var options = {
	    chart: {
	      title: '매출이 높은 기프트 TOP 3',
	      /* subtitle: 'Sales, Expenses, and Profit: book-title', */
	    }
	  };
	
	  var chart = new google.charts.Bar(document.getElementById('columnchart_material3'));
	
	  chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>