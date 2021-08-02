package com.rar.khbook.ebook.model.vo;

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
public class EbookDatabind {

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
	private int stock;
	private int salesVolume;
	private int rating;
	private int ebookRating;
	private int ebookSalesVolume;
	private int primeCost;
	private String discount;
	private Ebook ebook;
}
