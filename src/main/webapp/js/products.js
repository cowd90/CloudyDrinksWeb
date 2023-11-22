updateValueOfOrder();

function plusQuantity(number) {
    let inputQuantity = $("#prod-quantity");
    if (inputQuantity.valueAsNumber + number > 0) {
        inputQuantity.valueAsNumber += number;
        $("label[for='prod-quantity']").innerHTML = inputQuantity.valueAsNumber;
    }
    updateValueOfOrder();
}

let sizeBtns = $$(".product-size_container .sizeBtn");
sizeBtns.forEach((btn) => {
    btn.onclick = (e) => {
        for (let i = 0; i < sizeBtns.length; i++) {
            sizeBtns[i].classList.remove("active");
        }
        e.target.classList.add("active");
    }
});

$$(".product-size_container input[name='size']").forEach((size) => {
    size.onchange = () => {
        updateValueOfOrder();
    }
});

function updateValueOfOrder() {
    let updatePlace = $("#valueOfOrder");
    let defaultPrice = Number($(".product_container .product-price").getAttribute("data-prod"));
    let upsizePrice = 0;
    $$(".product-size_container input[name='size']").forEach((size) => {
        if (size.checked) {
            upsizePrice = Number(size.getAttribute("data-prod"));
        }
    });
    let quantity = $("#prod-quantity").valueAsNumber;
    let result = (defaultPrice + upsizePrice) * quantity;
    let formattedPrice = result.toLocaleString("en-US");
    updatePlace.innerHTML = formattedPrice + "đ";
}
