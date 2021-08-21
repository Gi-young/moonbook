let contextPath = document.getElementById("contextPath").value;

let searchFrm = document.getElementById("searchFrm");
let categoryCode = document.getElementById("categoryCode").value;
let searchData;

searchData = {
    keyword: "",
    searchType: "title",
    categoryCode: categoryCode,
    pubdateOrder: "DESC",
    salesOrder: "DESC",
    priceOrder: "DESC",
    ratingOrder: "DESC",
    importancePubdate: "3",
    importanceSales: "1",
    importanceRating: "2",
    importancePrice: "4"
};

window.onload = function() {
	searchEbook();

	getCategories();
}

searchFrm.addEventListener("submit", (e) => {
	e.preventDefault();

	let queryStr = $(e.target).serialize();

	searchData = new Object();
	
	queryStr.substring(queryStr.indexOf("?") + 1).split("&").forEach((v, i) => {
		searchData[v.split("=")[0]] = decodeURIComponent(v.split("=")[1]);
	});

	let checkSet = new Set();

	document.querySelectorAll("form#searchFrm input[name^=importance]").forEach((v, i) => {
		checkSet.add(Number(v.value));
	});

	console.log(checkSet);

	if (checkSet.has(1) && checkSet.has(2) && checkSet.has(3) && checkSet.has(4)) {
		searchEbook(1, 12);
	} else {
		alert("각 정렬 기준의 중요도를 올바르게 배치해주세요(1 ~ 4까지 겹치지 않고 배치)");
	}
});

function searchEbook(cPage, numPerPage) {
	if (typeof searchData === "object") {
		searchData.cPage = cPage;
		searchData.numPerPage = numPerPage;
	}
	
	$.ajax({
		url: contextPath + "/ebook/newSearchForPaperBook.do",
		type: "post",
		data: searchData,
		dataType: "json",
		success: data => {
			
			let searchResult = document.querySelector("div.search-result");
			let emptyNotice = document.querySelector("div.empty-notice");

			if (emptyNotice) {
				emptyNotice.remove();
			}

			document.querySelectorAll("main div.ebookItem").forEach((v, i) => {
				v.remove();
			});

			data.forEach((v,i) => {
				if (v.IMAGE !== null) {
					let ebookItem = document.createElement("div");
					ebookItem.style.width = "180px";
					ebookItem.style.height = "260px";
					ebookItem.classList.add("ebookItem");
				
					ebookItem.addEventListener("click", () => {
						location.assign(contextPath + "/sellpart/bookDetail.do?bindNo="+v.BIND_NO);
					});
					
					let coverImgBox = document.createElement("div");
					coverImgBox.classList.add("cover-img-box");

					let coverImg = document.createElement("img");
					coverImg.setAttribute("src", v.IMAGE);

					let infoBox = document.createElement("div");
					infoBox.classList.add("info-box");

					let title = document.createElement("div");
					title.classList.add("ebookTitle");
					let titleText = v.TITLE.replaceAll("<b>", "").replaceAll("</b>", "");
					titleText = titleText.substring(0, titleText.indexOf("(") === -1 ? titleText.length : titleText.indexOf("("));
					titleText = titleText.substring(0, titleText.indexOf("+") === -1 ? titleText.length : titleText.indexOf("+"));
					titleText = titleText.substring(0, titleText.indexOf("&") === -1 ? titleText.length : titleText.indexOf("&"));
					title.innerText = titleText;

					let author = document.createElement("div");
					author.classList.add("ebookAuthor");
					author.innerText = v.AUTHOR;

					coverImgBox.appendChild(coverImg);
					infoBox.appendChild(title);
					infoBox.appendChild(author);

					ebookItem.appendChild(coverImgBox);
					ebookItem.appendChild(infoBox);
					searchResult.append(ebookItem);
				}
			});

			let items = document.querySelectorAll("div.ebookItem");

			if (items.length === 0) {
				emptyNotice = document.createElement("div");
				emptyNotice.classList.add("empty-notice");
				emptyNotice.innerText = "해당 조건의 e북이 없습니다. 다시 시도해주세요";

				searchResult.appendChild(emptyNotice);
			}
		}
	});

	$.ajax({
		url: contextPath + "/ebook/getPageBar.do",
		type: "GET",
		data: searchData,
		success: data => {
			console.log(data);

			let pageBar = document.querySelector("div.page-bar");
			pageBar.innerHTML = data;
		}
	});
}

function getCategories() {
    console.log("testtest : " + categoryCode);


	$.ajax({
		url: contextPath + "/ebook/getCategoriesForPaperBook.do",
		type: "GET",
		data: {
			categoryCode: categoryCode
		},
		success: data => {
            console.log("category test");
			console.log(data);

			let category = document.getElementById("category");

			data.forEach((v, i) => {
				let option = document.createElement("option");
				option.value = v.CATEGORY_CODE;
				option.innerText = v.CATEGORY_NAME;

                if (categoryCode === v.CATEGORY_CODE) {
                    option.selected = true;
                }

				category.appendChild(option);
			});
		}
	});
}