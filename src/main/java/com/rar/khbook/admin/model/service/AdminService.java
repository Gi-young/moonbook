package com.rar.khbook.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.core.annotation.Order;

import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;

public interface AdminService {
	
	List<Member> selectMemberList(int cPage,int numPerpage);
	int selectMemberCount();
	
	int memberDelete(String memberId);
	
	int memberUpdate(Map param);

	List<Member> memberHowT(Map param); //회원 정렬 조회
	int getPageBarOrderedMemberList(Map param); //회원 정렬 조회 페이지 바
	
	List<Member> memberHowT2(Map param);
	int getPageBarSearchTextMemberList(Map param);
	
	List<Order> selectOrderList(int cPage,int numPerpage);
	
	int insertProduct1(Map param); // 책등록
	int insertProduct3(Map param); // 상품등록
	
	 
	int updateProduct1(Map param); //책입고
	int updateProduct3(Map param); //상품입고
	
	EbookDatabind searchBringPrice(int bindNo); //가격 가져오는 로직 book
	
	EbookDatabind checkStock1(int bindNo); //book 재고 체크
	
	Ngift checkStock3(int gift_no); // gift 재고 체크
	
	int outputProduct1(Map param); //book재고에서 -출고 개수
	
	int updateSalesVolume1(Map param); //book판매량 +출고 개수
	
	int updateSalesVolume2(Map param); //ebook 판매량 +출고 개수 출고는 재고 상관없이 마음대로 가능
	
	int outputAndupdateSalesVolume3(Map param); //gift 재고-출고 && 판매량 +출고
	
	//재고현황 시작
	List<EbookDatabind> selectEbookDatabindList(int cPage,int numPerpage);//재고 구하기
	int selectEbookDataCount();
	
	List<Ngift> selectGiftList(int cPage,int numPerpage);
	int selectGiftCount();
	
	//재고 책 정렬방법
	List<EbookDatabind> orderStockList(Map param);
	int getPageBarOrderList(Map param);
	
	//재고 gift 정렬
	List<Ngift> orderStockList3(Map param);
	int getPageBarOrderList3(Map param);
	
	//재고 책 검색
	List<EbookDatabind> searchTextStockList(Map param);
	int getPageBarTextStockList(Map param);
	
	//재고 gift 검색
	List<Ngift> searchTextStockList3(Map param);
	int getPageBarTextStockList3(Map param);
	//재고 책 수정
	int stockTUpdate(Map param);
	
	//재고 gift 수정
	int stockTUpdate2(Map param);
	
	//재고 책 삭제
	int stockTDelete(Map param);
	
	//재고 gift 삭제
	int stockTDelete2(Map param);
	
	//쿠폰 등록
	int addCouponList(Map param);
	
	//쿠폰 발급 전 등급 조회
	Member searchGrade(Map param);
	
	//쿠폰 발급 전 쿠폰리스트의 번호 조회
	Couponlist searchCoupon(Map param);
	
	//쿠폰 발급 전 발급할 쿠폰 종류의 만료기간 서치
	Couponlist searchInvalidNImg(Map param);
	
	//쿠폰 발급
	int inputCouponAdminOne(Map param);
	
	// 쿠폰리스트 조회
	List<Couponlist> searchCouponList();
}
