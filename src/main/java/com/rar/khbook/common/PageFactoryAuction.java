package com.rar.khbook.common;

public class PageFactoryAuction {

	public static String getOwnPageBar(int totalData, 
			int cPage, int numPerpage, String url,String query) {
		
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
		pageBar+="location.assign('"+url+"&cPage='+cPage);}";
		pageBar+="</script>";	
		
		
		return pageBar;
	}
}
