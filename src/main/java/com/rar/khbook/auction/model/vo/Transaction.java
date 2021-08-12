package com.rar.khbook.auction.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Transaction {

	private int transactionNo;
	private String memberId;
	private Bankinfo bankinfo;
	private String transactionNumber;
	private int transactionPrice;
	private String transactionState;
	private String transactionName;
	private Date transactionTime;
	
}
