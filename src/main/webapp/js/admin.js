const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const rootUrl = $("#add-product-url").getAttribute("data-url");

let productImgInput = $("#product_img-input");


import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.0/firebase-app.js";
import { getStorage, ref, uploadBytes, getDownloadURL } from "https://www.gstatic.com/firebasejs/10.7.0/firebase-storage.js";
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyAzIpV8F14wzvXQ09-TJGtMTnusP9qhUMU",
    authDomain: "cloudy-drinks-website.firebaseapp.com",
    projectId: "cloudy-drinks-website",
    storageBucket: "cloudy-drinks-website.appspot.com",
    messagingSenderId: "156827376079",
    appId: "1:156827376079:web:7685e8fdf248a154e55aba"
};
// Initialize Firebase
const app = initializeApp(firebaseConfig);
const storage = getStorage(app);


async function uploadImage() {
    const file = productImgInput.files[0];
    const storageRef = ref(storage, "images/" + file.name);
    let returnUrl = await uploadBytes(storageRef, file)
        .then(snapshot => {
            console.log("Upload thành công!")
            return getDownloadURL(snapshot.ref);
        })
        .catch(console.error);

    return new Promise(function(resolve, reject) {
        resolve(returnUrl);
    });
}

$("#add_prod-btn").onclick = (e) => {
    e.preventDefault();

    let productName = $("input[name='prodName']").value;
    let productPrice = $("input[name='prodPrice']").value;
    let belongCategory = $("select[name='belongCat']").value;
    let productDesc = $("input[name='prodDesc']").value;

    if (productName !== '' && productPrice !== '' && belongCategory !== '' && productDesc !== '') {
        uploadImage()
            .then(url => {
                $("input[name='prodImgLink']").value = url;

                let link = `${rootUrl}/add-product?prodName=${productName}&prodImgLink=${url}&prodPrice=${productPrice}&belongCat=${belongCategory}&prodDesc=${productDesc}`;
                console.log(link);
                console.log(url)
                let xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (this.readyState === 4 && this.status === 200) {
                    }
                }
                xhr.open('POST', link, true);
                xhr.send();
                $("#add_product-form").reset();
            })
            .catch(console.error);
    } else {
        console.error("Vui lòng nhập đủ trường dữ liệu");
    }
}


let tabHasPreviewImg = $$(".has_preview");

tabHasPreviewImg.forEach((tab) => {
    tab.querySelector(".image_link").onchange = (e) => {
        tab.querySelector(".preview > img").src = e.target.value;
    }
})

productImgInput.onchange = e => {
    const [file] = productImgInput.files;
    if (file) {
        $(".preview img[data-preview_for='product_img-input']").src = URL.createObjectURL(file);
    }
}
