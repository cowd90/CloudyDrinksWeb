const newsContainer = $(".news-container");
const moreNewsBtn = $(".more-news");

const rootUrl = $("#load-more-url").getAttribute("data-url");

moreNewsBtn.addEventListener("click", () => renderMoreNews(), false);

function renderMoreNews() {
    let newsCount = newsContainer.querySelectorAll(".card").length;
    let link = `${rootUrl}/news-controller?newsCount=${newsCount}`;
    console.log(link);

    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            newsContainer.innerHTML += this.responseText;
        }
    }
    xhr.open('POST', link, true);
    xhr.send();
}
