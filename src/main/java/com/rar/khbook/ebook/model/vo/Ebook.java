package com.rar.khbook.ebook.model.vo;

import java.sql.Date;
import java.util.List;

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
public class Ebook {

	private int ebookNo;
	private String title;
	private String writer;
	private Date publishDate;
	private String filepath;
	private String coverImgFilepath;
	private List<String> likeMemberList;
	
}
