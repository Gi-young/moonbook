package com.rar.khbook.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import com.rar.khbook.adminchart.model.vo.BookTopThree;
import com.rar.khbook.adminchart.model.vo.EbookTopThree;
import com.rar.khbook.adminchart.model.vo.GiftTopThree;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.delivery.model.vo.Delivery;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.servicecenter.model.vo.Faq;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Member> selectMemberList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectMemberList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectMemberCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberCount");
	}

	@Override
	public int memberDelete(SqlSession session, String memberId) {
		// TODO Auto-generated method stub
		return session.delete("member.memberDelete",memberId);
	}

	@Override
	public int memberUpdate(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("member.memberUpdate",param);
	}

	@Override
	public List<Member> memberHowT(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		
		return session.selectList("member.memberHowT",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	

	@Override
	public int getPageBarOrderedMemberList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.getPageBarOrderedMemberList",param);
	}

	@Override
	public List<Member> memberHowT2(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("member.memberHowT2",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	
	@Override
	public int getPageBarSearchTextMemberList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.getPageBarSearchTextMemberList",param);
	}

	@Override
	public List<Order> selectOrderList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectOrderList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	

	@Override
	public int selectOrderCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectOrderCount");
	}

	@Override
	public int insertProduct1(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertProduct1",param);
	}

	@Override
	public int insertProduct3(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertProduct3",param);
	}

	@Override
	public int updateProduct1(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateProduct1",param);
	}
	@Override
	public int updateProduct3(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateProduct3",param);
	}

	@Override
	public EbookDatabind searchBringPrice(SqlSession session, int bindNo) { // 책가격 가져오기
		// TODO Auto-generated method stub
		return session.selectOne("admin.searchBringPrice",bindNo);
	}
	@Override
	public EbookDatabind checkStock1(SqlSession session, int bindNo) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.checkStock1",bindNo);
	}
	
	@Override
	public Ngift checkStock3(SqlSession session, int gift_no) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.checkStock3",gift_no);
	}

	@Override
	public int outputProduct1(SqlSession session, Map param) { //출고 book
		// TODO Auto-generated method stub
		return session.update("admin.outputProduct1",param);
	}

	@Override
	public int updateSalesVolume1(SqlSession session, Map param) { //출고후 판매량 +update 로직 book
		// TODO Auto-generated method stub
		return session.update("admin.updateSalesVolume1",param);
	}
	//잠만 ebook은 입고는 공통인데 출고가 다름 ebook은 판매량+1만 하면됨
	
	@Override
	public int updateSalesVolume2(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateSalesVolume2",param);
	}
	
	@Override
	public int outputAndupdateSalesVolume3(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.outputAndupdateSalesVolume3",param);
	}

	//재고현황
	@Override
	public List<EbookDatabind> selectEbookDatabindList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectEbookDatabindList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectEbookDataCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectEbookDataCount");
	}
	//상품 재고현황
	@Override
	public List<Ngift> selectGiftList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectGiftList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectGiftCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectGiftCount");
	}

	@Override
	public List<EbookDatabind> orderStockList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		
		return session.selectList("admin.orderStockList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	@Override
	public int getPageBarOrderList(SqlSession session,Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarOrderList",param);
	}

	@Override
	public List<Ngift> orderStockList3(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.orderStockList3",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	@Override
	public int getPageBarOrderList3(SqlSession session,Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarOrderList3",param);
	}

	@Override
	public List<EbookDatabind> searchTextStockList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.searchTextStockList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	@Override
	public int getPageBarTextStockList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarTextStockList",param);
	}

	@Override
	public List<Ngift> searchTextStockList3(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.searchTextStockList3",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	@Override
	public int getPageBarTextStockList3(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarTextStockList3",param);
	}

	@Override
	public int stockTUpdate(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.stockUpdate",param);
	}

	@Override
	public int stockTUpdate2(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.stockUpdate2",param);
	}

	@Override
	public int stockTDelete(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("admin.stockTDelete",param);
	}

	@Override
	public int stockTDelete2(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("admin.stockTDelete2",param);
	}

	@Override
	public int addCouponList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.addCouponList",param);
	}
	
//	@Override
//	public int insertAttachment(SqlSession session, CouponAttachment a) {
//		// TODO Auto-generated method stub
//		return session.insert("admin.insertAttachment",a);
//	}

	@Override
	public Member searchGrade(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.searchGrade",param);
	}

	@Override
	public Couponlist searchCoupon(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.searchCoupon",param);
	}
	
	

	@Override
	public Couponlist searchInvalidNImg(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.searchInvalidNImg",param);
	}

	@Override
	public int inputCouponAdminOne(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.inputCouponAdminOne",param);
	}

	
	

	@Override
	public List<HashMap> searchMemberByGrade(SqlSession session, int memberGradeNo) {
		// TODO Auto-generated method stub
		return session.selectList("admin.searchMemberByGrade",memberGradeNo);
	}

	@Override
	public int insertCoupon(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertCoupon",param);
	}

	@Override
	public List<Couponlist> searchCouponList(SqlSession session,int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.searchCouponlist",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectCouponListCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectCouponListCount");
	}
	

	@Override
	public List<Couponlist> searchCouponL(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.searchCouponL",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int getPageBarSearchCouponList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarSearchCouponList",param);
	}
	
	@Override
	public int adCouponDelete(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("admin.adCouponDelete",param);
	}

	@Override
	public int updateCouponlist(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateCouponlist",param);
	}

	@Override
	public List<AuctionCate> selectAuctionList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectAuctionList");
	}

	@Override
	public int addAuctionCate(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.addAuctionCate",param);
	}

	@Override
	public int deleteAuctionCate(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteAuctionCate",param);
	}

	@Override
	public List<Delivery> selectDeliveryList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectDeliveryList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectDeliveryCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectDeliveryCount");
	}

	@Override
	public int insertDelivery(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertDelivery",param);
	}

	@Override
	public int updateDelivery(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateDelivery",param);
	}

	@Override
	public int deleteDelivery(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteDelivery",param);
	}

	@Override
	public int selectbookTotalCost(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectbookTotalCost");
	}

	@Override
	public List<EbookDatabind> orderBookAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.orderBookAList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int getPageBarorderBookAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		
		
		return session.selectOne("admin.getPageBarorderBookAList",param);
	}

	@Override
	public List<EbookDatabind> searchTextbookAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.searchTextbookAList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int getPageBarsearchTextbookAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarsearchTextbookAList",param);
	}

	@Override
	public int searchbookTotalCost(SqlSession session,Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.searchbookTotalCost",param);
	}

	@Override
	public int selectbookTotalCost2(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectbookTotalCost2");
	}

	@Override
	public List<EbookDatabind> orderEBookAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.orderEBookAList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int getPageBarorderEBookAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarorderEBookAList",param);
	}

	@Override
	public List<EbookDatabind> searchTextEbookAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.searchTextEbookAList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int getPageBarsearchTextEbookAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarsearchTextEbookAList",param);
	}

	@Override
	public int searchEbookTotalCost(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.searchEbookTotalCost",param);
	}

	@Override
	public int selectgiftTotalCost(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectgiftTotalCost");
	}

	@Override
	public List<Ngift> orderGiftAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.orderGiftAList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int getPageBarorderGiftAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarorderGiftAList",param);
	}

	@Override
	public List<Ngift> searchTextGiftAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.searchTextGiftAList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int getPageBarsearchTextGiftAList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarsearchTextGiftAList",param);
	}

	@Override
	public int searchGiftTotalCost(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.searchGiftTotalCost",param);
	}

	@Override
	public List<BookTopThree> bookTopThree(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.bookTopThree");
	}

	@Override
	public List<EbookTopThree> ebookTopThree(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.ebookTopThree");
	}

	@Override
	public List<GiftTopThree> giftTopThree(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.giftTopThree");
	}

	@Override
	public List<Faq> selectFaqList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectFaqList");
	}

	@Override
	public List<Faq> selectFaqReplyNo(SqlSession session,Map param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectFaqReplyNo",param);
	}

	@Override
	public int updateFaqAnswer(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateFaqAnswer",param);
	}

	@Override
	public int deleteFaq(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteFaq",param);
	}

	@Override
	public List<Order> searchTextSaleList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.searchTextSaleList",param,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int getPageBarTextSaleList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarTextSaleList",param);
	}

	@Override
	public List<Order> orderSaleList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		return session.selectList("admin.orderSaleList", param, new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int getPageBarorderSaleList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.getPageBarorderSaleList");
	}
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
