<%-- 
    Document   : login
    Created on : Jul 12, 2014, 3:21:45 PM
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
        <h1>Login</h1>
        <form name="login" action="controller" method="POST">
            <input type="hidden" name="action" value="login" />
            <input type="hidden" name="result" value="" />
            <input type="text" name="Name" value="" size="30" />
            <input type="password" name="Password" value="" size="30" />
            <input type="submit"  value="Submit" name="send"/>
        </form>
        <p>
            <%
                if (request.getParameter("send") != null) {
                    out.print("Result: "+request.getAttribute("result"));
                }
            %>
        </p>
    </body>
</html>
