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
public class Gift {
	
	private int gift_no;
	private String gift_img;
	private String gift_title;
	private String gift_content;
	private int gift_price;
	private String gift_maker;
	private String gift_made;
	private String gift_import;
	private String gift_as;
	private String gift_size;
	private int gift_count;
	private String gift_forSale;
	private String gift_rowPrice;
//	private int gift_safecount;
//	private int gift_giftcate_code;
	private String gift_discount;
	private int gift_salesVolume;
	private GiftCate giftCate;
}
