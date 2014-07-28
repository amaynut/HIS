<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Basic JSP-JQUERY Ajax Example</title>
        <script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript" ></script>
        <script src="js/basic.js" type="text/javascript"></script>
        <link href="css/basic.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <p class="Large">How to make Ajax call using JSP and JQuery</p>
        <form action="" id="updateUserName" method="post">
            <label for="username">What is your name?</label> <input type="text"
                                                                    name="userName" id="userName" />
            <input type="submit" value="Submit" />
            <p id="displayName" class="message"></p>

        </form>








    </body>
</html>