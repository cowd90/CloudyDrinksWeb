const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

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
    uploadImage()
        .then(url => {
            $("input[name='prodImgLink']").value = url;
            console.log(url);
        });
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
