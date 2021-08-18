package com.rar.khbook.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GiftOrder {

	private String memberId;
	private int giftNo;
	private int shopingListCount;
	
}
