/**/
let password = document.getElementById("txtpassword");
let confirmpassword = document.getElementById("txtpasswordconfirm");


/*MOSTRAR ICONO OJITO DE CONTRASEÑA*/
$("#bi-eye").on("click", function () {
    if (password.type === 'password') {
    password.setAttribute('type', 'text');
    $("#bi-eye-slash").show();
    $("#bi-eye").hide();
    }
})

$("#bi-eye-slash").on("click", function () {
    if (password.type === 'text') {
        password.setAttribute('type', 'password');
        $("#bi-eye-slash").hide();
        $("#bi-eye").show();
    }
})

$('#txtpassword').keyup(function () {
    let password1 = $('#txtpassword').val();
    let confirmpassword1 = $('#txtpasswordconfirm').val();

    if (password1.trim() == "") {
        password.setAttribute('type', 'password');
        $("#bi-eye-slash").hide();
        $("#bi-eye").show();
        $("#msjpassword").html("").css("color", "red") 
    } else {
        $("#bi-eye").show();

        if (!/[A-Z]/.test(password1)) {
            $("#msjpassword").html("*La contraseña debe tener una mayúscula").css("color", "red");
            $("#txtpassword").css("border-color", "red");
            document.getElementById("btnregistrar").disabled = true;
        } else if (!/[a-z]/.test(password1)) {
            $("#msjpassword").html("* La contraseña debe tener una minúscula").css("color", "red");
            $("#txtpassword").css("bordr-color", "red");
            document.getElementById("btnregistrar").disabled = true;
        } else if (!/[#@!$%=]/.test(password1)) {
            $("#msjpassword").html("* La contraseña debe tener un caracter especial").css("color", "red");
            $("#txtpassword").css("border-color", "red");
            document.getElementById("btnregistrar").disabled = true;
        } else if (password1.length < 8) {
            $("#msjpassword").html("*La contraseña debe tener mínimo 8 caracteres").css("color", "red");
            $("#txtpassword").css("border-color", "red");
            document.getElementById("btnregistrar").disabled = true;
        } else if (confirmpassword1 != "") {
            if (confirmpassword1 != password1) {
                $("#msjpassword").html("*Las contraseñas no coinciden").css("color", "red");
                $("#txtcontraseña").css("border-color", "red");
                document.getElementById("btnregistrar").disabled = true;
            }
            else {
                $("#msjpassword").html("").css("color", "red");
                $("#txtpassword").css("border-color", "");
                $("#msjconfirmpassword").html("").css("color", "red");
                document.getElementById("btnregistrar").disabled = false;
            }
        } else {
            $("#msjpassword").html("").css("color", "red");
            $("#txtpassword").css("border-color", "");
            document.getElementById("btnregistrar").disabled = false;
        }

    }
})


/*MOSTRAR ICONO OJITO DE CONFIRMAR CONTRASEÑA*/

$("#bi-eye-confirm").on("click", function () {
    if (confirmpassword.type === 'password') {
        confirmpassword.setAttribute('type', 'text');
        $("#bi-eye-slash-confirm").show();
        $("#bi-eye-confirm").hide();
    }
})

$("#bi-eye-slash-confirm").on("click", function () {
    if (confirmpassword.type === 'text') {
        confirmpassword.setAttribute('type', 'password');
        $("#bi-eye-slash-confirm").hide();
        $("#bi-eye-confirm").show();
    }
})

$('#txtpasswordconfirm').keyup(function () {
    let password1 = $('#txtpassword').val();
    let confirmpassword1 = $('#txtpasswordconfirm').val();

    if (confirmpassword1.trim() == "") {
        confirmpassword.setAttribute('type', 'password');
        $("#bi-eye-slash-confirm").hide();
        $("#bi-eye-confirm").show();
        $("#msjconfirmpassword").html("").css("color", "red")
    } else {
        $("#bi-eye-confirm").show();

        if (!/[A-Z]/.test(confirmpassword1)) {
            $("#msjconfirmpassword").html("*La contraseña debe tener una mayúscula").css("color", "red");
            $("#txtpasswordconfirm").css("border-color", "red");
            document.getElementById("btnregistrar").disabled = true;
        } else if (!/[a-z]/.test(confirmpassword1)) {
            $("#msjconfirmpassword").html("* La contraseña debe tener una minúscula").css("color", "red");
            $("#txtpasswordconfirm").css("bordr-color", "red");
            document.getElementById("btnregistrar").disabled = true;
        } else if (!/[#@!$%=]/.test(confirmpassword1)) {
            $("#msjconfirmpassword").html("* La contraseña debe tener un caracter especial").css("color", "red");
            $("#txtpasswordconfirm").css("border-color", "red");
            document.getElementById("btnregistrar").disabled = true;
        } else if (confirmpassword1.length < 8) {
            $("#msjconfirmpassword").html("*La contraseña debe tener mínimo 8 caracteres").css("color", "red");
            $("#txtpasswordconfirm").css("border-color", "red");
            document.getElementById("btnregistrar").disabled = true;
        } else if (confirmpassword1 != "") {
            if (password1 != confirmpassword1) {
                $("#msjconfirmpassword").html("*Las contraseñas no coinciden").css("color", "red");
                $("#txtpasswordconfirm").css("border-color", "red");
                document.getElementById("btnregistrar").disabled = true;
            }
            else {
                $("#msjconfirmpassword").html("").css("color", "red");
                $("#msjpassword").html("").css("color", "red");
                $("#txtpasswordconfirm").css("border-color", "");
                document.getElementById("btnregistrar").disabled = false;
            }
        } else {
            $("#msjconfirmpassword").html("").css("color", "red");
            $("#txtpasswordconfirm").css("border-color", "");
            document.getElementById("btnregistrar").disabled = false;
        }

    }
})


