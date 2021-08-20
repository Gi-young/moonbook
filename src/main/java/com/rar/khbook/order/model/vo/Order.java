package com.rar.khbook.order.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Order {

	private String orderNo;
	private int orderCount;
	private int orderDeliveryfee;
	private String orderMemberId;
	private int orderCouponNo;
	private String orderStatus;
	private int orderPoint;
	private int orderTotalprice;
	private Date orderDate;
	private String orderName;
	private String orderPhone;
	private String orderEmail;
	private String orderAddress;
	private List<EbookOrderList> ebookOrderList;
	private List<BookOrderList> bookOrderList;
	private List<GiftOrderList> giftOrderList;
}
