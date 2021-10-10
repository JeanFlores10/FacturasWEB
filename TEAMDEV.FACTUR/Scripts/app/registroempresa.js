'use strict'

/*mostrar por defecto porcentaje*/
$(document).ready(function () {
    document.getElementById('rdsi').checked = true;
    $('#divImpuestos').show();
})


/*Visualizar imagen*/
var img = $('#imagen')
var prev = $('.previsualizar')
$('#imagen').change(function () {

    let imagen = this.files[0];

    if (imagen["type"] != "image/jpg" && imagen["type"] != "image/png" && imagen["type"] != "image/jpeg") {
        img.val("");
        prev.attr("src", "../Content/images/logo_size.jpg");
        alert("Debe subir una imagen en formato jpg o png");
    } else if (imagen["size"] > 200000) {
        img.val("");
        prev.attr("src", "../Content/images/logo_size.jpg");
        alert("La imagen debe tener como maximo 2MB");
    } else {
        var datosImagen = new FileReader;
        datosImagen.readAsDataURL(imagen);

        $(datosImagen).on("load", function (event) {
            var rutaImagen = event.target.result;
            $(prev).attr("src", rutaImagen);
        })
    }
})

/*MOSTRAR si marca si o no en el radio ¿vende por porcentaje?*/
$('#rdsi').on("click", function () {
    document.getElementById('rdno').checked = false;
    document.getElementById('rdsi').checked = true;
    $('#divImpuestos').show();
})
$('#rdno').on("click", function () {
    document.getElementById('rdno').checked = true;
    document.getElementById('rdsi').checked = false;
    $('#divImpuestos').hide();
})

/*validar campos*/
$('#btnsiguiente').on("click", function () {

    let razonsocial = $('#txtrazonsocial').val();
    let ruc = $('#txtruc').val();
    let email = $('#txtemail').val();

    if (razonsocial == "") {
        $('#msjrazonsocial').html("* El campo razón social no debe estar vacío.").css("color", "red");
        $('#txtrazonsocial').css("border-color", "red");
        $('#txtrazonsocial').focus();
    } else if (ruc == "") {
        $('#msjruc').html("* El campo RUC no debe estar vacío.").css("color", "red");
        $('#txtruc').css("border-color", "red");
        $('#txtruc').focus();
    } else if (email == "") {
        $('#msjemail').html("* El campo email no debe estar vacío.").css("color", "red");
        $('#txtemail').css("border-color", "red");
        $('#txtemail').focus();
    }
    else if (!validarEmail(email)) {
        $('#msjemail').html("* Debe ingresar un email válido").css("color", "red");
        $('#txtemail').css("border-color", "red");
    }
    else {
        var paramss = new Object();
        paramss.razonsocial = razonsocial;
        paramss.ruc = ruc;
        paramss.email = email;

        POST("RegistroEmpresa/validarRegistro", paramss).done(function (datos) {
            if (datos.dt.response == "ok") {
                $(".divregistroempresa").hide();
                $(".divregistrousersuperadmin").show();
                document.getElementById("btnregistrar").disabled = true;
            } else {
                swal({
                    position: "top-end",
                    type: "error",
                    title: datos.dt.response,
                    text: 'Por favor valida el campo solicitado',
                    showConfirmButton: true,
                    timer: 60000,
                    confirmButtonText: 'Cerrar'
                })
            }
        })
    }

});

$('#txtrazonsocial').keyup(function () {
    let razonsocial = $('#txtrazonsocial').val();
    if (razonsocial == "") {
        $('#msjrazonsocial').html("* El campo razón social no debe estar vacío.").css("color", "red");
        $('#txtrazonsocial').css("border-color", "red");
    } else {
        $('#msjrazonsocial').html("").css("color", "red");
        $('#txtrazonsocial').css("border-color", "");
    }
});

$('#txtruc').keyup(function () {
    let ruc = $('#txtruc').val();
    if (ruc == "") {
        $('#msjruc').html("* El campo RUC no debe estar vacío.").css("color", "red");
        $('#txtruc').css("border-color", "red");
    } else {
        $('#msjruc').html("").css("color", "red");
        $('#txtruc').css("border-color", "");
    }
});

$('#txtemail').keyup(function () {
    let email = $('#txtemail').val();
    if (email == "") {
        $('#msjemail').html("* El campo email no debe estar vacío.").css("color", "red");
        $('#txtemail').css("border-color", "red");
    } else {
        if (!validarEmail(email)) {
            $('#msjemail').html("* Debe ingresar un email válido").css("color", "red");
            $('#txtemail').css("border-color", "red");
        }
        else {
            $('#msjemail').html("").css("color", "red");
            $('#txtemail').css("border-color", "");
        }   
    }
})


$("#btnregistrar").on("click", function () {

    let razonsocial = $("#txtrazonsocial").val();
    let ruc = $("#txtruc").val();
    let email = $("#txtemail").val();
    let idpais = $("#slpais").val();
    let idmoneda = $("#slmoneda").val();
    let direccion = $("#txtdireccion").val();

    let idimpuesto = 0;
    let idporcentaje = 0;
    let vendeimpuesto = 0;

    let username = $("#txtusername").val();
    let usuario = $("#txtusuario").val();
    let password = $("#txtpassword").val();
    let confirmpassword = $("#txtpasswordconfirm").val();

    if ($("#rdsi").is(":checked")) {
        idimpuesto = $("#sltipoimpuesto").val();
        idporcentaje = $("#slporcentaje").val();
        vendeimpuesto = 1;
    }
    if (username == "") {
        $("#msjusername").html("*El campo nombre de administrador no debe estar vacio").css("color", "red");
        $("#txtusername").css("border-color", "red");
        $("#txtusername").focus();
    }
    else if (usuario == "") {
        $("#msjusuario").html("*El campo nombre de usuario no debe estar vacio").css("color", "red");
        $("#txtusuario").css("border-color", "red");
        $("#txtusuario").focus();
    }
    else if (password == "") {
        $("#msjpassword").html("*El campo contraseña no debe estar vacio").css("color", "red");
        $("#txtpassword").css("border-color", "red");
        $("#txtpassword").focus();
    }
    else if (password == "") {
        $("#msjconfirmpassword").html("*El campo confirmar contraseña no debe estar vacio").css("color", "red");
        $("#txtpasswordconfirm").css("border-color", "red");
        $("#txtpasswordconfirm").focus();
    } else {
        let params = new FormData();
        let slfile = ($("#imagen"))[0].files[0];

        params.append("file", slfile);
        params.append("razonsocial", razonsocial);
        params.append("ruc", ruc);
        params.append("email", email);
        params.append("idpais", idpais);
        params.append("idmoneda", idmoneda);
        params.append("direccion", direccion);
        params.append("idimpuesto", idimpuesto);
        params.append("idporcentaje", idporcentaje);
        params.append("vendeimpuesto", vendeimpuesto);
        params.append("username", username);
        params.append("usuario", usuario);
        params.append("password", password);

        PostImg("RegistroEmpresa/insertarEmpresa", params).done(function (datos) {
            if (datos.dt.response == "Ok") {
                console.log("Listo")
                swal({
                    position: 'top-end',
                    type: 'success',
                    title: 'Empresa guardada correctamente',
                    text: 'Se envió un correo con sus accesos',
                    showConfirmButton: true,
                    timer: 60000,
                    confirmButtonText: 'Cerrar'
                }).then((result) => {
                    if (result.value) {
                        //windows.location = fnBaseURLWeb("Home/Index");
                    } else {
                        //windows.location = fnBaseURLWeb("Home/Index");
                    }
                })
            }
            else {
                swal({
                    position: 'top-end',
                    type: 'error',
                    title: 'Error',
                    text: 'No se registró la cuenta',
                    showConfirmButton: true,
                    timer: 60000,
                    confirmButtonText: 'Cerrar'
                })
            }
        })
    }

})

