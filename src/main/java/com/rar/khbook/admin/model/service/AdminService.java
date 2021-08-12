package com.rar.khbook.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.core.annotation.Order;

import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.delivery.model.vo.Delivery;
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
	
	//쿠폰 단체 발급
	//int inputCouponAdminGrade(Map param);
	List<HashMap> searchMemberByGrade(int memberGradeNo);
	int insertCoupon(Map param);
	
	
	// 쿠폰리스트 조회
	List<Couponlist> searchCouponList(int cPage,int numPerpage);
	int selectCouponListCount();
	
	//쿠폰검색
	List<Couponlist> searchCouponL(Map param);
	int getPageBarSearchCouponList(Map param);
	//쿠폰 수정
	int updateCouponlist(Map param);
	//쿠폰 삭제
	int adCouponDelete(Map param);
	
	//경매 조회
	List<AuctionCate> selectAuctionList();
	
	//경매 카테고리 추가
	int addAuctionCate(Map param);
	
	//경매 카테고리 삭제
	int deleteAuctionCate(Map param);
	
	//배송 페이지
	List<Delivery> selectDeliveryList(int cPage,int numPerpage);
	int selectDeliveryCount();
	
	//배송 추가
	int insertDelivery(Map param);
	//배송 갱신
	int updateDelivery(Map param);
	//배송 삭제
	int deleteDelivery(Map param);
	
	//매출 분석
	//책 상세 총 매출액 계산 
	int selectbookTotalCost(); 
	
	//책 상세 정렬방법 
	List<EbookDatabind> orderBookAList(Map param);
	//책 상세 정렬 페이지바
	int getPageBarorderBookAList(Map param);
	
	//매출 책 검색 
	List<EbookDatabind> searchTextbookAList(Map param);
	
	int getPageBarsearchTextbookAList(Map param);
	int searchbookTotalCost(Map param);
	
	//ebook 상세 총 매출액 계산
	int selectbookTotalCost2();
	
	//ebook 상세 정렬방법
	List<EbookDatabind> orderEBookAList(Map param);
	//ebook 상세 정렬 페이지바
	int getPageBarorderEBookAList(Map param);
	
	//매출 ebook 검색
	List<EbookDatabind> searchTextEbookAList(Map param);
	
	int getPageBarsearchTextEbookAList(Map param);
	int searchEbookTotalCost(Map param);
	
	//매출 gift 총 매출액 계산
	int selectgiftTotalCost();
	
	//매출 gift 상세 정렬 
	List<Ngift> orderGiftAList(Map param);
	//매출 gift 상세 정렬 페이지바
	int getPageBarorderGiftAList(Map param);
	
	//매출gift 상세 검색 
	List<Ngift> searchTextGiftAList(Map param);
	
	int getPageBarsearchTextGiftAList(Map param);
	int searchGiftTotalCost(Map param);
}
