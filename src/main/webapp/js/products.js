let inputQuantity = $("#prod-quantity");
let checkInterval;
let suggestionContainer = $(".suggestion .products_container");

checkDisableDesBtn();
updateValueOfOrder();

if (suggestionContainer.scrollWidth - suggestionContainer.clientWidth > 0)
    scrollSuggestionLoop();

function plusQuantity(number) {
    if (inputQuantity.valueAsNumber + number > 0) {
        inputQuantity.valueAsNumber += number;
        $("label[for='prod-quantity']").innerHTML = inputQuantity.valueAsNumber;
    }
    checkDisableDesBtn();
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
    let quantity = inputQuantity.valueAsNumber;
    let result = (defaultPrice + upsizePrice) * quantity;
    let formattedPrice = result.toLocaleString("en-US");
    updatePlace.innerHTML = formattedPrice + "đ";
}

function checkDisableDesBtn() {
    if (inputQuantity.valueAsNumber === 1)
        $("#decrease-btn").classList.add("disabled");
    else
        $("#decrease-btn").classList.remove("disabled");
}

function scrollSuggestion(n) {
    scrollSuggestionLoop();

    let suggestionItemWidth = $(".suggestion .products_container .product").getBoundingClientRect().width;
    let newScrollLeft = suggestionContainer.scrollLeft + suggestionItemWidth * n;

    let actualScrollSpace = Math.ceil(suggestionContainer.scrollWidth - suggestionContainer.clientWidth);

    if (newScrollLeft > actualScrollSpace)
        suggestionContainer.scrollTo(0, 0);
    else if (newScrollLeft < -(suggestionItemWidth/2))
        suggestionContainer.scrollTo(actualScrollSpace, 0);
    else
        suggestionContainer.scrollTo(newScrollLeft, 0);
}
function scrollSuggestionLoop() {
    if (checkInterval) {
        clearInterval(scrollSuggestionInterval);
        checkInterval = false;

        interval();
    } else interval();
}

function interval() {
    globalThis.scrollSuggestionInterval = setInterval(() => {
        $("#next-sug").click();
    }, 5000);
    checkInterval = true;
}