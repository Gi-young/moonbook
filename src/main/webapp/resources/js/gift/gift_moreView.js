$(function(){
    const recoPro=$(".reco-product");
    const addBtn=$(".add-product-a");
    const moreBtn=$(".add-product-font");
    console.log(moreBtn);
    addBtn.click(function(){
        console.log(recoPro.height);
        console.log(recoPro.css("height"));
        if(recoPro.css("height")=="400px"){
            recoPro.height(1200);
            moreBtn.html("접기  -");
            window.scrollTo({top:3000, left:0, behavior:'smooth'});
        }else if(recoPro.css("height")!="400px"){
            recoPro.height(400);
            moreBtn.html("더보기 <span style='font-size:28px; font-weight:500;'>+</span>");
            window.scrollTo({top:3200, left:0, behavior:'smooth'});
        }
    })
})

    

   
