<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<input type="text" value="${e.btitle}" name="bTitle">
			<input type="text" value="${e.btotalcost}" name="bTotalCost">
			<input type="text" value="${e.bprofit}" name="bProfit">
			<input type="text" value="${e.bsalesVolume}" name="bSalesVolume">
			
		</c:forEach> 
		 

		
			<div id="columnchart_material"></div>
			
			
			<!-- <div class="chart1">
				<p>매출이 높은 책 TOP 3</p>
			
				
			</div>
			<div class="chart2">
				<p>매출이 높은 e북 TOP 3</p>
				
			</div>
			<div class="chart3">
				<p>매출이 높은 기프트 TOP 3</p>
				
			</div> -->
			
			
			
			
			
		</div>
	</div>
</div>


<style>
      
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart);
	
	
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
	function drawChart() {
		let B_TITLE1 = document.getElementsByName("bTitle")[0].value;
		let B_TITLE2 = document.getElementsByName("bTitle")[1].value;
		let B_TITLE3 = document.getElementsByName("bTitle")[2].value;
		
		let B_TOTAL_COST1 = document.getElementsByName("bTotalCost")[0].value;
		let B_TOTAL_COST2 = document.getElementsByName("bTotalCost")[1].value;
		let B_TOTAL_COST3 = document.getElementsByName("bTotalCost")[2].value;
		
		let B_PROFIT1 = document.getElementsByName("bProfit")[0].value;
		let B_PROFIT2 = document.getElementsByName("bProfit")[1].value;
		let B_PROFIT3 = document.getElementsByName("bProfit")[2].value;
		
		let SALES_VOLUME1 = document.getElementsByName("bSalesVolume")[0].value;
		let SALES_VOLUME2 = document.getElementsByName("bSalesVolume")[1].value;
		let SALES_VOLUME3 = document.getElementsByName("bSalesVolume")[2].value;
		
		
		
	  var data = google.visualization.arrayToDataTable([
	    ['책이름', '매출액', '이익', '판매량'],
	    [B_TITLE1, B_TOTAL_COST1, B_PROFIT1, SALES_VOLUME1],
	    [B_TITLE2, B_TOTAL_COST2, B_PROFIT2, SALES_VOLUME2],
	    [B_TITLE3, B_TOTAL_COST3, B_PROFIT3, SALES_VOLUME3]
	    
	  ]);
	
	  var options = {
	    chart: {
	      title: '매출이 높은 책 TOP 3',
	      /* subtitle: 'Sales, Expenses, and Profit: book-title', */
	    }
	  };
	
	  var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	  chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>

<jsp:include page="/WEB-INF/views/common/newFooter.jsp">
	<jsp:param name="" value="" />
</jsp:include>