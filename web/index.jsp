<%-- 
    Document   : index
    Created on : Jun 9, 2014, 8:12:51 PM
    Author     : Said GUERRAB
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <title>Hospital Information System: HOME PAGE</title>
        <%@include file="/WEB-INF/jspf/common_head.jspf" %>
    </head>
    <body>

        <div id="main-wrapper">
            <div class="container">
                <%@include file="/WEB-INF/jspf/banner.jspf" %>

            </div>
            <div class="jumbotron jumbotron-sm">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-lg-12">
                            <h1 class="h1">
                                Welcome to the Online HIS 
                                <a class="btn btn-primary btn-lg" href="login.jsp"> Sign In</a>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>


    </body>
</html>
