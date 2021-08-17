package com.rar.khbook.serviceboard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventBoard {

	private int eventboardNo;
	private String eventboardTitle;
	private String eventboardContent;
	private String eventboardDate;
	private String memberId;
	
}
