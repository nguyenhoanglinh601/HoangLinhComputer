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

function navigateOrder() {
    sessionStorage.setItem("current_page", "https://localhost:44386/Orders");
    window.location.replace("https://localhost:44386/Orders");
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
    checkCart();
}

function convertTime() {
    let elements = document.getElementsByClassName("time");
    for (let i = 0; i < elements.length; i++) {
        let time = elements[i].innerHTML;
        if (time != "1/1/0001 12:00:00 AM") {
            let date = time.split(" ")[0];
            let day = date.split("/")[1];
            let month = date.split("/")[0];
            let year = date.split("/")[2];

            document.getElementsByClassName("time")[i].innerHTML = day + "/" + month + "/"
                + year + " " + time.split(" ")[1] + " " + time.split(" ")[2];
        }
        else {
            document.getElementsByClassName("time")[i].innerHTML = "Đang xử lý";
        }
    }
}

function checkCart() {
    try {
        let cart_arr = localStorage.getItem("cart").split(";");
        $(".badgeNumberCartItem").show();
        $(".badgeNumberCartItem")[0].innerHTML = cart_arr.length;
        $(".badgeNumberCartItem")[1].innerHTML = cart_arr.length;
    }
    catch {
        $(".badgeNumberCartItem").hide();
    }
    
}

function closeAdvertisement() {
    $(document).ready(function () {
        $("center").hide();
        console.log($("body").children());
        for (let i = 3; i < $("body").children().length - 1; i++) {
            $($("body").children()[i]).remove();
        }
        console.log($("body").children());
    });
}
