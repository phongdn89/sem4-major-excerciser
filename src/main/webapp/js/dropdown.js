$(document).ready(function () {

    $("#click-dropdown").hover(function () {
        $('#a-true').attr("aria-expanded", true);
        $('#click-dropdown').addClass('show');
        $('#logout').addClass('show');
    }, function () {
        $('#a-true').attr("aria-expanded", false);
        $('#click-dropdown').removeClass('show');
        $('#logout').removeClass('show');
    });
    
    
    $(".header").css('z-index','8');
});