const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

// <editor-fold desc="Xác định theme được lưu trong localStorage">
let theme;
if (!localStorage.getItem('cloudyDrinksTheme')) {
    localStorage.setItem("cloudyDrinksTheme", "light");
    theme = localStorage.getItem('cloudyDrinksTheme');
    console.log(theme);
} else {
    theme = localStorage.getItem('cloudyDrinksTheme');
}
if (theme === "dark") {
    document.body.classList.add("dark-theme");
    $(".mode_container .dark-theme_icon").classList.add("hidden");
} else $(".mode_container .light-theme_icon").classList.add("hidden");
// </editor-fold>

const toggleDarkTheme = () => {
    if (theme === "dark") {
        localStorage.setItem("cloudyDrinksTheme", "light");
    } else {
        localStorage.setItem("cloudyDrinksTheme", "dark");
    }
    document.body.classList.toggle("dark-theme");
    document.querySelectorAll(".change-mode .item").forEach((itemIcon) => {
        itemIcon.classList.toggle("hidden");
    });
};

// <editor-fold desc="Defined whether header should be floated and hidden">
let lastScrollTop = 0;
let header = document.querySelector("header");
let handleHeaderWhenScroll = function () {
    console.log("scroll")
    let st = window.scrollY || document.documentElement.scrollTop;
    if (st > 100) document.querySelector("header").classList.add("float");
    else document.querySelector("header").classList.remove("float");
    if (st > lastScrollTop) {
        document.querySelector("header").classList.add("hidden");
    } else if (st < lastScrollTop) {
        document.querySelector("header").classList.remove("hidden");
    } // else was horizontal scroll
    lastScrollTop = st <= 100 ? 100 : st;
}

window.addEventListener(
    "scroll", handleHeaderWhenScroll, false
);
// </editor-fold>


let expandBtn = $("#expand-list");
let layer = $("#layer");
let closeBtn = $("#close-btn");
let menuBtn = $("#menu a");
let backBtn = $("#h-back-btn");

let clickMenuInSidebar = function (e) {
    e.preventDefault();
    $("#menu .more-menu_container").style.left = "0";
}

expandBtn.onclick = () => {
    header.classList.remove("float");
    window.removeEventListener("scroll", handleHeaderWhenScroll);
    $("header .header_container .left-header").style.left = "0";
    closeBtn.classList.remove("hidden");
    menuBtn.addEventListener("click", clickMenuInSidebar);
    backBtn.classList.remove("hidden");
    layer.classList.remove("hidden");
}

layer.onclick = () => {
    layer.classList.add("hidden");
    window.addEventListener(
        "scroll", handleHeaderWhenScroll, false
    );
    menuBtn.removeEventListener("click", clickMenuInSidebar);
    backBtn.classList.add("hidden");
    closeBtn.classList.add("hidden");
    $("header .header_container .left-header").style.left = "-100%";
    $("#menu .more-menu_container").style.left = "-100%";
}

closeBtn.onclick = () => {layer.click();}
backBtn.onclick = () => {
    $("#menu .more-menu_container").style.left = "-100%";
}
