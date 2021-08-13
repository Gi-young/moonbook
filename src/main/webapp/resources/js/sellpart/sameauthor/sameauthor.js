let searchFrm = document.getElementById("searchFrm");
let contextPath = document.getElementById("contextPath").value;

console.log(searchFrm);
console.log(contextPath);


//searchFrm.addEventListener("submit", (e) => {
//	e.preventDefault();
	
//	let searchData = $(e.target).serialize();

//	let checkSet = new Set();

//	document.querySelectorAll("form#searchFrm input[name^=importance]").forEach((v, i) => {
//		checkSet.add(Number(v.value));
//	});

//	console.log(checkSet);

//	if (checkSet.has(1) && checkSet.has(2) && checkSet.has(3) && checkSet.has(4)) {
//		searchBook(searchData);
//	} else {
//		alert("각 정렬 기준의 중요도를 올바르게 배치해주세요(1 ~ 4까지 겹치지 않고 배치)");
//	}
//  });

function searchBook(searchData) {
	$.ajax({
		url: contextPath + "/ebook/search.do",
		type: "post",
		data: searchData,
		dataType: "json",
		success: data => {
		console.log("이거되니?");
		console.log(data);
			let recoContent = document.querySelectorAll(".reco-content");
			for (i=0;i<recoContent.length;i++){
			console.log("길이길이길이길이"+recoContent.length);
				recoContent[i].children[0].src=data[i].image;
				recoContent[i].children[1].innerText=data[i].title;
				recoContent[i].children[2].innerText="-10%";
				recoContent[i].children[3].innerText=data[i].price*0.9;
			}
			
		}
	});
}