let searchFrm = document.getElementById("searchFrm");

window.onload = function() {
	searchEbook({
		keyword: "",
		searchType: "title",
		categoryCode: "100020020",
		pubdateOrder: "DESC",
		salesOrder: "DESC",
		priceOrder: "DESC",
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

	searchEbook(searchData);
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

let orders = document.querySelectorAll("#searchFrm input[type=number]");
orders.forEach((v, i) => {
	v.addEventListener("change", (e) => {
		orders.forEach((w, j) => {
			if(w != v) {
				w.value = "";
			}
		});
	});
});