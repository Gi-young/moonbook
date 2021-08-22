package com.rar.khbook.sellbook.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.dao.SellbookDao;
import com.rar.khbook.sellbook.model.vo.BookBoard;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;


@Service
public class SellbookServiceImpl implements SellbookService {

	@Autowired
	private SellbookDao dao;
	
	@Autowired
	private SqlSession session;
	
	

	@Override
	public SellbookDatabind selectSellbookDatabind(int bindNo) {

		return dao.selectSellbookDatabind(session, bindNo);
	}



	@Override
	public Member checkMember(String memberId) {
		
		return dao.checkMember(session, memberId);
	}



	@Override
	public SellbookDatabind selectBigView(int bindNo) {
		// TODO Auto-generated method stub
		return dao.selectBigView(session, bindNo);
	}



	@Override
	public SellbookDatabind selectBookPayment(int bindNo) {
		// TODO Auto-generated method stub
		return dao.selectBookPayment(session, bindNo);
	}

	@Override
	public SellbookDatabind bookOne(int bindNo) {
		SellbookDatabind b = dao.bookOne(session, bindNo);
		return b;
	}
	
	@Override
	public int updateSalesVolumeAdd(Map param) {
		// TODO Auto-generated method stub
		return dao.updateSalesVolumeAdd(session, param);
	}
	
	@Override
	public List<BookBoard>  selectReview(Map param) {
		// TODO Auto-generated method stub
		List<BookBoard>  gb = dao.selectReview(session, param);
		return gb;
	}
	
	@Override
	public int reviewWrite(HashMap map) {
		// TODO Auto-generated method stub
		int result = dao.reviewWrite(session,map);
		int result2 = dao.insertReviewBook(session,map);
		System.out.println("평점저장되니? :"+result2);
		return result;
	}

	@Override
	public int selectReviewAll(int bindNo) {
		// TODO Auto-generated method stub
		int totalData = dao.selectReviewAll(session, bindNo);
		return totalData;
	}



	@Override
	public int orderOne(Map param) {
		// TODO Auto-generated method stub
		 System.out.println("서비스 들어왔습니다 파람이 뭔지 볼까? : "+param);
//		 Object addPoint=param.get("paidAmount");
//		 System.out.println("애드포인트다 욘석아 : "+addPoint);
		int result = dao.insertOrder(session,param);
		if(result>0) {
			//결제성공
			System.out.println("서비스 결제성공했습니다");
			result = dao.insertBookOrderList(session,param);
			System.out.println("insertBookOrderList는 1이어야한다 : "+result);
			if(result>0) {
				result = dao.insertPayment(session,param);
				System.out.println("insertPayment는 1이어야한다 : "+result);
				result = dao.updateMemberTotalSale(session,param);
				System.out.println("updateMemberTotalSale는 1이어야한다 : "+result);
				result = dao.updateSalesVolume(session,param);
				System.out.println("updateSalesVolume는 1이어야한다 : "+result+" 이고 "+param.get("bindNo"));
				result = dao.updateStock(session,param);
				System.out.println("updateStock는 1이어야한다 : "+result+" 이고 "+param.get("bindNo"));
				result = dao.updateMemberPoint(session,param);
				System.out.println("updateMemberPoint는 1이어야한다 : "+result);
			}
		}else {
			//결제 실패
			System.out.println("서비스 결제실패했습니다");
		}
		
		
		
		return result;
	}



	@Override
	public int insertReviewBook(HashMap map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
