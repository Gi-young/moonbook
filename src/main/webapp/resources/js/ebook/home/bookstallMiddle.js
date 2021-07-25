const carouselSlide = document.querySelector(".carousel-slide");
const carouselImages = document.querySelectorAll(".carousel-slide>img");

const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");

let counter = 1;
const size = carouselImages[0].clientWidth;

carouselSlide.style.transform = "translateX(" + (-size * counter) +"px)";

nextBtn.addEventListener("click", () => {
    carouselSlide.style.transition = "transform 0.4s ease-in-out";
    counter++;
    carouselSlide.style.transform = "translateX(" + (-size * counter) +"px)";
});

prevBtn.addEventListener("click", () => {
    carouselSlide.style.transition = "transform 0.4s ease-in-out";
    counter--;
    carouselSlide.style.transform = "translateX(" + (-size * counter) +"px)";
});

carouselSlide.addEventListener("transitionend", () => {
    if (counter === carouselImages.length - 1) {
        counter = 1;
        carouselSlide.style.transition = "none";
        carouselSlide.style.transform = "translateX(" + (-size * counter) + "px)";
    }
});












