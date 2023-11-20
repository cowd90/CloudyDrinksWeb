const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

let slideIndex = 0;

showSlide(slideIndex);

let isLogin = true;

document.querySelectorAll(".form-footer span").forEach((element) => {
    element.onclick = () => {
        isLogin = !isLogin;
        document.querySelectorAll("form").forEach((element) => {
            element.classList.toggle("hidden");
        });

        adjustBgHeight();
    };
});

window.onresize = () => {
    adjustBgHeight();
};

// Điều chỉnh height của .page-container để background img hiện full
function adjustBgHeight() {
    let pageContainer = $(".page-container");
    let authContainer = $(".page-container .layer > div");

    if (authContainer.clientHeight <= window.innerHeight) {
        pageContainer.style.height = "100vh";
    } else pageContainer.style.height = "100%";
}

// Làm việc với dialog (thông báo)
const registerDialogContainer = $(".register_dialog-container");

function showRegisterDialog() {
    let dialog = $(".register_dialog-container .dialog-register");

    if (dialog) {
        $(".dialog-register.success").showModal();
    } else {
    }
}

function closeRegisterDialog() {
    let dialog = $(".register_dialog-container .dialog-register");
    dialog.close();
    registerDialogContainer.innerHTML = "";
}