package com.rar.khbook.usedboard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Usedboardfile {
	private String usedboardfile_Oriname;
	private String usedboardfile_Rename;
	private int usedboard_No;
	private int usedboardfile_No;
	private String memberId;
}
