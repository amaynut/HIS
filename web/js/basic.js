$(document).ready(function() {
    $('#updateUserName').submit(function() {
        $.ajax({
            url: "/NewHIS/update",
            type: "POST",
            datatype: "json",
            data: $('#updateUserName').serialize(),
            success: function(data) {
                if (data.isValid) {
                    $('#displayName').removeClass("error");
                    $('#displayName').addClass("success");
                    $('#displayName').html("Your name is: " + data.userName);
                    $('#displayName').slideDown(1000);
                }
                else {
                    $('#displayName').removeClass("success");
                    $('#displayName').addClass("error");
                    $('#displayName').html("Please enter a valid username");
                    $('#displayName').slideDown(1000);
                }
            }
        });
        return false;
    });

});