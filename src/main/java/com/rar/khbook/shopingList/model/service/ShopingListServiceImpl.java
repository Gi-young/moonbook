package com.rar.khbook.shopingList.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;
import com.rar.khbook.shopingList.model.dao.ShopingListDao;
import com.rar.khbook.shopingList.model.vo.BookShopingList;
import com.rar.khbook.shopingList.model.vo.EbookShopingList;
import com.rar.khbook.shopingList.model.vo.GiftShopingList;


@Service
public class ShopingListServiceImpl implements ShopingListService {

	

	@Autowired
	private ShopingListDao dao;
	
	@Autowired
	private SqlSession session;

	
	
	@Override
	public int salesVolumeAddBook(Map param) {
		// TODO Auto-generated method stub
		
		int result = dao.salesVolumeAddBook(session, param);
		if(result>0) {
//			다회용 재고 업데이트
			int result2 = dao.updateStockB(session, param);
//			일회용 = 멤버에 추가라서 한번만 실행
			int result3 = dao.updateMemberPP(session, param);
//			일회용 = 멤버에 추가라서 한번만 
			int result4 = dao.updateMemberPoint(session, param);
//			다회용 = 각 구매내역에 추가
			int result5 = dao.updatePurchaseListB(session, param);
			
			int result6 = dao.deleteBook(session, param);
			
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public int salesVolumeAddEbook(Map param) {
		// TODO Auto-generated method stub
		
		int result = dao.salesVolumeAddEbook(session,param);
		if(result>0) {
//			ebook은 재고 없음
			
//			다회용 = 각 구매내역에 추가
			int result5 = dao.updatePurchaseListE(session, param);
			
			int result6 = dao.deleteEbook(session, param);
			return 1;
		}else {
			return 0;
			
		}
	}

	@Override
	public int salesVolumeAddGift(Map param) {
		// TODO Auto-generated method stub
		
		int result = dao.salesVolumeAddGift(session, param);
	    System.out.println("제발 그만"+result);
		if(result>0) {
//			다회용 재고 업데이트
			int result2 = dao.updateStockG(session, param);
			System.out.println(result2);
//			다회용 = 각 구매내역에 추가
			int result5 = dao.updatePurchaseListG(session, param);
			System.out.println(result5);
			int result6 = dao.deleteGift(session, param);
			System.out.println(result6);
			return 1;
		}else {
			
			return 0;
			
		}
	}

	@Override
	public int deleteBook(Map param) {
		// TODO Auto-generated method stub
		return dao.deleteBook(session, param);
	}

	@Override
	public int deleteEbook(Map param) {
		// TODO Auto-generated method stub
		return dao.deleteEbook(session, param);
	}

	@Override
	public int deleteGift(Map param) {
		// TODO Auto-generated method stub
		return dao.deleteGift(session, param);
	}


	@Override
	public int writePurchaseLog(Map param) {
		// TODO Auto-generated method stub
		
		int result1 = dao.writeOrderT(session, param);
	
		if(result1 > 0) {
			int result = dao.writePurchaseLog(session, param);
			return 1;
		}else {
			return 0;
		}
		
		
	}

	@Override
	public int insertShopingList(@RequestParam Map param) {
		// TODO Auto-generated method stub
		int result=dao.insertShopingList(session, param);
		return result;
		}
		
	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<BookShopingList> selectMyShopingListB(String memberId) {
		
		List<BookShopingList> bList = dao.selectMyShopingListB(session, memberId);
	
		return bList;
	}


	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<EbookShopingList> selectMyShopingListE(String memberId) {
		
		List<EbookShopingList> eList = dao.selectMyShopingListE(session, memberId);
		return eList;
	}

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<GiftShopingList> selectMyShopingListG(String memberId) {
		List<GiftShopingList> gList = dao.selectMyShopingListG(session, memberId);
		
		return gList;
	}

	@Override
	public List<SellbookDatabind> myShopingListB(Map param) {
		// TODO Auto-generated method stub
		List<SellbookDatabind> book = dao.myShopingListB(session, param);
		return book;
	}

	@Override
	public List<EbookDatabind> myShopingListE(Map param) {
		// TODO Auto-generated method stub
		List<EbookDatabind> eBook = dao.myShopingListE(session, param);
		return eBook;
	}

	@Override
	public List<Ngift> myShopingListG(Map param) {
		// TODO Auto-generated method stub
		List<Ngift> gift = dao.myShopingListG(session, param);
		return gift;
	}

	@Override
	public int insertList(Map param) {
		// TODO Auto-generated method stub
		
		int resultB = dao.insertBook(session, param);
		int resultE = dao.insertEbook(session, param);
		int resultG = dao.insertGift(session, param);

		int resultM = dao.insertMember(session, param);
		
		return 0;
	}
	

	
	
}
