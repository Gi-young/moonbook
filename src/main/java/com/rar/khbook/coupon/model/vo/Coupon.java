package com.rar.khbook.coupon.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
//쿠폰리스트를 상속받음
public class Coupon extends Couponlist{

	private int couponNo;
	private Date couponInvalid;
	private String couponMemberId;
	private int couponCouponlistNo;
	private String couponCanuse;
}
