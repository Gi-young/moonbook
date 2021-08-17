package com.rar.khbook.shopingList.model.vo;

import java.util.Date;

import com.rar.khbook.gift.model.vo.Ngift;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GiftShopingList {
	
	private String memberId;
	private int giftNo;
	private int shopingListCount;
	private Date shopingListDate;
}
