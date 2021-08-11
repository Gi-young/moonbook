package com.rar.khbook.order.model.vo;

import java.util.List;

import com.rar.khbook.ebook.model.vo.EbookDatabind;

import lombok.Data;

@Data
public class EbookPurchaseHistory implements Order {

	private int historyNo;
	private String impUid;
	private String merchantUid;
	private String memberId;
	private String payMethod;
	private int paidAmount;
	private String paidAt;
	private String pgProvider;
	private String receiptUrl;
	private List<EbookDatabind> purchaseEbookNoList;
}
