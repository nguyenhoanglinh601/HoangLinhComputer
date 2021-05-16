function displayThumbnail() {
    let thumbnail_list = document.getElementsByClassName("thumbnail");
    for (let i = 0; i < thumbnail_list.length; i++) {
        item = thumbnail_list[i];
        link = item.getAttribute("src");
        link = link.replace("file/d/", "thumbnail?id=");
        link = link.replace("/view?usp=sharing", "");

        document.getElementsByClassName("thumbnail")[i].setAttribute("src", link);
    }
}

function convertPrice() {
    let product_price_list = document.getElementsByClassName("product_price");
    for (let i = 0; i < product_price_list.length; i++) {
        let product_price = product_price_list[i].innerHTML;
        product_price = parseInt(product_price);
        product_price = product_price.toLocaleString("tr-TR");
        document.getElementsByClassName("product_price")[i].innerHTML = product_price + "đ";
    }
}

function convertDiscountPrice() {
    let product_price_list = document.getElementsByClassName("product_discount_price");
    for (let i = 0; i < product_price_list.length; i++) {
        let product_price = product_price_list[i].innerHTML;
        product_price = parseInt(product_price) * 1.1;
        product_price = product_price.toLocaleString("tr-TR");
        document.getElementsByClassName("product_discount_price")[i].innerHTML = product_price + "đ";
    }
}

function navigateCart() {
    let cart = localStorage.getItem("cart");
    $.post("/Carts/AddProduct",
        {
            data: cart
        },
        function () {
            window.location.replace("https://localhost:44386/carts");
        });
}

function sendRequest() {
    let cart = localStorage.getItem("cart");
    $.post("/Carts/AddProduct",
        {
            data: cart
        },
        function (data, status) {
            console.log("Data: " + data + "\nStatus: " + status);
        });
}
