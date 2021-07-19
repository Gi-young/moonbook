package com.rar.khbook.coupon.model.vo;

import lombok.Data;

@Data
//쿠폰의 부모
public class Couponlist {
	private int couponlistNo;
	private String couponlistGrade;
	private double couponlistPercent;
	private int couponlistAmount;
	private String couponlistForuse;
	private int couponlistInvalid;
	private String couponlistName;
}
