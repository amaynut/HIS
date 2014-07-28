/* 
 *This file contains the JS code for the form profile.jsp
 */
var hidden = true;
window.onload = function() {
    BTN_edit = document.getElementById("Edit");
    BTN_save = document.getElementById("save");
    inputFields = document.getElementsByTagName("input");
    setReadOnly();
    // attach event to the buttons
    BTN_edit.onclick = makeEditable;
    document.getElementsByName("body").onload = hideButton;
};
function setReadOnly() {
    for (var i = 0; i < inputFields.length; i++) {
        inputFields[i].disabled = true;
    }
}
function makeEditable() {
    for (var i = 0; i < inputFields.length; i++) {
        inputFields[i].disabled = false;
    }
    BTN_save.type = "submit";
    hideButton();
}
function hideButton() {
    if (!hidden) {
        BTN_save.style.visibility = 'hidden';
        hidden = true;
    } else {
        BTN_save.style.visibility = 'visible';
        BTN_save.disabled = false;
        hidden = false;
    }
}

// BootStrap JQuery Validation **************************************************
$(document).ready(function() {
    $('#form-profile').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            birthday: {
                validators: {
                    date: {
                        format: 'YYYY-MM-DD',
                        message: 'The value is not a valid date'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            }
        }
    });
    // send the form to the controller through Ajax call
    var form = $('#form-profile');
    form.submit(function() {

        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function(data) {
                $('#result').html(data);
                $('#result').attr("class", "alert alert-success");
            }
        });

        return false;
    });
});

// Masks for certain fields 
jQuery(function($) {
    $("#DateOfBirth").mask("9999-99-99");
    $("#phone").mask("(999) 999-9999");
    $("#zipCode").mask("a9a-a9a");
    $("#state").mask("aa");
});