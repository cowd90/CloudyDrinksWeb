const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

let contactContainer = $("#contact_container");

getData();
async function getData() {
    const response = await fetch("https://raw.githubusercontent.com/SunnyBiolie/Station/master/hcm_address_data.json");
    const data = await response.json();
    renderCity(data);
}
let temp;
const districts = $("#district");
const wards = $("#ward");
function renderCity(data) {

    for (const dis of data[0].districts) {
        districts.options[districts.options.length] = new Option(dis.name, dis.name);
    }

    districts.onchange = function () {
        wards.length = 1;
        if (this.value !== "") {
            let dataWards = data[0].districts.filter(n => n.name === this.value)[0].wards.sort();
            dataWards = dataWards.sort((a, b) => {
                const nameA = a.name.toUpperCase();
                const nameB = b.name.toUpperCase();
                if (nameA < nameB) {
                    return -1;
                }
                if (nameA > nameB) {
                    return 1;
                }

                return 0;
            });

            for (const w of dataWards) {
                wards.options[wards.options.length] = new Option(w.name, w.name);
            }
        }
    };
}