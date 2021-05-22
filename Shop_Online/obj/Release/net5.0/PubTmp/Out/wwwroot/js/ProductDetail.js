var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("demo");
    if (n > slides.length) { slideIndex = 1 }
    if (n < 1) { slideIndex = slides.length }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
}

function activeSlideShow() {
    slideShows = document.getElementsByClassName("carousel-item");
    slideShows[0].classList.add("active");
}

function addProductToCart(id) {
    let cart = localStorage.getItem("cart");
    if (cart != null && cart!="") {
        let id_array = cart.split(";");
        let isProductExist = false;
        id_array.forEach(item => {
            item_id = item.split("-")[0];
            if (item_id == id) isProductExist = true;
        })
        if (isProductExist == false) localStorage.setItem("cart", cart + ";" + id + "-1");
    }
    else {
        localStorage.setItem("cart", id+"-1");
    }
    console.log(localStorage.getItem("cart"));
    sendRequest();
}

function breakDownLine(id) {
    let paragraph = document.getElementById(id).innerHTML;
    let lines = paragraph.split("\\n");
    let newParagraph = "";
    lines.forEach(line => {
        line = line.replace("\\n", "");
        let parts = line.split(":");
        if (parts.length > 0) {
            parts[0] = "<strong>" + parts[0] + ": " + "</strong>";
            let tempLine = "";
            parts.forEach(part => tempLine += part);
            newParagraph = newParagraph + tempLine + "<br>"
        }
        else {
            newParagraph = newParagraph + line + "<br>"
        }
    });
    document.getElementById(id).innerHTML = newParagraph;
}

function buyNow(id) {
    addProductToCart(id);
    navigateCart();
}
