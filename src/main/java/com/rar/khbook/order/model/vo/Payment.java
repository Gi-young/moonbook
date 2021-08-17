package com.rar.khbook.order.model.vo;

import lombok.Data;

@Data
public class Payment extends Order{

	String paymentId;
	String merchantUid;
	String payMethod;
	int paidAmount;
	long payAt;
	String pgProvider;
	String receiptUrl;
	String orderNo;
}
