package com.rar.khbook.gift.model.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class GiftBoard {
	
	private int gift_no; // 상품번호
	private int gift_board_no; // 해당 상품의 게시글 번호
	private String gift_board_content; // 게시글 내용
	private String writer; // 작성자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date write_date; // 작성일
	
	private int gift_score; // 만족도
	
	private int groupOrd; // 글 순서
	private int groupLayer; // 답글 계층
}
