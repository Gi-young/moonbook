package com.rar.khbook.shopingList.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.rar.khbook.serviceboard.model.vo.NoticeBoard;


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


	//List<HashMap> list = session.selectList("", param)

	
}
