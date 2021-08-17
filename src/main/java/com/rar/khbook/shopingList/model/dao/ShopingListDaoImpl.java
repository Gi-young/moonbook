package com.rar.khbook.shopingList.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

<<<<<<< HEAD
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;
=======
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;
import com.rar.khbook.shopingList.model.vo.BookShopingList;
import com.rar.khbook.shopingList.model.vo.EbookShopingList;
import com.rar.khbook.shopingList.model.vo.GiftShopingList;
>>>>>>> pwjPPAP


@Repository
public class ShopingListDaoImpl implements ShopingListDao {


	@Override
	public int insertShopingList(SqlSession session, @RequestParam Map param) {
		// TODO Auto-generated method stub
		return session.update("shopingList.insertShopingList",param);
	}

	@Override
	public int insertShopingListBook(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("shopingList.insertShopingListBook",param) ;
	}

<<<<<<< HEAD

	//List<HashMap> list = session.selectList("", param)

=======
	@Override
	public List<BookShopingList> selectMyShopingListB(SqlSession session, String memberId) {
	
		return session.selectList("shopingList.selectMyShopingListB", memberId);
	}

	@Override
	public List<EbookShopingList> selectMyShopingListE(SqlSession session, String memberId) {
		
		return session.selectList("shopingList.selectMyShopingListE", memberId);
	}

	@Override
	public List<GiftShopingList> selectMyShopingListG(SqlSession session, String memberId) {
		
		return session.selectList("shopingList.selectMyShopingListG", memberId);
	}

	@Override
	public List<SellbookDatabind> myShopingListB(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("shopingList.myShopingListB", param);
	}

	@Override
	public List<EbookDatabind> myShopingListE(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("shopingList.myShopingListE", param);
	}

	@Override
	public List<Ngift> myShopingListG(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("shopingList.myShopingListG", param);
	}
	
	
>>>>>>> pwjPPAP
	
}
