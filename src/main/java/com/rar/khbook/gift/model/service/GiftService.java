package com.rar.khbook.gift.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;


public interface GiftService {
	
	Member searchMember(String memberId);
		
	List<Ngift> giftAll();
	
	int insertGift(Map param);
	
	Ngift giftOne(int giftNo);
	
	List<GiftBoard>  selectReview(int giftNo);
	
	int reviewWrite(HashMap map);

	int selectReviewAll();
}
