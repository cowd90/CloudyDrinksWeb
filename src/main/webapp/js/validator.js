function Validator(options) {

    function getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            }
            element = element.parentElement;
        }
    }

    let selectorRules = {
        /*
        key:... --> rule.selector (id của các input)
        ...value, --> Array rule.test (các function test của rule được áp dụng lên input)
        */
    };

    validateOnBlur = function (inputElement, rule, placeHolder, message) {
        inputElement.placeholder = placeHolder;
        // Lấy thông báo lỗi từ return của hàm test ở mỗi rule 
        let messageError;

        let rules = selectorRules[rule.selector];   // rules lúc này là một Array
        for (let i = 0; i < rules.length; i++) {
            messageError = rules[i](inputElement.value);
            if (messageError) break;
        }

        if (messageError) {
            inputElement.parentElement.classList.add("invalid");
            message.innerText = messageError;
        } else {
            message.innerText = ""; // ẩn hiển thị thông báo lỗi
            inputElement.parentElement.classList.remove("invalid");
        }

        return !messageError;
    }

    let formElement = document.querySelector(options.form);
    if (formElement) {

        formElement.onsubmit = function (e) {
            e.preventDefault();
            let isFormValid = true;
            options.rules.forEach( (rule) => {
                let inputElement = formElement.querySelector(rule.selector);
                let placeHolder = inputElement.placeholder || '';
                let message = getParent(inputElement, options.formGroupSelector).querySelector(options.message);

                let isValid = validateOnBlur(inputElement, rule, placeHolder, message);
                if (!isValid) isFormValid = false;
            });
            if (isFormValid) {
                if (typeof options.onSubmit === "function") {
                    let formInputs = formElement.querySelectorAll("[name]:not(disable)");
                    // Chuyển formInputs từ NodeLists sang Array để dùng phương thức reduce (lặp qua các ptử của Array)
                    let formValues = Array.from(formInputs).reduce(function (values, input) {
                        values[input.name] = input.value;
                        return values;
                    }, {}); // khởi đầu của values là một object rỗng
                    options.onSubmit(formValues);
                }
                else {
                    formElement.submit();
                }
            }
        }

        // Duyệt qua từng rule trong rules của options
        options.rules.forEach( rule => {
            // Lưu nhiều rule cho mỗi input riêng biệt
            if (Array.isArray(selectorRules[rule.selector])) {
                selectorRules[rule.selector].push(rule.test);
            } else {
                selectorRules[rule.selector] = [rule.test];
            }
            // Xác định xem rule đó áp dụng cho phần tử nào
            let inputElement = formElement.querySelector(rule.selector);
            // Xác định thông báo sẽ được hiển thị ở phần tử nào
            let message = getParent(inputElement, options.formGroupSelector).querySelector(options.message);

            if (inputElement) {
                let placeHolder = inputElement.placeholder || '';
                inputElement.onblur = () => {
                    validateOnBlur(inputElement, rule, placeHolder, message);
                };
                // Làm nổi bật input đang được nhập
                inputElement.onfocus = () => {
                    inputElement.placeholder = "";
                };
                // Ẩn trạng thái lỗi khi người dùng nhập
                inputElement.oninput = () => {
                    if (inputElement.value !== "") {
                        message.innerText = "";
                        inputElement.parentElement.classList.remove("invalid");
                    }
                }
            }
        });
    }
}
/* options example
{  
    form: "#form-1",
    message: ".form-message",
    rules: [
        Validator.isRequired("#fullname"),
        Validator.isEmail("#email"),
    ]
}    
*/

// Define rules can be used in options
Validator.isRequired = function (selector, message) {
    return {
        selector,
        test: function (value) {
            return value.trim() ? undefined : message || "Vui lòng nhập trường này"
        },
    }
}

Validator.isEmail = function (selector) {
    return {
        selector,
        test: function (value) {
            let regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined : "Trường này phải là email";
        },
    }
}

Validator.minLength = function (selector, minLength) {
    return {
        selector,
        test: function(value) {
            return value.length >= minLength ? undefined : `Mật khẩu yêu cầu tối thiểu ${minLength} ký tự`;
        }
    }
}

Validator.isComplex = function (selector, minLength) {
    return {
        selector,
        test: function(value) {
            // let strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{6,})");
            // return strongRegex.test(value) ? undefined : "Mật khẩu chưa đủ mạnh";
            /*
            ^                         Start anchor
            (?=.*[A-Z].*[A-Z])        Ensure string has two uppercase letters.
            (?=.*[!@#$&*])            Ensure string has one special case letter.
            (?=.*[0-9].*[0-9])        Ensure string has two digits.
            (?=.*[a-z].*[a-z].*[a-z]) Ensure string has three lowercase letters.
            .{8}                      Ensure string is of length 8.
            $ 
            */
            let regexA = new RegExp ('(?=.*[A-Z])');
            if (!regexA.test(value)) return "Mật khẩu phải chứa ít nhất một ký tự in hoa";
            let regexa = new RegExp ('(?=.*[a-z])');
            if (!regexa.test(value)) return "Mật khẩu phải chứa ít nhất một ký tự thường";
            let regex0 = new RegExp ('(?=.*[0-9])');
            if (!regex0.test(value)) return "Mật khẩu phải chứa ít nhất một số";
            let regexSpec = new RegExp ('(?=.*[!@#\$%\^&\*])');
            if (!regexSpec.test(value)) return "Mật khẩu phải chứa ít nhất một ký tự đặc biệt";
            let regexLen = new RegExp (`(?=.{${minLength},})`);
            if (!regexLen.test(value)) return `Mật khẩu phải dài ít nhất ${minLength} ký tự`;
        }
    }
}

Validator.isConfirmed = function (selector, checkValue, message) {
    return {
        selector,
        test: function (value) {
            let checked = document.querySelector(checkValue);
            return value === checked.value ? undefined : message || 'Giá trị nhập vào không chính xác';
        }
    }
}

Validator.isNumber = function(selector) {
    return {
        selector,
        test: function (value) {
            let regex = new RegExp('^[0-9]$');
            return regex.test(value) ? undefined : "Vui lòng chỉ nhập số";
        }
    }
}


// ***** Something else *****

//Show and hide passwords
function togglePass(selector, input) {
    let sl = document.querySelector(selector);
    let iconHide = sl.querySelector(".form-group.diff .psw-label .fa-eye-slash");
    let iconShow = sl.querySelector(".form-group.diff .psw-label .fa-eye");
    let inputPSW = document.getElementById(input);
    if (inputPSW.type === "password") {
        iconHide.style.display = "inline";
        iconShow.style.display = "none";
        inputPSW.type = "text";
    } else {
        inputPSW.type = "password";
        iconHide.style.display = "none";
        iconShow.style.display = "inline";
    }
}