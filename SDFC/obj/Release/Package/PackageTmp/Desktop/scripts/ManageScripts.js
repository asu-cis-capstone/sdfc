$(document).ready(function () {
    
    $('.tblRepeater').click(function () {
        if ($(this).next('.empDetails').css('display') == 'none') {
            $(this).next('.empDetails').slideDown();
        } else {
            $(this).next('.empDetails').slideUp();
        }
    })

});