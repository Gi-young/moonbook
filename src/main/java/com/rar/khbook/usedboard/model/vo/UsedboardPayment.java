package com.rar.khbook.usedboard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UsedboardPayment {
	private int usedboardPayment_No;
	private String usedboardPayment_Title;
	private Date usedboardPayment_Date;
	private String usedboardPayment_State;
	private int usedboardPayment_Price;
	private int usedboardPayment_BoardNo;
	private String usedboardPayment_Cancel;
	private String member_Id;
	private String imp_uid;
	private String merchant_uid;
}
