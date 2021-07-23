package com.rar.khbook.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member extends Membergrade {

	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberAddress;
	private String memberGender;
	private String memberBirth;
	private int memberPoint;
	private Date memberRegiDate;
	private int memberGradeNo;
	private int memberTotalSale;
	private int memberVisits;
	
}
