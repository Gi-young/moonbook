package com.rar.khbook.order.model.vo;



public class Order {
	private String orderNo;
	private int orderCount;
	private int orderPrice;
	private int orderDeliveryFee;
	private String orderPaymentId;
	private int orderPaidat; //결제 날짜 iamport api 에서 unix timestemp형식(정수)으로 줌 
	private String orderPaidMethod;
	private String orderStatus;
	private int orderPoint;
	private String orderMemberId;
	private int orderBookNo;
	private int orderGiftNo;
	private int orderCouponNo;
	
}
