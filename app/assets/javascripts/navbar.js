function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}






$(function () {
    $(window).scroll(function () {
        var currentScrollTop = $(window).scrollTop();
        $('#blackOverlay').css('opacity',currentScrollTop/$('#blackOverlay').height());

    });
});
