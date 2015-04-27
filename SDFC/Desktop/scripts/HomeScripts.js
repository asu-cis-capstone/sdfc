$(document).ready(function () {

    var vars = [], hash;
    var q = document.URL.split('?')[1];
    if (q != undefined) {
        q = q.split('&');
        for (var i = 0; i < q.length; i++) {
            hash = q[i].split('=');
            vars.push(hash[1]);
            vars[hash[0]] = hash[1];
        }
    }

    if (vars['file'] != "" && vars['file'] != null) {
        alert('Your file was downloaded to C:\\Temp\\' + vars['file'])
    }

    $('.tblRepeater').click(function () {
        if ($(this).next('.recordDetails').css('display') == 'none') {
            $(this).next('.recordDetails').slideDown();
        } else {
            $(this).next('.recordDetails').slideUp();
        }
    })

});
