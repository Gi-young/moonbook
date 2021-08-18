package com.rar.khbook.shopingList.model.vo;

import java.util.Date;

import com.rar.khbook.sellbook.model.vo.SellbookDatabind;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookShopingList{

	private String memberId;
	private int bindNoB;
	private int shopingListCount;
	private Date shopingListDate;
}
