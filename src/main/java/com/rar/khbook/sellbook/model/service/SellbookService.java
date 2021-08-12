package com.rar.khbook.sellbook.model.service;

import java.util.Map;

import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;

public interface SellbookService {
	
	SellbookDatabind selectSellbookDatabind(int bindNo);

	Member checkMember(String memberId);

	SellbookDatabind selectBigView(int bindNo);

	SellbookDatabind selectBookPayment(int bindNo);

	int updateSalesVolumeAdd(Map param);


}
