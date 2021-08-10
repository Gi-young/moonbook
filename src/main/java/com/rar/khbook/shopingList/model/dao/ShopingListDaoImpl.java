package com.rar.khbook.shopingList.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class ShopingListDaoImpl implements ShopingListDao {


	@Override
	public Object insertShopingList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("ShopingList.insertShopingList",param);
	}


	
}
