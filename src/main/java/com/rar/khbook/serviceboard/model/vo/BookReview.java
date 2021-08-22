package com.rar.khbook.serviceboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookReview {
	private int bindNo;
	private int bookReviewNo;
	private String bookContent;
	private String memberId;
	private Date writeDate;
	private int groupOrd; 
	private int groupLayer;
	private int bookScore;
}
