const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

// #region Slide show
let slides = $$(".slide-show_container .slides");
let dots = $$(".slide-control_wrapper .dot");

let slideIndex = 0;

showSlide(slideIndex);

function showSlide(n) {
    if (n > slides.length - 1) slideIndex = 0;
    if (n < 0) slideIndex = slides.length - 1;
    for (let i = 0; i <= slides.length - 1; i++) {
        slides[i].classList.add("hidden");
    }
    for (let i = 0; i <= slides.length - 1; i++) {
        dots[i].classList.remove("active");
    }

    slides[slideIndex].classList.remove("hidden");
    dots[slideIndex].classList.add("active");
}

dots.forEach((dot, index) => {
    dot.onclick = () => showSlide((slideIndex = 0 + index));
});

let prevSlideBtn = $(".slide-show_container .prev");
let nextSlideBtn = $(".slide-show_container .next");

prevSlideBtn.onclick = () => showSlide((slideIndex -= 1));
nextSlideBtn.onclick = () => showSlide((slideIndex += 1));

setInterval(() => {
    nextSlideBtn.click();
}, 6000);

// #endregion
