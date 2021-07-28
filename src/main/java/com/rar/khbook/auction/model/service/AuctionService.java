package com.rar.khbook.auction.model.service;

import java.util.List;
import java.util.Map;

import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionCate;

public interface AuctionService {

	int auctionWriteEnd(Auction a);

	List<AuctionCate> selectauctioncate(String level1);

	AuctionCate selectauctioncateCode(Map param);

	List<Auction> selectTimeList(int cPage, int numPerpage);

	int auctionCount();
}
