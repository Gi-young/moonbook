package com.rar.khbook.shopingList.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import com.rar.khbook.serviceboard.model.vo.NoticeBoard;

import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;
import com.rar.khbook.shopingList.model.vo.BookShopingList;
import com.rar.khbook.shopingList.model.vo.EbookShopingList;
import com.rar.khbook.shopingList.model.vo.GiftShopingList;



public interface ShopingListDao {

	int insertShopingList(SqlSession session, Map param);

	int insertShopingListBook(SqlSession session, Map param);


	

	List<BookShopingList> selectMyShopingListB(SqlSession session, String memberId);

	List<EbookShopingList> selectMyShopingListE(SqlSession session, String memberId);

	List<GiftShopingList> selectMyShopingListG(SqlSession session, String memberId);

	List<SellbookDatabind> myShopingListB(SqlSession session, Map param);

	List<EbookDatabind> myShopingListE(SqlSession session, Map param);

	List<Ngift> myShopingListG(SqlSession session, Map param);

	int insertMember(SqlSession session, Map param);

	int insertBook(SqlSession session, Map param);

	int insertEbook(SqlSession session, Map param);

	int insertGift(SqlSession session, Map param);

	int writeOrderT(SqlSession session, Map param);

	int writePurchaseLog(SqlSession session, Map param);

	int bookSalesVolumeAdd(SqlSession session, Map param);

	int eBookSalesVolumeAdd(SqlSession session, Map param);

	int giftSalesVolumeAdd(SqlSession session, Map param);

	int deleteBook(SqlSession session, Map param);

	int deleteEbook(SqlSession session, Map param);

	int deleteGift(SqlSession session, Map param);





}
