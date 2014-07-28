$(document).ready(function() {

    var today = new Date();
    function showDate() {
        document.getElementById("today").innerHTML = today.toLocaleDateString();
    }
    window.onload = showDate;
    var myVar = setInterval(function() {
        myTimer();
    }, 1000);

    function myTimer() {
        var d = new Date();
        var t = d.toLocaleTimeString();
        document.getElementById("time").innerHTML = t;
    }

});


