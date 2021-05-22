function caculateBillTotal() {
    let bill_total = 0;
    let product_total_ele = document.getElementsByClassName("price_total");

    for (let item of product_total_ele) {
        let price = convertPriceFromStringToNumber(item.innerHTML);
        bill_total += price;
    }
    bill_total = bill_total.toLocaleString("tr-TR") + "đ";
    document.getElementById("total").innerHTML = bill_total;
    document.getElementById("cost").innerHTML = bill_total;
}

function updateQuantity(id, price) {
    let quantity = document.getElementById("quantity_" + id).value;
    let price_after_change = price * quantity;
    price_after_change = price_after_change.toLocaleString("tr-TR") + "đ";
    document.getElementById("price_" + id).innerHTML = price_after_change;

    caculateBillTotal();

    let cartCookie = localStorage.getItem("cart");
    let cart_arr = cartCookie.split(";");
    let cart = "";
    cart_arr.forEach(item => {
        let product_id = item.split("-")[0];
        let item_quantity = item.split("-")[1];

        if (parseInt(product_id) == parseInt(id)) {
            item_quantity = quantity;
        }
        cart += product_id + "-" + item_quantity + ";" ;
    })

    cart = cart.slice(0, cart.length - 1);

    localStorage.setItem("cart", cart);
}

function convertPriceFromStringToNumber(price) {
    price = price.substring(0, price.length - 1);
    price = price.replace(/\./g, "");
    price = parseInt(price)
    return price;
}

function removeProduct(id) {
    let cart = localStorage.getItem("cart");
    position = cart.indexOf(id);
    if (cart.length == 3) {
        document.getElementById("cart").remove();
        localStorage.removeItem("cart");
    }
    else {
        position == 0 ? cart = cart.replace(id + "-1;", "") : cart = cart.replace(";" + id, "-1");
        document.getElementById("item_" + id).remove();
        localStorage.setItem("cart", cart);
    }
    
    sendRequest();
}

function setQuantity() {
    let cartCookie = localStorage.getItem("cart");
    let cart_arr = cartCookie.split(";");

    for (let i = 0; i < cart_arr.length; i++) {
        let quantity = cart_arr[i].split("-")[1];
        document.getElementsByClassName("quantity")[i].value = parseInt(quantity);

        let price_string = document.getElementsByClassName("price_total")[i].innerHTML;
        let price = convertPriceFromStringToNumber(price_string);

        let price_total = (parseInt(price) * parseInt(quantity)).toLocaleString("tr-TR") + "đ";
        document.getElementsByClassName("price_total")[i].innerHTML = price_total; 
    }
}


function getCart() {
    let cartCookie = localStorage.getItem("cart");
    let cart_arr = cartCookie.split(";");
    let item_cart_numbers = document.getElementsByClassName("quantity");
    let cart = "";
    for (let i = 0; i < cart_arr.length; i++) {
        let product_id = cart_arr[i].split("-")[0];
        let quantity = item_cart_numbers[i].value;
        cart += product_id + "-" + quantity + ";";
    }
    cart = cart.slice(0, length - 1);
    localStorage.setItem("cart", cart);

    //let id_arr = cartCookie.split("-");
    //let item_cart_numbers = document.getElementsByClassName("quantity");

    //let cart = "";
    //for (let i = 0; i < id_arr.length; i++) {
    //    cart += id_arr[i] + "-" + item_cart_numbers[i].value + ";";
    //}
    //cart = cart.slice(0, length - 1);

    //localStorage.setItem("cart", cart);
    //sendRequest();
}

$("#is_new_account").click(function () {
    $("#account_info").toggle();
});

function checkLogin() {
    getCart();
    if (localStorage.getItem("user_id") == null) {
        sessionStorage.setItem("current_page", window.location.href);
        window.location.href = "https://hoanglinh.tk/customers/login";
    }
    else {
        $('#addressModal').modal('show')
    }
}

function order() {
    let address = $("#address").val();
    $.post("/Orders/Order",
        {
            user_id: localStorage.getItem("user_id"),
            cart: localStorage.getItem("cart"),
            address: address
        },
        function (data, status) {

            if (!isNaN(data)) {
                localStorage.removeItem("cart");
                window.location.href = "https://hoanglinh.tk/Orders/Detail/" + data;
            }
            else {
                window.location.href = "https://hoanglinh.tk";
            }
        }
    ); 
}
