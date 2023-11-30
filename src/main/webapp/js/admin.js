const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

let tabHasPreviewImg = $$(".has_preview");

tabHasPreviewImg.forEach((tab) => {
    tab.querySelector(".image_link").onchange = (e) => {
        tab.querySelector(".preview > img").src = e.target.value;
    }
})
