package com.rar.khbook.sellbook.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.vo.BookBoard;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;

public interface SellbookService {
	
	SellbookDatabind selectSellbookDatabind(int bindNo);

	Member checkMember(String memberId);

	SellbookDatabind selectBigView(int bindNo);

	SellbookDatabind selectBookPayment(int bindNo);

	int updateSalesVolumeAdd(Map param);
	
	SellbookDatabind bookOne(int bindNo);
	
	List<BookBoard>  selectReview(Map param);
	
	int reviewWrite(HashMap map);

	int selectReviewAll(int bindNo);
}
