package com.rar.khbook.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import com.rar.khbook.admin.model.dao.AdminDao;
import com.rar.khbook.adminchart.model.vo.BookTopThree;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.delivery.model.vo.Delivery;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Member> selectMemberList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(session,cPage,numPerpage);
	}

	@Override
	public int selectMemberCount() {
		// TODO Auto-generated method stub
		return dao.selectMemberCount(session);
	}

	@Override
	public int memberDelete(String memberId) {
		// TODO Auto-generated method stub
		return dao.memberDelete(session,memberId);
	}

	@Override
	public int memberUpdate(Map param) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(session,param);
	}

	@Override
	public List<Member> memberHowT(Map param) {
		// TODO Auto-generated method stub
		return dao.memberHowT(session,param);
	}
	@Override
	public int getPageBarOrderedMemberList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarOrderedMemberList(session,param);
	}

	@Override
	public List<Member> memberHowT2(Map param) {
		// TODO Auto-generated method stub
		return dao.memberHowT2(session, param);
	}
	

	@Override
	public int getPageBarSearchTextMemberList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarSearchTextMemberList(session,param);
	}

	@Override
	public List<Order> selectOrderList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectOrderList(session,cPage,numPerpage);
	}

	@Override
	public int insertProduct1(Map param) {
		// TODO Auto-generated method stub
		return dao.insertProduct1(session,param);
	}

	@Override
	public int insertProduct3(Map param) {
		// TODO Auto-generated method stub
		return dao.insertProduct3(session, param);
	}

	@Override
	public int updateProduct1(Map param) {
		// TODO Auto-generated method stub
		return dao.updateProduct1(session,param);
	}
	
	@Override
	public int updateProduct3(Map param) {
		// TODO Auto-generated method stub
		return dao.updateProduct3(session, param);
	}

	@Override
	public EbookDatabind searchBringPrice(int bindNo) {
		// TODO Auto-generated method stub
		return dao.searchBringPrice(session,bindNo);
	}

	@Override
	public int outputProduct1(Map param) {
		// TODO Auto-generated method stub
		return dao.outputProduct1(session,param);
	}

	@Override
	public int updateSalesVolume1(Map param) {
		// TODO Auto-generated method stub
		return dao.updateSalesVolume1(session,param);
	}
	@Override
	public int updateSalesVolume2(Map param) {
		// TODO Auto-generated method stub
		return dao.updateSalesVolume2(session,param);
	}
	
	@Override
	public int outputAndupdateSalesVolume3(Map param) {
		// TODO Auto-generated method stub
		return dao.outputAndupdateSalesVolume3(session,param);
	}

	@Override
	public EbookDatabind checkStock1(int bindNo) {
		// TODO Auto-generated method stub
		return dao.checkStock1(session,bindNo);
	}
	
	@Override
	public Ngift checkStock3(int gift_no) {
		// TODO Auto-generated method stub
		return dao.checkStock3(session, gift_no);
	}

	@Override
	public List<EbookDatabind> selectEbookDatabindList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectEbookDatabindList(session,cPage,numPerpage);
	}

	@Override
	public int selectEbookDataCount() {
		// TODO Auto-generated method stub
		return dao.selectEbookDataCount(session);
	}

	@Override
	public List<Ngift> selectGiftList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectGiftList(session,cPage,numPerpage);
	}

	@Override
	public int selectGiftCount() {
		// TODO Auto-generated method stub
		return dao.selectGiftCount(session);
	}

	@Override
	public List<EbookDatabind> orderStockList(Map param) {
		// TODO Auto-generated method stub
		return dao.orderStockList(session,param);
	}
	
	@Override
	public int getPageBarOrderList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarOrderList(session,param);
	}

	@Override
	public List<Ngift> orderStockList3(Map param) {
		// TODO Auto-generated method stub
		return dao.orderStockList3(session,param);
	}
	

	@Override
	public int getPageBarOrderList3(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarOrderList3(session,param);
	}

	@Override
	public List<EbookDatabind> searchTextStockList(Map param) {
		// TODO Auto-generated method stub
		return dao.searchTextStockList(session,param);
	}
	
	@Override
	public int getPageBarTextStockList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarTextStockList(session,param);
	}

	@Override
	public List<Ngift> searchTextStockList3(Map param) {
		// TODO Auto-generated method stub
		return dao.searchTextStockList3(session,param);
	}
	
	@Override
	public int getPageBarTextStockList3(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarTextStockList3(session,param);
	}

	@Override
	public int stockTUpdate(Map param) {
		// TODO Auto-generated method stub
		return dao.stockTUpdate(session,param);
	}

	@Override
	public int stockTUpdate2(Map param) {
		// TODO Auto-generated method stub
		return dao.stockTUpdate2(session, param);
	}

	@Override
	public int stockTDelete(Map param) {
		// TODO Auto-generated method stub
		return dao.stockTDelete(session,param);
	}

	@Override
	public int stockTDelete2(Map param) {
		// TODO Auto-generated method stub
		return dao.stockTDelete2(session,param);
	}

	@Override
	public int addCouponList(Map param) {
		// TODO Auto-generated method stub
		return dao.addCouponList(session,param);
		
//		int result=dao.addCouponList(session,c);
//		if(result>0) {
//			List<CouponAttachment> attachments=c.getAttachments();
//			
//			if(attachments.size()>0) {
//				for(CouponAttachment a: attachments) {
//					dao.insertAttachment(session,a);
//				}
//			}else if(result>0) return 1;
//			else return 0;
//		}else return 0;
//		return 1;
		
		
	}

	@Override
	public Member searchGrade(Map param) {
		// TODO Auto-generated method stub
		return dao.searchGrade(session,param);
	}

	@Override
	public Couponlist searchCoupon(Map param) {
		// TODO Auto-generated method stub
		return dao.searchCoupon(session,param);
	}

	@Override
	public Couponlist searchInvalidNImg(Map param) {
		// TODO Auto-generated method stub
		return dao.searchInvalidNImg(session,param);
	}

	@Override
	public int inputCouponAdminOne(Map param) {
		// TODO Auto-generated method stub
		return dao.inputCouponAdminOne(session,param);
	}
	
	@Override
	public List<HashMap> searchMemberByGrade(int memberGradeNo) {
		// TODO Auto-generated method stub
		return dao.searchMemberByGrade(session,memberGradeNo);
	}

	@Override
	public int insertCoupon(Map param) {
		// TODO Auto-generated method stub
		return dao.insertCoupon(session,param);
	}

	@Override
	public List<Couponlist> searchCouponList(int cPage,int numPerpage) {
		// TODO Auto-generated method stub
		return dao.searchCouponList(session,cPage,numPerpage);
	}

	@Override
	public int selectCouponListCount() {
		// TODO Auto-generated method stub
		return dao.selectCouponListCount(session);
	}
	
	@Override
	public List<Couponlist> searchCouponL(Map param) {
		// TODO Auto-generated method stub
		return dao.searchCouponL(session,param);
	}
	
	@Override
	public int updateCouponlist(Map param) {
		// TODO Auto-generated method stub
		return dao.updateCouponlist(session,param);
	}
	
	

	@Override
	public int adCouponDelete(Map param) {
		// TODO Auto-generated method stub
		return dao.adCouponDelete(session,param);
	}

	@Override
	public int getPageBarSearchCouponList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarSearchCouponList(session,param);
	}

	@Override
	public List<AuctionCate> selectAuctionList() {
		// TODO Auto-generated method stub
		return dao.selectAuctionList(session);
	}

	@Override
	public int addAuctionCate(Map param) {
		// TODO Auto-generated method stub
		return dao.addAuctionCate(session,param);
	}

	@Override
	public int deleteAuctionCate(Map param) {
		// TODO Auto-generated method stub
		return dao.deleteAuctionCate(session,param);
	}

	@Override
	public List<Delivery> selectDeliveryList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectDeliveryList(session,cPage,numPerpage);
	}

	@Override
	public int selectDeliveryCount() {
		// TODO Auto-generated method stub
		return dao.selectDeliveryCount(session);
	}

	@Override
	public int insertDelivery(Map param) {
		// TODO Auto-generated method stub
		return dao.insertDelivery(session,param);
	}

	@Override
	public int updateDelivery(Map param) {
		// TODO Auto-generated method stub
		return dao.updateDelivery(session,param);
	}

	@Override
	public int deleteDelivery(Map param) {
		// TODO Auto-generated method stub
		return dao.deleteDelivery(session,param);
	}

	@Override
	public int selectbookTotalCost() {
		// TODO Auto-generated method stub
		return dao.selectbookTotalCost(session);
	}

	@Override
	public List<EbookDatabind> orderBookAList(Map param) {
		// TODO Auto-generated method stub
		return dao.orderBookAList(session,param);
	}

	@Override
	public int getPageBarorderBookAList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarorderBookAList(session,param);
	}

	@Override
	public List<EbookDatabind> searchTextbookAList(Map param) {
		// TODO Auto-generated method stub
		return dao.searchTextbookAList(session,param);
	}

	@Override
	public int getPageBarsearchTextbookAList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarsearchTextbookAList(session,param);
	}

	@Override
	public int searchbookTotalCost(Map param) {
		// TODO Auto-generated method stub
		return dao.searchbookTotalCost(session,param);
	}

	@Override
	public int selectbookTotalCost2() {
		// TODO Auto-generated method stub
		return dao.selectbookTotalCost2(session);
	}

	@Override
	public List<EbookDatabind> orderEBookAList(Map param) {
		// TODO Auto-generated method stub
		return dao.orderEBookAList(session,param);
	}

	@Override
	public int getPageBarorderEBookAList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarorderEBookAList(session,param);
	}

	@Override
	public List<EbookDatabind> searchTextEbookAList(Map param) {
		// TODO Auto-generated method stub
		return dao.searchTextEbookAList(session,param);
	}

	@Override
	public int getPageBarsearchTextEbookAList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarsearchTextEbookAList(session,param);
	}

	@Override
	public int searchEbookTotalCost(Map param) {
		// TODO Auto-generated method stub
		return dao.searchEbookTotalCost(session,param);
	}

	@Override
	public int selectgiftTotalCost() {
		// TODO Auto-generated method stub
		return dao.selectgiftTotalCost(session);
	}

	@Override
	public List<Ngift> orderGiftAList(Map param) {
		// TODO Auto-generated method stub
		return dao.orderGiftAList(session,param);
	}

	@Override
	public int getPageBarorderGiftAList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarorderGiftAList(session,param);
	}

	@Override
	public List<Ngift> searchTextGiftAList(Map param) {
		// TODO Auto-generated method stub
		return dao.searchTextGiftAList(session,param);
	}

	@Override
	public int getPageBarsearchTextGiftAList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarsearchTextGiftAList(session,param);
	}

	@Override
	public int searchGiftTotalCost(Map param) {
		// TODO Auto-generated method stub
		return dao.searchGiftTotalCost(session,param);
	}

	@Override
	public List<BookTopThree> bookTopThree() {
		// TODO Auto-generated method stub
		return dao.bookTopThree(session);
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
