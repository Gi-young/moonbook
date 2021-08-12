(function () {
    
    var time = new Date( 2021,7,12,23,59,59); // 24시간
    var hour = time.getHours(); 
    var min = time.getMinutes(); 
    var sec = time.getSeconds();
      
    var hund = 100;  
    var bar = $(".innerBar");  
    var t = setInterval(function(){  
   	
    
    var today = new Date(); // 현재 날짜
  
    var tHour = today.getHours(); // 현재 시간

    var tMin = today.getMinutes(); // 현재 분

    var tSec = today.getSeconds(); // 현재 초
  

    var nHour;
    var nMin;
    var nSec; 
    
    	nHour = hour - tHour;
    	nMin = min - tMin;
    	nSec = sec - tSec;  	  
    	             
        $(".timer").html(`${nHour} : ${nMin} : ${nSec}`);
         
	    switch(tHour){
	    	case 23: bar.css('height', '4%'); break;
	    	case 22: bar.css('height', '8%'); break;
	    	case 21: bar.css('height', '12%'); break;
	    	case 20: bar.css('height', '16%'); break;
	    	case 19: bar.css('height', '20%'); break;
	    	case 18: bar.css('height', '24%'); break;
	    	case 17: bar.css('height', '28%'); break;
	    	case 16: bar.css('height', '32%'); break;
	    	case 15: bar.css('height', '36%'); break;
	    	case 14: bar.css('height', '40%'); break;
	    	case 13: bar.css('height', '44%'); break;
	    	case 12: bar.css('height', '48%'); break;
	    	case 11: bar.css('height', '52%'); break;
	    	case 10: bar.css('height', '56%'); break;
	    	case 9: bar.css('height', '60%'); break;
	    	case 8: bar.css('height', '64%'); break;
	    	case 7: bar.css('height', '68%'); break;
	    	case 6: bar.css('height', '72%'); break;
	    	case 5: bar.css('height', '76%'); break;
	    	case 4: bar.css('height', '80%'); break;
	    	case 3: bar.css('height', '84%'); break;
	    	case 2: bar.css('height', '88%'); break;
	    	case 1: bar.css('height', '92%'); break;
	    	case 0: bar.css('height', '96%'); break;
	    	default: bar.css('height', '100%'); break;
    		}    
                      
        if(nHour == 0){
             clearInterval(t); // 초기화  
         }
    }, 1000);
    
//    var f = setInterval(function(){
//     	bar.css('height', `${hund}%`);
//    	hund--;
//     	console.log(hund--);
//     }, 1728000);    
    
 
})();