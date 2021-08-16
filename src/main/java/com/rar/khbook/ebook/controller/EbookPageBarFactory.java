package com.rar.khbook.ebook.controller;

public class EbookPageBarFactory {

	public static String getPageBar(int totalData, int cPage, int numPerpage) {

		String pageBar = "<ul>";
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		if (pageNo == 1) {
			pageBar += "<li class='disabled'>";
			pageBar += "<a>Prev</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:searchEbook(" + (pageNo - 1) + ", 12)'>Prev</a>";
			pageBar += "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='active'>";
				pageBar += "<a>" + pageNo + "</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li>";

				pageBar += "<a href='javascript:searchEbook(" + (pageNo) + ", 12)'>" + pageNo + "</a>";

				pageBar += "</li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='disabled'>";
			pageBar += "<a>Next</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li>";
			pageBar += "<a href='javascript:searchEbook(" + (pageNo) + ", 12)'>Next</a>";
			pageBar += "</li>";
		}

		return pageBar;
	}
	
}
