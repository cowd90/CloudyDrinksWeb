const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

let header = $("header");

let categories = $$(".content_wrapper .category-item");
let catLinks = $$(".menu-nav_inner .nav a");

// Custom link clicked, scroll to .category-item
catLinks.forEach(link => {
   link.onclick = (e) => {
       e.preventDefault();
       let menuNav = $('.menu-nav_container');
       categories.forEach(cat => {
          if ("#" + cat.id === e.target.attributes.href.nodeValue) {
            if (!header.classList.contains('float'))
                window.scrollTo(0, cat.offsetTop - menuNav.clientHeight - header.clientHeight);
            else
                window.scrollTo(0, cat.offsetTop - menuNav.clientHeight );
          }
       });
   }
});

// Custom my scrollSpy
window.onscroll = () => {
    let activeLink;
    for (let i = 0; i < categories.length; i++) {
        if (checkVisibleFull(categories[i])) {
            activeLink = "#" + categories[i].id;
            break;
        }
        if (checkVisible(categories[i])) {
            activeLink = "#" + categories[i].id;
        }
    }
    catLinks.forEach(link => {
        link.classList.remove('active');
        if (link.attributes.href.nodeValue === activeLink) {
            link.classList.add('active');
        }
    });
}

// Check if element in user view (vertical)
function checkVisible(ele) {
    let rect = ele.getBoundingClientRect();
    let viewHeight = Math.max(document.documentElement.clientHeight, window.innerHeight);
    return !(rect.bottom < 0 || rect.top - viewHeight >= 0);
}
// Check if all part of element in user view (vertical)
function checkVisibleFull(ele) {
    let rect = ele.getBoundingClientRect();
    let viewHeight = Math.max(document.documentElement.clientHeight, window.innerHeight);
    return (rect.bottom >= 0 && rect.bottom <= viewHeight
        && rect.top >= 0 && rect.top <= viewHeight);
}