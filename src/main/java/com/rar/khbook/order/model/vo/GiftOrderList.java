package com.rar.khbook.order.model.vo;

import com.rar.khbook.gift.model.vo.Ngift;

import lombok.Data;

@Data
public class GiftOrderList extends Ngift{

	private String orderNo;
	private int ngiftNo;
	private int orderVolume;
}
