package com.rar.khbook.sellbook.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Usedboard {
	private int usedboard_No;
	private String usedboard_Title;
	private String usedboard_Content;
	private Date usedboard_Date;
	private int usedboard_Price;
	private String usedboard_State;
	private String[] usedboard_Category;
	private String member_Id;
	private String usedboard_BookTitle;
	private List<Usedboardfile> usedboardfiles=new ArrayList();
}
