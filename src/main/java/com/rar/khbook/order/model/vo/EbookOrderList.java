package com.rar.khbook.order.model.vo;

import com.rar.khbook.ebook.model.vo.EbookDatabind;

import lombok.Data;

@Data
public class EbookOrderList extends EbookDatabind {

	private String orderNo;
	private int bindNo;
	private int orderVolume;
}
