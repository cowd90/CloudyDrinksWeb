const newsContainer = $(".news-container");
const moreNewsBtn = $(".more-news");

moreNewsBtn.addEventListener("click", () => renderMoreNews(), false);

function renderMoreNews() {
    let newsCount = newsContainer.querySelectorAll(".card").length;

    let link = `./?currentCount=${newsCount}`;
    const xhr = new XMLHttpRequest();
    console.log(link);
    xhr.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            console.log(this.responseText);
            // newsContainer.innerHTML += this.responseText;
        }
    }
    xhr.open('GET', link, true);
    xhr.send(null);
    xhr.abort();

    //<editor-fold desc="Ví dụ thêm tin tức">
    newsContainer.innerHTML += `
        <div class="col-12 col-sm-6 col-lg-4 mb-4">
            <div class="card">
                <div style="background-image: url('https://firebasestorage.googleapis.com/v0/b/cloudy-drinks-website.appspot.com/o/images%2F8.jpg?alt=media&token=5ab444f4-7bea-4f77-988a-9014adff13d1')" class="card-img-top"></div>
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h5 class="card-title">Gong Cha đón hè với Series Đào Hoàng Kim</h5>
                        <p class="link justify-content-center align-items-center gap-2 text-end">Chi tiết</p>
                    </div>
                    <p class="card-text">Bài viết được cung cấp từ Zing News 21/3/2023 09:30 (GMT+7): https://zingnews.vn/gong-cha-viet-nam-ban-them-ca-phe-mo-lai-hoat-dong-nhuong-quyen-post1413828.html Golden Trust có kế hoạch phát triển thêm…</p>
                    <div class="d-flex justify-content-end">
                    </div>
                </div>
            </div>
        </div>
    `;
    //</editor-fold>
}
