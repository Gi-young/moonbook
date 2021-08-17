package com.rar.khbook.shopingList.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.serviceboard.model.vo.NoticeBoard;


public interface ShopingListDao {

	int insertShopingList(SqlSession session, Map param);

	int insertShopingListBook(SqlSession session, Map param);

	

}
