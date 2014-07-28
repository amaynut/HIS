window.onload = init;
var UserTypeList;
var commonFields;
var fs_specialty;
var fs_check_in_out;
var UserType;
function init() {
    // get the selected option
    commonFields = document.getElementById("common_fields");
    UserTypeList = document.getElementById("UserType");
    fs_specialty = document.getElementById("fs_specialty");
    fs_check_in_out = document.getElementById("fs_check_in_out");
    UserTypeList.onchange = function() {
        UserType = UserTypeList.options[UserTypeList.selectedIndex].value;
        if (UserType === "Doctor") {
            ShowFields(commonFields);
            ShowFields(fs_specialty);
            HideFields(fs_check_in_out);
        }
        else if (UserType === "Patient") {
            ShowFields(commonFields);
            ShowFields(fs_check_in_out);
            HideFields(fs_specialty);
        }
        else if (UserType === "MedicalAssistant" || UserType === "MedicalOfficer") {
            ShowFields(commonFields);
            HideFields(fs_specialty);
            HideFields(fs_check_in_out);
        }
        else {
            HideFields(commonFields);
            HideFields(fs_specialty);
            HideFields(fs_check_in_out);
        }
    };
}
function ShowFields(fields) {
    fields.style.display = "";
}
function HideFields(fields) {
    fields.style.display = 'none';
}


