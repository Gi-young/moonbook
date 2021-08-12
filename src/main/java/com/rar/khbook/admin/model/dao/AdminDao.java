package com.rar.khbook.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.core.annotation.Order;

import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.delivery.model.vo.Delivery;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList(SqlSession session,int cPage,int numPerpage);
	
	int selectMemberCount(SqlSession session);
	
	int memberDelete(SqlSession session,String memberId);
	
	int memberUpdate(SqlSession session,Map param);
	
	List<Member> memberHowT(SqlSession session,Map param);
	int getPageBarOrderedMemberList(SqlSession session,Map param);
	
	List<Member> memberHowT2(SqlSession session,Map param);
	int getPageBarSearchTextMemberList(SqlSession session,Map param);
	
	List<Order> selectOrderList(SqlSession session,int cPage,int numPerpage);
	
	int insertProduct1(SqlSession session,Map param);
	
	int insertProduct3(SqlSession session,Map param);	
	
	int updateProduct1(SqlSession session,Map param);
	
	int updateProduct3(SqlSession session,Map param);
	
	EbookDatabind searchBringPrice(SqlSession session,int bindNo); 
	
	EbookDatabind checkStock1(SqlSession session, int bindNo);
	
	Ngift checkStock3(SqlSession session, int gift_no);
	
	int outputProduct1(SqlSession session,Map param);
	
	int updateSalesVolume1(SqlSession session,Map param);
	
	int updateSalesVolume2(SqlSession session,Map param);
	
	int outputAndupdateSalesVolume3(SqlSession session,Map param);
	
	List<EbookDatabind> selectEbookDatabindList(SqlSession session,int cPage,int numPerpage);
	int selectEbookDataCount(SqlSession session);
	
	List<Ngift> selectGiftList(SqlSession session,int cPage,int numPerpage);
	int selectGiftCount(SqlSession session);
	
	List<EbookDatabind> orderStockList(SqlSession session,Map param);
	
	int getPageBarOrderList(SqlSession session,Map param);
	
	List<Ngift> orderStockList3(SqlSession session,Map param);
	
	int getPageBarOrderList3(SqlSession session,Map param);
	
	List<EbookDatabind> searchTextStockList(SqlSession session,Map param);
	
	int getPageBarTextStockList(SqlSession session,Map param);
	
	List<Ngift> searchTextStockList3(SqlSession session,Map param);
	
	int getPageBarTextStockList3(SqlSession session,Map param);
	
	int stockTUpdate(SqlSession session,Map param);
	
	int stockTUpdate2(SqlSession session,Map param);
	
	int stockTDelete(SqlSession session,Map param);
	
	int stockTDelete2(SqlSession session,Map param);
	
	//쿠폰 등록
	int addCouponList(SqlSession session,Map param);
	//int insertAttachment(SqlSession session,CouponAttachment a);
	
	Member searchGrade(SqlSession session,Map param);
	
	Couponlist searchCoupon(SqlSession session,Map param);
	
	Couponlist searchInvalidNImg(SqlSession session,Map param);
	
	int inputCouponAdminOne(SqlSession session,Map param);
	
	//int inputCouponAdminGrade(SqlSession session,Map param);
	List<HashMap> searchMemberByGrade(SqlSession session,int memberGradeNo);
	int insertCoupon(SqlSession session,Map param);
	
	
	List<Couponlist> searchCouponList(SqlSession session,int cPage,int numPerpage);
	int selectCouponListCount(SqlSession session);
	
	List<Couponlist> searchCouponL(SqlSession session,Map param);
	int getPageBarSearchCouponList(SqlSession session,Map param);
	
	int updateCouponlist(SqlSession session,Map param);
	
	int adCouponDelete(SqlSession session,Map param);
	
	List<AuctionCate> selectAuctionList(SqlSession session);
	
	int addAuctionCate(SqlSession session,Map param);
	
	int deleteAuctionCate(SqlSession session,Map param);
	
	List<Delivery> selectDeliveryList(SqlSession session,int cPage,int numPerpage);
	int selectDeliveryCount(SqlSession session);
	
	int insertDelivery(SqlSession session,Map param);
	
	int updateDelivery(SqlSession session,Map param);
	
	int deleteDelivery(SqlSession session,Map param);
	
	int selectbookTotalCost(SqlSession session);
	
	List<EbookDatabind> orderBookAList(SqlSession session,Map param);
	int getPageBarorderBookAList(SqlSession session,Map param);
	
	List<EbookDatabind> searchTextbookAList(SqlSession session,Map param);
	
	int getPageBarsearchTextbookAList(SqlSession session,Map param);
	
	int searchbookTotalCost(SqlSession session,Map param);
	
	//이건 EBOOK 조회할때 총 매출액임
	int selectbookTotalCost2(SqlSession session); 
	
	List<EbookDatabind> orderEBookAList(SqlSession session,Map param);
	int getPageBarorderEBookAList(SqlSession session,Map param);
	
	List<EbookDatabind> searchTextEbookAList(SqlSession session,Map param);
	
	int getPageBarsearchTextEbookAList(SqlSession session,Map param);
	
	int searchEbookTotalCost(SqlSession session,Map param);
	
	int selectgiftTotalCost(SqlSession session);
	
}
