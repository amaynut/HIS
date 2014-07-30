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
        <script>
            /*
            $(document).ready(function() {
                $('table').dataTable();
            });
            */
        </script>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>       
        <div id="main-wrapper">
            <div class="container">
                <h1 style="text-align: center;">User Added successfully</h1>
                <p>Date: <span id="today"></span> Time: <span id="time"></span></p>
                <div class="well well-lg">
                    <div class="alert alert-success">
                        <p>The new user was added successfully to the system.</p>
                    </div>
                    <%
                        String UserType = (String) session.getAttribute("type");
                        switch (UserType) {
                            case "MedicalOfficer":
                                UserType = "Medical Officer";
                                break;
                            case "MedicalAssistant":
                                UserType = "Medical Assistant";
                                break;
                            default:
                                UserType = UserType;
                        }
                    %>
                    <table class="table table-striped table-bordered table-hover table-responsive">
                        <tr><th>User Type: </th><td><%=UserType%></td></tr>
                        <tr><th>First Name: </th><td><%=session.getAttribute("firstName")%></td></tr>
                        <tr><th>Last Name: </th><td><%=session.getAttribute("lastName")%></td></tr>
                        <tr><th>Email Address: </th><td><%=session.getAttribute("email")%></td></tr>
                        <tr><th>Gender: </th><td><%=session.getAttribute("gender")%></td></tr>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>


    </body>
</html>