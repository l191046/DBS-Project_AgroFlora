﻿//function validate_signin() {
//    var username, password;
//    username = document.getElementById("txt_username").value;
//    password = document.getElementById("txt_password").value;

//    var valid = true;
//    var msg = "";
//    if (username == "") {
//        msg += "Please enter Username\n";
//        valid = false;
//    }
//    if (password == "") {
//        msg += "Please enter password\n";
//        valid = false;
//    }

//    if (!valid) {
//        alert(msg);
//    }
//    return valid;
//}


function error_invalid_credentials() {
    document.getElementById("txt_credentials").className = "error";

    return false;
}