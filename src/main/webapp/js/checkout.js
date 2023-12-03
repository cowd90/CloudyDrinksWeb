const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

let contactContainer = $("#contact_container");
let contactDropdownContent = $("#contact_container .dropdown-menu");

syncSelectContact();

function syncSelectContact() {
    let contactItemsInfo = $$("#contact_container .dropdown-menu .dropdown-item");
    let contactItemsId = $$("#contact_container select[name='contactId'] option");

    if (contactItemsInfo.length !== contactItemsId.length - 1) {
        console.log("Có lỗi bất đồng bộ về số lượng, vui lòng admin kiểm tra lại hoặc reload lại trang");
        return null;
    }

    contactItemsInfo.forEach(item => {
        item.addEventListener("click",
            () => showSelectedContactInfo(item),
            false)
    });

    contactItemsInfo.forEach((item, index) => {
        item.addEventListener("click",
            () => selectContactIdWhileClickInfo(contactItemsId, index+1),
            false)
    });
}


function showSelectedContactInfo(contactInfo) {
    let displayPosition = $("#displaySelectedContact");
    displayPosition.innerHTML = contactInfo.innerHTML;
}
function selectContactIdWhileClickInfo(contactItemsId, index) {
    contactItemsId[index].selected = true;
    console.log($("#contact_container select[name='contactId']").value);
}