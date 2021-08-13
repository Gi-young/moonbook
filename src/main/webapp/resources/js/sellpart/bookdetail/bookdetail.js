	// .product-exp
    // .product-review
    // .product-q_a
    // .notify
$(function(){  
      
    const exp = $(".product-exp");
    const review = $(".product-review");
    const q_a = $(".product-q_a");
    const notify = $(".notify");
    $("#bar1").addClass("barActive");
    $("#bar1").click(function(){
        exp.css("display","flex");
        review.css("display","none");
        q_a.css("display","none");
        notify.css("display","none");
        if(exp.css("display")=="flex"){
            $("#bar1").addClass("barActive");
            $("#bar2").removeClass("barActive");
            $("#bar3").removeClass("barActive");
            $("#bar4").removeClass("barActive");
    }
    })
    $("#bar2").click(function(){
        exp.css("display","none");
        review.css("display","flex");
        q_a.css("display","none");
        notify.css("display","none");
        if(review.css("display")=="flex"){
            $("#bar1").removeClass("barActive");
            $("#bar2").addClass("barActive");
            $("#bar3").removeClass("barActive");
            $("#bar4").removeClass("barActive");
    }
    })
    $("#bar3").click(function(){
        exp.css("display","none");
        review.css("display","none");
        q_a.css("display","flex");
        notify.css("display","none");
        if(q_a.css("display")=="flex"){
            $("#bar1").removeClass("barActive");
            $("#bar2").removeClass("barActive");
            $("#bar3").addClass("barActive");
            $("#bar4").removeClass("barActive");
    }
    })
    $("#bar4").click(function(){
        exp.css("display","none");
        review.css("display","none");
        q_a.css("display","none");
        notify.css("display","flex");
        if(notify.css("display")=="flex"){
            $("#bar1").removeClass("barActive");
            $("#bar2").removeClass("barActive");
            $("#bar3").removeClass("barActive");
            $("#bar4").addClass("barActive");
    }
    })      
});    	