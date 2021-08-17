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
public class GiftCate {

	private int giftCateCode;
	private String giftCateName;
	private int giftCateFirstRef;
	private int giftCateSecondRef;
	
	
}
