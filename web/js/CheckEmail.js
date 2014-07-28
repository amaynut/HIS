$(document).ready(function() {
    var valid = false;
    $('#email').blur(function() {
        $.ajax({
            url: "/NewHIS/checkPK",
            type: "post",
            datatype: "json",
            data: $('#form_add_user').serialize(),
            success: function(data) {
                if (data.alreadyExist) {
                    $('#result').html("This email address already exist");
                    $('div.email').addClass("has-error has-feedback");
                    $('div.email').addClass("has-feedback");
                    $('div.email').removeClass("has-success");
                    valid = false;
                } // end if
                else {
                    $('#result').html("");
                    $('div.email').addClass("has-success has-feedback");
                    $('div.email').addClass("has-feedback");
                    $('div.email').removeClass("has-error");
                    valid = true;
                } // end else
            } // end success
        }); // end .ajax
        return false;
    }); // end on blur event handler
//    if(valid){
//        $('#form_add_user').submit();
//    }
}); // end document ready


