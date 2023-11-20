const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

adjustBgHeight();

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
let dialogContainer = $('#dialog-container');

function createDialog(type, title, arrayOfMess, btnContent) {
    let dialogContent = `
        <dialog class="${type}">
            <div class="dialog-header">
                <div class="dialog-icon"></div>
                <h4 class="dialog-title">${title}</h4>
            </div>
            <div class="dialog-content">`;

    arrayOfMess.forEach(mess => {
        dialogContent += `<p>${mess}</p>`;
    });

    dialogContent += `
            </div>
            <button
                    class="dialog-close_btn"
                    onclick="closeDialog()"
            >
                ${btnContent}
            </button>
        </dialog>
    `;
    dialogContainer.innerHTML = dialogContent;
}

function showDialog() {
    let dialog = $("#dialog-container dialog");

    if (dialog) {
        dialog.showModal();
    }
}

function closeDialog() {
    let dialog = $("#dialog-container dialog");
    dialog.close();
    dialogContainer.innerHTML = "";
}
