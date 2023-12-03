let dialogContainer = $("#change_cart_info-container");


function plusQuantity(number) {
    let inputQuantity = $("#prod-quantity");
    if (inputQuantity.valueAsNumber + number > 0) {
        inputQuantity.valueAsNumber += number;
        $("label[for='prod-quantity']").innerHTML = inputQuantity.valueAsNumber;
    }
    checkDisableDesBtn();
}

function checkDisableDesBtn() {
    let inputQuantity = $("#prod-quantity");
    let decreaseBtn = $("#decrease-btn");
    if (inputQuantity.valueAsNumber === 1) {
        decreaseBtn.classList.add("disabled");
    }
    else {
        decreaseBtn.classList.remove("disabled");
    }
}

let cartItemList = $$(".page-cart-container .cart-item");
cartItemList.forEach((cartItem) => {
    let id = cartItem.querySelector("input[name='variantId']").value;
    let name = cartItem.querySelector(".name").innerText;
    let quantity = cartItem.querySelector(".quantity").innerText;
    let size = cartItem.querySelector(".size").innerText;
    let desc = cartItem.querySelector(".desc").innerText;
    cartItem.querySelector(".change_info-btn").onclick = () => {
        showChangeInfoDialog(id, name, size, quantity, desc);
        checkDisableDesBtn();
        let dialog = $("#change_cart_info-container dialog");
        function checkDisableConfirmChangeInfo(newValue, oldValue) {
            if (newValue[0] !== oldValue[0] || newValue[1] !== oldValue[1]) {
                dialog.querySelector("button[type='submit']").removeAttribute("disabled");
                dialog.querySelector("button[type='submit']").classList.remove("disabled");
            } else {
                dialog.querySelector("button[type='submit']").setAttribute("disabled", "");
                dialog.querySelector("button[type='submit']").classList.add("disabled");
            }
        }

        dialog.querySelector("#decrease-btn").addEventListener("click",
            () => checkDisableConfirmChangeInfo([dialog.querySelector("#prod-quantity").value, dialog.querySelector("input[name='newNotes']").value], [quantity, desc]),
            false);
        dialog.querySelector("#increase-btn").addEventListener("click",
            () => checkDisableConfirmChangeInfo([dialog.querySelector("#prod-quantity").value, dialog.querySelector("input[name='newNotes']").value], [quantity, desc]),
            false);
        dialog.querySelector("input[name='newNotes']").addEventListener("input",
            (e) => checkDisableConfirmChangeInfo([dialog.querySelector("#prod-quantity").value, e.target.value], [quantity, desc]),
            false);

        dialog.querySelector("button[type='submit']").onclick = (e) => {
            submitDialogChangeInfo(e);
            removeChangeInfoDialog();
        }
    }
});

function showChangeInfoDialog(id, name, size, quantity, desc) {
    dialogContainer.innerHTML = createChangeInfoDialog(id, name, size, quantity, desc);
    $("#change_cart_info-container dialog").showModal();
}

function createChangeInfoDialog(id, name, size, quantity, desc) {
    return `
        <dialog>
            <form class="m-0">
                <h3 class="heading">Thay đổi thông tin</h3>
                <input type="hidden" name="cartItemId" value="${id}">
                <h5>${name} <i>(${size})</i></h5>
                <p><span class="text-danger">*</span><i> Bạn chỉ có thể thay đổi các thông tin sau</i></p>
                <div class="quantity d-flex align-items-center mb-3">
                    <span class="me-5">Số lượng:</span>
                    <div id="decrease-btn" onclick="plusQuantity(-1)">-</div>
                        <input type="number" id="prod-quantity" name="newQuantity" value="${quantity}" class="d-none">
                        <label for="prod-quantity">${quantity}</label>
                    <div id="increase-btn" onclick="plusQuantity(1)">+</div>
                </div>
                <div class="input-group mb-4">
                    <span class="input-group-text" id="basic-addon1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="gray" class="bi bi-card-list" viewBox="0 0 16 16">
                          <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"></path>
                          <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8m0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0M4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0m0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0"></path>
                        </svg>
                    </span>
                    <input type="text" name="newNotes" class="form-control lh-lg" maxlength="200" value="${desc}"
                           placeholder="Ghi chú thêm cho món này" aria-label="Your notes" aria-describedby="basic-addon1">
                </div>
                <div class="d-flex justify-content-center gap-4">
                    <button type="submit" class="main-btn disabled" disabled>Xác nhận</button>
                    <button class="cancel-btn px-4" onclick="removeChangeInfoDialog()">Hủy</button>
                </div>
            </form>
        </dialog>
    `;
}

function removeChangeInfoDialog() {
    $("#change_cart_info-container dialog").close();
    dialogContainer.innerHTML = "";
}

function submitDialogChangeInfo(e) {
    e.preventDefault();
    let dialog = $("#change_cart_info-container dialog");

    let cartItemId = dialog.querySelector("input[name='cartItemId']").value;
    let newQuantity = dialog.querySelector("#prod-quantity").value;
    let newDesc = dialog.querySelector("input[name='newNotes']").value;

    let link = `./?cartItemId=${cartItemId}&newQuantity=${newQuantity}&newDesc=${newDesc}`;
    const xhr = new XMLHttpRequest();
    console.log(link);
    xhr.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            console.log(this.responseText);
        }
    }
    xhr.open('GET', link, true);
    xhr.send(null);
    xhr.abort();
}
