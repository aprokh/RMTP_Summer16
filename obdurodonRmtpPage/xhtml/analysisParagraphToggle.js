window.addEventListener('DomContentLoaded',init,false);

function init() {
    var buttons = document.getElementsByTagName("button");
    buttons[0].addEventListener('click', show_hide, false);
}

function show_hide() {
    var ul = document.getElementById("metapersonsToggle");
    if (ul.style.display == "none") {
        ul.style.display = "block";
    } else {
        ul.style.display = "none";
    }
}