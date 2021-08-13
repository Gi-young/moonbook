package com.rar.khbook.ebook.model.service;

import java.util.List;
import java.util.Map;

import com.rar.khbook.ebook.model.vo.EbookDatabind;

public interface EbookServiceSm {

//	도서 총 개수
	int bookCount();
	
//	모든 도서 조회
	List<EbookDatabind> selectAllBook(int cPage, int numPerpage);
	
//	검색 조건에 부합하는 도서 개수
	int searchBookCount(Map param);
	
//	검색 조건에 부합하는 도서 조회
	List<EbookDatabind> searchBook(Map param, int cPage, int numPerpage);
	
//	구매할 도서 조회
	EbookDatabind selectBook(EbookDatabind b);
	
//	구매한 이북인지 확인
	EbookDatabind checkEbook(Map param);
	
//	주문 및 결제
	int orderOne(Map param);
}
