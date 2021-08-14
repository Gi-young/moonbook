package com.rar.khbook.sellbook.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookOrder {

	private String memberId;
	private int bindNo;
	private int shopinglistCount;
}
