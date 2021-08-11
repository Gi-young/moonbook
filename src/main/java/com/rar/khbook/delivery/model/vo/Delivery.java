package com.rar.khbook.delivery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class Delivery {
	private int deliveryNo;
	private int deliveryPrice;
	private String deliveryStatus;
}
