package com.rar.khbook.sellbook.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class SellbookDatabind {
	private int bindNo;
	private String title;
	private String author;
	private String image;
	private int price;
	private String isbn;
	private Date pubdate;
	private String publisher;
	private String description;
	private String link;
	private String categoryCode;
	private int salesVolume;
	private int rating;
	private int stock;
}
