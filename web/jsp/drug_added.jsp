<%-- 
    Document   : index
    Created on : Jul 11, 2014, 2:51:28 AM
    Author     : Said
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description" content="Medical Officer home page" />
        <title>Hospital Information System</title>
        <%@include file="/WEB-INF/jspf/common_head.jspf" %>
        <script src="<%=root%>/js/ShowDateTime.js" type="text/javascript"></script>

    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>       
        <div id="main-wrapper">
            <div class="container">
                <h1 style="text-align: center;">Drug Added successfully</h1>
                <p>Date: <span id="today"></span> Time: <span id="time"></span></p>
                <div class="well well-lg">
                    <div class="alert alert-success">
                        <p>The new drug was added successfully to the database, with the following information.</p>
                    </div>
                    <table class="table table-striped table-bordered table-hover table-responsive">
                        <tr><th>Drug Name </th><td>${drug.name}</td></tr>
                        <tr><th>Drug Price </th><td>${drug.price}</td></tr>
                        <tr><th>Drug Laboratory </th><td>${drug.lab}</td></tr>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>


    </body>
</html>