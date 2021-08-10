package com.rar.khbook.coupon.model.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
//쿠폰의 부모
public class Couponlist {
	private int couponlistNo;
	private int couponlistMembergradeNo;
	//private double couponlistPercent;
	private int couponlistAmount;
	private String couponlistForuse;
	private int couponlistInvalid;
	private String couponlistName;
	//private int couponlistCondition;
	private String couponImg;
	private List<CouponAttachment> attachments=new ArrayList();
}
