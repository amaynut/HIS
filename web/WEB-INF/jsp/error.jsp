<%-- 
    Document   : error
    Created on : Jul 7, 2014, 3:06:45 AM
    Author     : Said
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>The page you have visited generated an error!</h1>
        <jsp:expression>
                request.getRequestURI()
        </jsp:expression>
    </body>
</html>
