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
        <title>Hospital Information System: Medical Officer home page</title>
        <%@include file="/WEB-INF/jspf/common_head.jspf" %>
        <script type="text/javascript">
            var today = new Date();
            function showDate() {
                document.getElementById("today").innerHTML =  today.toLocaleDateString();             
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
        </script>

    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>       
        <div id="main-wrapper">
            <div class="container">
                <h1 style="text-align: center;">Hospital latest news</h1>
                <p>Date: <span id="today"></span> Time: <span id="time"></span></p>
                <div class="well">
                    <h2>Building a Hospital: A Labour of Love</h2>
                    <h3>March 21, 2014</h3>
                    <p>The McGill University Health Centre (MUHC) is undergoing 
                        some major changes and is preparing for the biggest move in 
                        its history—neither of which could be achieved without our dedicated staff. </p>
                    <p>“The design, the transition, the move—none of it could have been accomplished without 
                        the support and input of our personnel at all levels and from all departments,” 
                        says Imma Franco, associate director, Programs and Services Planning, MUHC. 
                        “They contributed to the development of the Glen site in addition to all of their 
                        regular work and they are still working extremely hard to ensure a smooth 
                        transfer—this hospital really is a labour of love.”</p>
                </div>
                <div class="well">
                    <h2>Thoracic surgery at the Montreal General Hospital</h2>
                    <h3>March 7, 2014</h3>
                    <p>As 2015 approaches, the Montreal General Hospital (MGH) is undergoing a 
                        significant transformation to prepare for the reorganization of services 
                        at the New MUHC. With its supraregional mandate and as the only unit of its 
                        kind within the McGill RUIS, Thoracic Surgery will continue to be a key program 
                        committed to providing comprehensive care for thoracic oncology patients.  
                        Thoracic surgical services will be centralized at the MGH and renovations 
                        will be carried out in order to provide dedicated space for inpatients, 
                        ambulatory care and research. The creation of a specialized 20-bed ward and 
                        an outpatient clinic will ensure the efficacious management of thoracic 
                        oncology patients requiring surgical intervention.</p>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>


    </body>
</html>