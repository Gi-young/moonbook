window.onload = function() {
	searchBook({
		keyword: "",
		searchType: "title",
		categoryCode: "300050",
		pubdateOrder: "DESC",
		salesOrder: "DESC",
		priceOrder: "DESC",
		ratingOrder: "DESC",
		importancePubdate: "1",
		importanceSales: "2",
		importanceRating: "3",
		importancePrice: "4",
		dataVolume: 100
	});
}
