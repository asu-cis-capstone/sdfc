$(document).ready(function () {

    $('.tblRepeater').click(function () {
        if ($(this).next('.recordDetails').css('display') == 'none') {
            $(this).next('.recordDetails').slideDown();
        } else {
            $(this).next('.recordDetails').slideUp();
        }
    })

});