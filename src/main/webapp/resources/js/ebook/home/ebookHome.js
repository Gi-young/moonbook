let searchFrm = document.getElementById("searchFrm");

window.onload = function() {
	searchEbook({
		keyword: "",
		searchType: "title",
		categoryCode: "100020020",
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

searchFrm.addEventListener("submit", (e) => {
	e.preventDefault();
	
	let searchData = $(e.target).serialize();

	let checkSet = new Set();

	document.querySelectorAll("form#searchFrm input[name^=importance]").forEach((v, i) => {
		checkSet.add(Number(v.value));
	});

	console.log(checkSet);

	if (checkSet.has(1) && checkSet.has(2) && checkSet.has(3) && checkSet.has(4)) {
		searchEbook(searchData);
	} else {
		alert("각 정렬 기준의 중요도를 올바르게 배치해주세요(1 ~ 4까지 겹치지 않고 배치)");
	}
});

function searchEbook(searchData) {
	$.ajax({
		url: contextPath + "/ebook/search.do",
		type: "post",
		data: searchData,
		dataType: "json",
		success: data => {
			console.log(data);
			
			let main = document.getElementsByTagName("main")[0];

			document.querySelectorAll("main div.ebookItem").forEach((v, i) => {
				v.remove();
			});

			data.forEach((v,i) => {
				let ebookItem = document.createElement("div");
				ebookItem.style.backgroundColor = "white";
				ebookItem.style.width = "180px";
				ebookItem.style.height = "230px";
				ebookItem.classList.add("ebookItem");
				ebookItem.addEventListener("click", () => {
					location.assign(contextPath + "/ebook/pageEbookDetail.do");
				});
				
				let coverImg = document.createElement("img");
				coverImg.setAttribute("src", v.image);
				coverImg.style.width = "100px";

				let title = document.createElement("div");
				title.classList.add("ebookTitle");
				let titleText = v.title.replaceAll("<b>", "").replaceAll("</b>", "");
				titleText = titleText.substring(0, titleText.indexOf("(") === -1 ? titleText.length : titleText.indexOf("("));
				titleText = titleText.substring(0, titleText.indexOf("+") === -1 ? titleText.length : titleText.indexOf("+"));
				titleText = titleText.substring(0, titleText.indexOf("&") === -1 ? titleText.length : titleText.indexOf("&"));
				title.innerText = titleText;

				let author = document.createElement("div");
				author.classList.add("ebookAuthor");
				author.innerText = v.author;

				let publisher = document.createElement("div");
				publisher.classList.add("ebookPublisher");
				publisher.innerText = v.publisher

				ebookItem.appendChild(coverImg);
				ebookItem.appendChild(title);
				ebookItem.appendChild(author);
				ebookItem.appendChild(publisher);
				main.appendChild(ebookItem);
			});
			
		}
	});
}