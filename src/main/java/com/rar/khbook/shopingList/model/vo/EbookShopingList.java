package com.rar.khbook.shopingList.model.vo;

import java.util.Date;

import com.rar.khbook.ebook.model.vo.EbookDatabind;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EbookShopingList {
	
	private String memberId;
	private int bindNoE;
	private int shopingListCount;
	private Date ShopingListDate;
}
