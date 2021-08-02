package com.rar.khbook.gift.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rar.khbook.member.model.vo.Member;


public interface GiftDao {

	@Autowired
	Member searchMember(String memberId, SqlSession session);
}
