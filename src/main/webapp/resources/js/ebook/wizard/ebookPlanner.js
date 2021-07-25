let ctx = document.getElementById("line-chart").getContext("2d");
let myChart = new Chart(ctx, {
    type:"line",
    data: {
        labels: [
            "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"
        ],
        datasets: [
            {
                label: "2020",
                data: [200, 300, 564, 123, 624, 752, 129, 653, 125, 154, 165, 284]
            },
            {
                label: "2021",
                data: [100, 200, 300, 200, 250, 420, 163, 254, 658, 213, 126, 753]
            }
        ]
    }
});