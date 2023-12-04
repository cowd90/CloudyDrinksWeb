const receivedContainer = $("#received_dialog-container");
const canceledContainer = $("#canceled_dialog-container");

let deliveringHistoryItem = $$("#delivering .his_item");

deliveringHistoryItem.forEach(item => {
    let id = item.querySelector("input[name='variantId']").value;

    let receivedBtn = item.querySelector(".received");
    let canceledBtn = item.querySelector(".canceled");

    receivedBtn.onclick = () => {
        showReceivedDialog(id);
        let dialog = receivedContainer.querySelector("dialog");
        dialog.querySelector("button[type='submit']").onclick = (e) => {
            submitReceivedDialog(e);
            removeReceivedDialog();
        }
    }
    canceledBtn.onclick = () => {
        showCanceledDialog(id);
        let dialog = canceledContainer.querySelector("dialog");
        dialog.querySelector("button[type='submit']").onclick = (e) => {
            submitCanceledDialog(e);
            removeCanceledDialog();
        }
    }
});

//<editor-fold desc="Dialog của đã nhận đơn hàng">
function showReceivedDialog(id) {
    receivedContainer.innerHTML = createReceivedDialog(id);
    receivedContainer.querySelector("dialog").showModal();
}

function createReceivedDialog(id) {
    return `
        <dialog>
            <form class="m-0">
                <h3 class="heading">Xác nhận</h3>
                <input type="hidden" name="received" value="received">
                <input type="hidden" name="id" value="${id}">
                <div class="message fs-5 pb-4">Đã nhận được đơn hàng</div>
                <div class="d-flex justify-content-center gap-4">
                    <button type="submit" class="main-btn">Xác nhận</button>
                    <button class="cancel-btn px-4" onclick="removeReceivedDialog()">Hủy</button>
                </div>
            </form>
        </dialog>
    `;
}

function removeReceivedDialog() {
    receivedContainer.querySelector("dialog").close();
    receivedContainer.querySelector("dialog").remove();
}

function submitReceivedDialog(e) {
    e.preventDefault();
    let dialog = receivedContainer.querySelector("dialog");

    let id = dialog.querySelector("input[name='id']").value;

    let link = `./?received=received&id=${id}`;
    const xhr = new XMLHttpRequest();
    console.log(link);
    xhr.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            console.log(this.responseText);
        // Nên chia responseText thành dạng array vì cần updated
        // cho 2 mục đang giao và đã nhận
        // VD: $("#delivering").innerHTML = responseText[0];
        //     $("#delivered").innerHTML = responseText[1];
        }
    }
    xhr.open('GET', link, true);
    xhr.send(null);
    xhr.abort();
}
//</editor-fold>

//<editor-fold desc="Dialog của hủy đơn hàng">
function showCanceledDialog(id) {
    canceledContainer.innerHTML = createCanceledDialog(id);
    canceledContainer.querySelector("dialog").showModal();
}

function createCanceledDialog(id) {
    return `
        <dialog>
            <form class="m-0">
                <h3 class="heading">Xác nhận</h3>
                <input type="hidden" name="canceled" value="canceled">
                <input type="hidden" name="id" value="${id}">
                <div class="message fs-5 pb-3">Hủy đơn hàng</div>
                <div class="pb-4 d-flex flex-column">
                    <div class="pb-2">Nguyên nhân:</div>
                    <div class="disabled p-2 ps-3">Tính năng đang trong quá trình phát triển</div>
                </div>
                <div class="d-flex justify-content-center gap-4">
                    <button type="submit" class="main-btn">Xác nhận</button>
                    <button class="cancel-btn px-4" onclick="removeCanceledDialog()">Hủy</button>
                </div>
            </form>
        </dialog>
    `;
}

function removeCanceledDialog() {
    canceledContainer.querySelector("dialog").close();
    canceledContainer.querySelector("dialog").remove();
}

function submitCanceledDialog(e) {
    e.preventDefault();
    let dialog = canceledContainer.querySelector("dialog");

    let id = dialog.querySelector("input[name='id']").value;

    let link = `./?canceled=canceled&id=${id}`;
    const xhr = new XMLHttpRequest();
    console.log(link);
    xhr.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            console.log(this.responseText);
            // Nên chia responseText thành dạng array vì cần updated
            // cho 2 mục đang giao và đã nhận
            // VD: $("#delivering").innerHTML = responseText[0];
            //     $("#delivered").innerHTML = responseText[1];
        }
    }
    xhr.open('GET', link, true);
    xhr.send(null);
    xhr.abort();
}
//</editor-fold>