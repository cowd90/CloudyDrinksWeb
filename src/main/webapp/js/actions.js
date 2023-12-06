const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

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
            <button class="dialog-close_btn" onclick="closeDialog()">
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
