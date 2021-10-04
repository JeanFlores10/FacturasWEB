'use strict'



function solonumeros(e) {
    var key = window.Event ? e.which : e.keycode

    return (key >= 48 && key <= 57)
}

function validarEmail(email) {
    var regex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    var rpt = regex.test(email);
    return rpt;
}