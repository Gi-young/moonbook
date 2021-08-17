package com.rar.khbook.auction.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AuctionBid {

	private int bidNo;
	private String bidId;
	private int bidPrice;
	private String bidName;
	private String bidCheck;
	private Date bidTime;
	private String time;
}
