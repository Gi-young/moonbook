package com.rar.khbook.common;

public class PageFactoryAdmin {
	
	
	//첫 재고관리 페이지 getPageBar
	public static String getPageBar(int totalData, 
			int cPage, int numPerpage, String url, String stockParam) {
		
		String pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1; 
		
		if(pageNo==1) { 
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("
			+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";

				pageBar+="<a class='page-link' href='javascript:fn_paging("
				+(pageNo)+")'>"+pageNo+"</a>";

				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("
			+(pageNo)+")'>다음</a>";
			pageBar+="</li>";
		}
		
		pageBar+="<script>";
		
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.assign('"+url+"?cPage='+cPage+'&stockParam="+ stockParam +"');}";
		//pageBar+="orderList3(" +  + ", 10);";
		
		pageBar+="</script>";	
		
		System.out.println("pageBar Test : " + stockParam);
		
		
		return pageBar;
	}
	//첫 재고관리 페이지 getPageBar
		public static String getPageBar2(int totalData, 
				int cPage, int numPerpage, String url, String stockParam) {
			
			String pageBar="<ul class='pagination justify-content-center pagination-sm'>";
			int totalPage=(int)Math.ceil((double)totalData/numPerpage);
			int pageBarSize=5;
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1; 
			
			if(pageNo==1) { 
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>이전</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging2("
				+(pageNo-1)+")'>이전</a>";
				pageBar+="</li>";
			}
			
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(pageNo==cPage) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";

					pageBar+="<a class='page-link' href='javascript:fn_paging2("
					+(pageNo)+")'>"+pageNo+"</a>";

					pageBar+="</li>";
				}
				pageNo++;
			}
			
			if(pageNo>totalPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>다음</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging2("
				+(pageNo)+")'>다음</a>";
				pageBar+="</li>";
			}
			
			pageBar+="<script>";
			
			pageBar+="function fn_paging2(cPage){";
			pageBar+="location.assign('"+url+"?cPage='+cPage+'&stockParam="+ stockParam +"');}";
			//pageBar+="orderList3(" +  + ", 10);";
			
			pageBar+="</script>";	
			
			System.out.println("pageBar Test : " + stockParam);
			
			
			return pageBar;
		}
	
	
	//orderList3
	public static String getPageBar3(int totalData, 
			int cPage, int numPerpage, String url, String stockParam) {
		
		String pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1; 
		
		if(pageNo==1) { 
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:orderList3("
			+(pageNo-1)+",10)'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";

				pageBar+="<a class='page-link' href='javascript:orderList3("
				+(pageNo)+",10)'>"+pageNo+"</a>";

				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:orderList3("
			+(pageNo)+",10)'>다음</a>";
			pageBar+="</li>";
		}
		
		//pageBar+="<script>";
		
		//pageBar+="function fn_paging(cPage){";
		//pageBar+="location.assign('"+url+"?cPage='+cPage+'&stockParam="+ stockParam +"');}";
		//pageBar+="orderList3(" +  + ", 10);";
		//pageBar+="</script>";	
		
		System.out.println("pageBar Test : " + stockParam);
		
		
		return pageBar;
	}
	//searchStockT
	public static String getPageBar4(int totalData, 
			int cPage, int numPerpage, String url, String stockParam) {
		
		String pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1; 
		
		if(pageNo==1) { 
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:searchStockT("
			+(pageNo-1)+",10)'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";

				pageBar+="<a class='page-link' href='javascript:searchStockT("
				+(pageNo)+",10)'>"+pageNo+"</a>";

				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:searchStockT("
			+(pageNo)+",10)'>다음</a>";
			pageBar+="</li>";
		}
		
		//pageBar+="<script>";
		
		//pageBar+="function fn_paging(cPage){";
		//pageBar+="location.assign('"+url+"?cPage='+cPage+'&stockParam="+ stockParam +"');}";
		//pageBar+="orderList3(" +  + ", 10);";
		//pageBar+="</script>";	
		
		System.out.println("pageBar Test : " + stockParam);
		
		
		return pageBar;
	}
	//회원 조회하기 정렬
	public static String getPageBar5(int totalData, 
			int cPage, int numPerpage, String url) {
		
		String pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1; 
		
		if(pageNo==1) { 
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:orderList("
			+(pageNo-1)+",10)'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";

				pageBar+="<a class='page-link' href='javascript:orderList("
				+(pageNo)+",10)'>"+pageNo+"</a>";

				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:orderList("
			+(pageNo)+",10)'>다음</a>";
			pageBar+="</li>";
		}
		
		
		return pageBar;
	}
	//회원 조회하기 정렬
	public static String getPageBar6(int totalData, 
			int cPage, int numPerpage, String url) {
		
		String pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1; 
		
		if(pageNo==1) { 
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:searchMT("
			+(pageNo-1)+",10)'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";

				pageBar+="<a class='page-link' href='javascript:searchMT("
				+(pageNo)+",10)'>"+pageNo+"</a>";

				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:searchMT("
			+(pageNo)+",10)'>다음</a>";
			pageBar+="</li>";
		}
		
		
		return pageBar;
	}
	//쿠폰 검색하기
	public static String getPageBar7(int totalData, 
			int cPage, int numPerpage, String url) {
		
		String pageBar="<ul class='pagination justify-content-center pagination-sm'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1; 
		
		if(pageNo==1) { 
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:searchCouponL("
			+(pageNo-1)+",10)'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";

				pageBar+="<a class='page-link' href='javascript:searchCouponL("
				+(pageNo)+",10)'>"+pageNo+"</a>";

				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:searchCouponL("
			+(pageNo)+",10)'>다음</a>";
			pageBar+="</li>";
		}
		
		
		return pageBar;
	}
		
	//기존 페이지 팩토리
	public static String getOwnPageBar(int totalData, 
			int cPage, int numPerpage, String url) {
		
		String pageBar="<ul class='pageBar_ul'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<li class='pageBar_li disabled'>";
			pageBar+="<a class='' href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='pageBar_li'>";
			pageBar+="<a class='' href='javascript:fn_paging("
			+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='pageBar_li active'>";
				pageBar+="<a class='pageBar_a' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='pageBar_li'>";

				pageBar+="<a class='' href='javascript:fn_paging("
				+(pageNo)+")'>"+pageNo+"</a>";

				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='pageBar_li disabled'>";
			pageBar+="<a class='' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='pageBar_li'>";
			pageBar+="<a class='' href='javascript:fn_paging("
			+(pageNo)+")'>다음</a>";
			pageBar+="</li>";
		}
		
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.assign('"+url+"?cPage='+cPage);}";
		pageBar+="</script>";	
		
		
		return pageBar;
	}
	
	
}
