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
        <jsp:useBean id="today" class="java.util.Date" scope="session" />
        <div id="main-wrapper">
            <div class="container">
                <h1 style="text-align: center;">Prescription Added successfully</h1>
                <p>Date: <span id="today"></span> Time: <span id="time"></span></p>
                <div class="well well-lg">
                    <div class="alert alert-success">
                        <p>The new prescription was added successfully to the database, with the following information.</p>
                    </div>
                    <table class="table table-striped table-bordered table-hover table-responsive">
                        <c:set var="lastName" value="${fn:toUpperCase(user.lastName)}" />
                        <tr><th>Doctor Name </th><td>${user.firstName} ${lastName} </td></tr>
                        <tr><th>Patient Name </th><td>${patient.firstName} ${fn:toUpperCase(patient.lastName)}</td></tr>
                        <tr><th>Patient Date Of Birth </th><td>${patient.birthday} </td></tr>
                        <tr><th>Date </th><td> <fmt:formatDate value="${today}" dateStyle="Full"/></td></tr>
                        <tr><th>Drug List </th>
                            <td>                             
                                <c:forEach var="drug" items="${drugs}">                                      
                                    - <c:out value="${drug}" /> <br>
                                </c:forEach>                                  
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>


    </body>
</html>