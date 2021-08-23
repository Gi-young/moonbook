let searchFrm = document.getElementById("searchFrm");
let contextPath = document.getElementById("contextPath").value;

console.log(searchFrm);
console.log(contextPath);



function searchBook(searchData) {
	$.ajax({
		url: contextPath + "/ebook/search.do",
		type: "post",
		data: searchData,
		dataType: "json",
		success: data => {
			let recoContent = document.querySelectorAll(".reco-content");
			for (i=0;i<recoContent.length;i++){
				recoContent[i].children[0].src=data[i].image;
				recoContent[i].children[1].innerText=data[i].title;
				recoContent[i].children[2].innerText="-10%";
				recoContent[i].children[3].innerText=data[i].price*0.9;
			}
			
		}
	});
}