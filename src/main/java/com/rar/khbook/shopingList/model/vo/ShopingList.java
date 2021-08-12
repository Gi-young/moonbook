package com.rar.khbook.shopingList.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShopingList {

	private int shopingListNo;
	private BookShopingList bsList;
	private String shopingListCate;
	private String memberId;
	
	
}
