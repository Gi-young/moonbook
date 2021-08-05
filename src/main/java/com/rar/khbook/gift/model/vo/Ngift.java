package com.rar.khbook.gift.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Ngift {
	
	private int gift_no;
	private String gift_title;
	private String gift_img;
	private int gift_price;
	private String gift_brand;
	private String gift_maker;
	private int gift_count;
	private int gift_productType;
	private GiftCate gift_category;
	private int gift_rowPrice;
	private String gift_discount;
	private int gift_salesVolume;
	
}
