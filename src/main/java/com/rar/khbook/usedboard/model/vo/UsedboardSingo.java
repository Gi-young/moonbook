package com.rar.khbook.usedboard.model.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class UsedboardSingo {
	private int usedboardsingo_No;
	private int usedboardsingo_BoardNo;
	private String usedboardsingo_Id;
	private List<Usedboard> usedboards=new ArrayList();
}
