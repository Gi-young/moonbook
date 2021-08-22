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
	public int insertShopingList(@RequestParam Map param) {
		// TODO Auto-generated method stub
		System.out.println("없어이건"+param);
		int result=dao.insertShopingList(session, param);
		System.out.println("없긴 뭐가없어! 1나와라! : "+result);
		return result;
/*		try {
			System.out.println("두번째파람"+param);
				if(result>0) {
					result=dao.insertShopingListBook(session, param);
					System.out.println("세번째파람"+param);
					
				}else return -1;
					
			}catch(RuntimeException e) {

			}
			return 1;*/
		}
		
	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<BookShopingList> selectMyShopingListB(String memberId) {
//		Map<String,Object> param = new HashMap();
//		List<Object> list = new ArrayList<Object>();
		
		List<BookShopingList> bList = dao.selectMyShopingListB(session, memberId);
	
//		for(int i=0; i<bList.size(); i++) {
//			//bList.get(i).getBindNoB();
//			param.put("bNum"+i, bList.get(i).getBindNoB());
//		}
			
			//List<SellbookDatabind> book= dao.myShopingListB(session, param);	
		
		return bList;
	}


	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<EbookShopingList> selectMyShopingListE(String memberId) {
//		Map<String,Object> param = new HashMap();
//		List<Object> list = new ArrayList<Object>();
		
		List<EbookShopingList> eList = dao.selectMyShopingListE(session, memberId);
		
//		for(int i=0; i<eList.size(); i++) {
//			param.put("eNum"+i, eList.get(i).getBindNoE());
//		}	
		//List<EbookDatabind> eBook = dao.myShopingListE(session, param);
					
		return eList;
	}

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<GiftShopingList> selectMyShopingListG(String memberId) {
//		Map<String,Object> param = new HashMap();
//		List<Object> list = new ArrayList<Object>();
		
		List<GiftShopingList> gList = dao.selectMyShopingListG(session, memberId);
			//System.out.println("기프트리스트 영번째 기프트넘버 : "+gList.get(0).getGiftNo());
//		for(int i=0; i<gList.size(); i++) {
//			param.put("gNum"+i, gList.get(i).getGiftNo());
//		}
		
//		if(gList != null) {
//			List<Ngift> gift = dao.myShopingListG(session, param);
//			list.addAll(gList);
//			list.addAll(gift);
//		}else {
//			System.out.println("접근 오류");
//		}
		
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
	

	
	
}
