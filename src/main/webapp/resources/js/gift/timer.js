(function () {
    var time = 24 * 60 * 60; // 24시간
    var hour = "";
    var min = "";
    var sec = "";
    
    let today = new Date();
    let tHour = today.getHours();
    let tMin = today.getMinutes();
    let tSec = today.getSeconds();
    
    var nHour = "";
    var nMin = "";
    var nSec = "";
    
    var t = setInterval(function(){
        hour = parseInt(time / 3600);
        min = parseInt(parseInt(time / 60) / 24); 
        sec = time%60;
        // console.log(hour);
        // console.log(min);
        // console.log(sec);
        console.log();
        nHour = hour - tHour;
        nMin = min - tMin;
        nSec = sec - tSec;
        $(".timer").html(`${hour} : ${min} : ${sec}`);
        time--;
        // if(){
        //     clearInterval(t); // 초기화  
        // }
    }, 1000);
})();