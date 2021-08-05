package com.rar.khbook.auction.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Auction {

	private int auctionNo;
	private String memberId;
	private int auctioncateCode;
	private String auctionName;
	private String auctionEx;
	private Date startDate;
	private Date endDate;
	private int startPrice;
	private int buyNow;
	private int priceUnit;
	private String auctionState;
	private String[] auctionImg;
	private List<AuctionCate> auctioncate;
	private List<AuctionBid> auctionbid;
	private int count;
	private String sellerState;
	private String buylerState;
	private String auctionSize;
	private String auctionQuality;
	//실험용
	private String state;
}
