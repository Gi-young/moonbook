package com.rar.khbook.coupon.model.vo;

import java.sql.Date;
import java.util.List;

import com.rar.khbook.order.model.vo.BookOrderList;
import com.rar.khbook.order.model.vo.EbookOrderList;
import com.rar.khbook.order.model.vo.GiftOrderList;

import lombok.Data;

@Data
public class OrderWithCoupon extends Coupon{

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
