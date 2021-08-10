package com.rar.khbook.coupon.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class CouponAttachment {

	private int attachmentNo;
	private int couponlistNo;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
	private int downloadCount;
}
