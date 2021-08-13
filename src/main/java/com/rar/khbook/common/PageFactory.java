package com.rar.khbook.common;

import java.util.Map;

public class PageFactory {

	public static String getPageBar(int totalData, int cPage, int numPerpage, String url) {

		String pageBar = "<ul class='pagination justify-content-center pagination-sm'>";
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		if (pageNo == 1) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>이전</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>";
			pageBar += "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link' href='#'>" + pageNo + "</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li class='page-item'>";

				pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo) + ")'>" + pageNo + "</a>";

				pageBar += "</li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo) + ")'>다음</a>";
			pageBar += "</li>";
		}

		pageBar += "<script>";
		pageBar += "function fn_paging(cPage){";
		pageBar += "location.assign('" + url + "?cPage='+cPage);}";
		pageBar += "</script>";

		return pageBar;
	}

	public static String getOwnPageBar(int totalData, int cPage, int numPerpage, String url) {

		String pageBar = "<ul class='pageBar_ul'>";
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		if (pageNo == 1) {
			pageBar += "<li class='pageBar_li disabled'>";
			pageBar += "<a class='' href='#'>이전</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='pageBar_li'>";
			pageBar += "<a class='' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>";
			pageBar += "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='pageBar_li active'>";
				pageBar += "<a class='pageBar_a' href='#'>" + pageNo + "</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li class='pageBar_li'>";

				pageBar += "<a class='' href='javascript:fn_paging(" + (pageNo) + ")'>" + pageNo + "</a>";

				pageBar += "</li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='pageBar_li disabled'>";
			pageBar += "<a class='' href='#'>다음</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='pageBar_li'>";
			pageBar += "<a class='' href='javascript:fn_paging(" + (pageNo) + ")'>다음</a>";
			pageBar += "</li>";
		}

		pageBar += "<script>";
		pageBar += "function fn_paging(cPage){";

		pageBar += "location.assign('" + url + "?cPage='+cPage);}";
		pageBar += "</script>";

		return pageBar;
	}

	public static String searchPageBar(int totalData, int cPage, int numPerpage, String url, Map param) {

		String pageBar = "<ul class='pageBar_ul'>";
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		if (pageNo == 1) {
			pageBar += "<li class='pageBar_li disabled'>";
			pageBar += "<a class='' href='#'>이전</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='pageBar_li'>";
			pageBar += "<a class='' href='" + url + "?cPage=" + (pageNo - 1) + "&keyword=" + param.get("keyword")
					+ "&searchType=" + param.get("searchType") + "&categoryCode=" + param.get("categoryCode")
					+ "&pubdateOrder=" + param.get("pubdateOrder") + "&salesOrder=" + param.get("salesOrder")
					+ "&priceOrder=" + param.get("priceOrder") + "&ratingOrder=" + param.get("ratingOrder")
					+ "&importancePubdate=" + param.get("importancePubdate") + "&importanceSales="
					+ param.get("importanceSales") + "&importanceRating=" + param.get("importanceRating")
					+ "&importancePrice=" + param.get("importancePrice") + "'>이전</a>";
			pageBar += "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='pageBar_li active'>";
				pageBar += "<a class='pageBar_a' href='#'>" + pageNo + "</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li class='pageBar_li'>";

				pageBar += "<a class='' href='" + url + "?cPage=" + pageNo + "&keyword=" + param.get("keyword")
						+ "&searchType=" + param.get("searchType") + "&categoryCode=" + param.get("categoryCode")
						+ "&pubdateOrder=" + param.get("pubdateOrder") + "&salesOrder=" + param.get("salesOrder")
						+ "&priceOrder=" + param.get("priceOrder") + "&ratingOrder=" + param.get("ratingOrder")
						+ "&importancePubdate=" + param.get("importancePubdate") + "&importanceSales="
						+ param.get("importanceSales") + "&importanceRating=" + param.get("importanceRating")
						+ "&importancePrice=" + param.get("importancePrice") + "'>" + pageNo + "</a>";

				pageBar += "</li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='pageBar_li disabled'>";
			pageBar += "<a class='' href='#'>다음</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='pageBar_li'>";
			pageBar += "<a class='' href='" + url + "?cPage=" + pageNo + "&keyword=" + param.get("keyword")
					+ "&searchType=" + param.get("searchType") + "&categoryCode=" + param.get("categoryCode")
					+ "&pubdateOrder=" + param.get("pubdateOrder") + "&salesOrder=" + param.get("salesOrder")
					+ "&priceOrder=" + param.get("priceOrder") + "&ratingOrder=" + param.get("ratingOrder")
					+ "&importancePubdate=" + param.get("importancePubdate") + "&importanceSales="
					+ param.get("importanceSales") + "&importanceRating=" + param.get("importanceRating")
					+ "&importancePrice=" + param.get("importancePrice") + "'>다음</a>";
			pageBar += "</li>";
		}

		pageBar += "<script>";
		pageBar += "function fn_paging(cPage){";

		pageBar += "location.assign('" + url + "?cPage='+cPage');}";
		pageBar += "</script>";

		return pageBar;
	}
	
	public static String getWonJaePageBar(int totalData, 
			int cPage, int numPerpage) {
		
		String pageBar="<ul class='pageBar_ul'>";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<li class='pageBar_li disabled'>";
			pageBar+="<a class='' href='#'>prev</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='' href='javascript:getTrs("
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

				pageBar+="<a class='' href='javascript:getTrs("
				+(pageNo)+")'>"+pageNo+"</a>";

				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='pageBar_li disabled'>";
			pageBar+="<a class='' href='#'>next</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='pageBar_li'>";
			pageBar+="<a class='' href='javascript:getTrs("
			+(pageNo)+")'>다음</a>";
			pageBar+="</li>";
		}	
		
		
		return pageBar;
	}
	
	//
	public static String getUsedboardPageBar(int totalData, 
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
		pageBar+="location.assign('"+url+"&cPage='+cPage);}";
		pageBar+="</script>";	
		
		
		return pageBar;
	}

}
