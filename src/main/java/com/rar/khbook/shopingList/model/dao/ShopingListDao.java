package com.rar.khbook.shopingList.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;


public interface ShopingListDao {

	Object insertShopingList(SqlSession session, Map param);


}
