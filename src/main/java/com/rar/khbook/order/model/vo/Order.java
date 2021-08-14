package com.rar.khbook.order.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Order {

	String oderNo;
	int orderCount;
	int orderDeliveryfee;
	String orderMemberId;
	int orderCouponNo;
	String orderStatus;
	int orderPoint;
	int orderTotalprice;
	Date orderDate;
	String orderName;
	String orderPhone;
	String orderEmail;
	String orderAddress;
	List<EbookOrderList> ebookOrderList;
}
