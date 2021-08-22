package com.rar.khbook.shopingList.model.service;

import java.util.List;
import java.util.Map;

import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;
import com.rar.khbook.shopingList.model.vo.BookShopingList;
import com.rar.khbook.shopingList.model.vo.EbookShopingList;
import com.rar.khbook.shopingList.model.vo.GiftShopingList;

public interface ShopingListService {


	int insertShopingList(Map param);

	List<BookShopingList> selectMyShopingListB(String memberId);

	List<EbookShopingList> selectMyShopingListE(String memberId);

	List<GiftShopingList> selectMyShopingListG(String memberId);

	List<SellbookDatabind> myShopingListB(Map param);

	List<EbookDatabind> myShopingListE(Map param);

	List<Ngift> myShopingListG(Map param);

	int insertList(Map param);

	int writeOrderT(Map param);
	
}
