package com.rar.khbook.shopingList.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.dao.SellbookDao;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;
import com.rar.khbook.shopingList.model.dao.ShopingListDao;


@Service
public class ShopingListServiceImpl implements ShopingListService {

	@Autowired
	private ShopingListDao dao;
	
	@Autowired
	private SqlSession session;





	@Override
	public Object insertShopingList(Map param) {
		// TODO Auto-generated method stub
		return dao.insertShopingList(session, param);
	}


	
	
}
