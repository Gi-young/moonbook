package com.rar.khbook.shopingList.model.service;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.rar.khbook.shopingList.model.dao.ShopingListDao;


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
		
		try {
			int result=dao.insertShopingList(session, param);
			System.out.println("두번째파람"+param);
				if(result>0) {
					result=dao.insertShopingListBook(session, param);
					System.out.println("세번째파람"+param);
					
				}else return -1;
					
			}catch(RuntimeException e) {

			}
			return 1;
		}
	

	
	
}
