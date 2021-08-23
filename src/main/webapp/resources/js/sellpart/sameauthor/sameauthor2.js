let author;

window.onload = function() {
	author=document.getElementById("author").innerText;
	searchBook({
		keyword: author,
		searchType: "author",
		categoryCode: "",
		pubdateOrder: "DESC",
		salesOrder: "DESC",
		priceOrder: "DESC",
		ratingOrder: "DESC",
		importancePubdate: "1",
		importanceSales: "2",
		importanceRating: "3",
		importancePrice: "4",
		dataVolume: 4
	});
	
}

