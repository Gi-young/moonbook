package com.rar.khbook.adminchart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookTopThree {

	private String bTitle;
	private int bTotalCost;
	private int bProfit;
	private int bSalesVolume;
}
