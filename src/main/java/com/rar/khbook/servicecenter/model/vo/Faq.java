package com.rar.khbook.servicecenter.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Faq {

	private int faqNo;
	private String faqAsked;
	private String faqAnswer;
	private String faqStatus;
	private FaqCg faqcgNum;
}
