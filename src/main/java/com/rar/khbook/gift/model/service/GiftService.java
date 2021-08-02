package com.rar.khbook.gift.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.member.model.vo.Member;


public interface GiftService {

	@Autowired
	Member searchMember(String memberId);
}
