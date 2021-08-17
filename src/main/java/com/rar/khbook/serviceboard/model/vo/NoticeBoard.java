package com.rar.khbook.serviceboard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeBoard {

	private int noticeboardNo;
	private String noticeboardTitle;
	private String noticeboardContent;
	private String noticeboardDate;
	private String memberId;
	
}
