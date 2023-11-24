let inputQuantity = $("#prod-quantity");
let checkInterval;
let suggestionWrapper = $(".suggestion .products_wrapper");

checkDisableDesBtn();
updateValueOfOrder();

let sugHasScroll = suggestionWrapper.scrollWidth - suggestionWrapper.clientWidth > 0;
checkIntervalAndDisabledButton();

window.onresize = () => {
    sugHasScroll = suggestionWrapper.scrollWidth - suggestionWrapper.clientWidth > 0;

    checkIntervalAndDisabledButton();
}


function plusQuantity(number) {
    if (inputQuantity.valueAsNumber + number > 0) {
        inputQuantity.valueAsNumber += number;
        $("label[for='prod-quantity']").innerHTML = inputQuantity.valueAsNumber;
    }
    checkDisableDesBtn();
    updateValueOfOrder();
}

let sizeButtons = $$(".product-size_container .sizeBtn");
sizeButtons.forEach((btn) => {
    btn.onclick = (e) => {
        for (let i = 0; i < sizeButtons.length; i++) {
            sizeButtons[i].classList.remove("active");
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
    scrollSuggestionRenewInterval();

    let suggestionItemWidth = $(".suggestion .products_wrapper .product").getBoundingClientRect().width;
    let passCount = Math.round(suggestionWrapper.scrollLeft / suggestionItemWidth);
    let newScrollLeft = passCount * suggestionItemWidth + suggestionItemWidth * n;
    let actualScrollSpace = Math.ceil(suggestionWrapper.scrollWidth - suggestionWrapper.clientWidth);

    if (newScrollLeft > actualScrollSpace + suggestionItemWidth/2)
        suggestionWrapper.scrollTo(0, 0);
    else if (newScrollLeft < - (suggestionItemWidth/2))
        suggestionWrapper.scrollTo(actualScrollSpace, 0);
    else
        suggestionWrapper.scrollTo(newScrollLeft, 0);

    console.log("next clicked");
}

function scrollSuggestionRenewInterval() {
    if (checkInterval) {
        nextClickClearInterval()
        nextClickInterval();
    } else nextClickInterval();
}
function nextClickClearInterval() {
    clearInterval(scrollSuggestionInterval);
    checkInterval = false;
}
function nextClickInterval() {
    globalThis.scrollSuggestionInterval = setInterval(() => {
        $("#next-sug").click();
    }, 6000);
    checkInterval = true;
}

function checkIntervalAndDisabledButton() {
    if (sugHasScroll) {
        $("#prev-sug").removeAttribute("disabled");
        $("#next-sug").removeAttribute("disabled");
        scrollSuggestionRenewInterval();
    } else {
        $("#prev-sug").setAttribute("disabled", "true");
        $("#next-sug").setAttribute("disabled", "true");
        if (checkInterval) nextClickClearInterval();
    }
}