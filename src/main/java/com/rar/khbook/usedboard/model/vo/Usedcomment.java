package com.rar.khbook.usedboard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Usedcomment {
	private int usedcomment_No;
	private String usedcomment_Content;
	private Date usedcomment_Date;
	private int usedcomment_Level;
	private String usedcomment_UserId;
	private int usedcomment_CommentRef;
	private int usedbaord_No;
}
