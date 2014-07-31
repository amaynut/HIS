<%-- 
    Document   : profile
    Created on : Jul 11, 2014, 2:51:28 AM
    Author     : Said GUERRAB
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description" content="Patient home page" />
        <title>Hospital Information System: Add a new drug</title>     
        <%@include file="/WEB-INF/jspf/common_head.jspf" %> 
        <script src="../js/listBuilder.js" type="text/javascript"></script>
        <%@page import="java.sql.*"%>
        <%@page import="java.util.*"%>
        <%@page import="database.ConnectToDB"%>
        <%!List<String> patientsList;%>
        <%!List<String> drugsList;%>
        <!-- Get the data from the data base for auto-complete -->
        <%
            try {
                Connection conn = ConnectToDB.ConnectToMySQL();
                Statement st1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                Statement st2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

                String queryPatients = "SELECT Distinct(email) FROM hospital.patient";
                ResultSet rsPatients = st1.executeQuery(queryPatients);
                
                patientsList = new ArrayList<>();
                while (rsPatients.next()) {
                    patientsList.add('"' + rsPatients.getString(1) + '"');
                }
                               
                String queryDrugNames = "SELECT Distinct(Name) From hospital.drug";                             
                ResultSet rsDrugs = st2.executeQuery(queryDrugNames);

                drugsList = new ArrayList<>();
                while (rsDrugs.next()) {
                    drugsList.add('"' + rsDrugs.getString(1) + '"');
                }

            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>     
        <script type="text/javascript">
            $(document).ready(function() {
                var patients = eval(<%=patientsList%>);
                var drugs = eval(<%=drugsList%>);
                $("#patientEmail").autocomplete({source: patients, minLength: 2});
                $("#addForm").autocomplete({source: drugs, minLength: 1});
            });</script>
            <%-- Check if the email exist with Ajax/Jquery/Java Servlet --%>
        <script src="<%=root%>/js/CheckEmail.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
       
        <div id="main-wrapper">
            <div class="container">
                <h1 style='text-align: center'>Add a new prescription</h1>
                <form class="form-horizontal" id="shopping-form" method="post" action="<%=root%>/AddPrescription">  
                    <fieldset>
                        <legend>Prescription Information</legend>                          
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="name">Patient Email</label>  
                            <div class="col-md-4">
                                <input id="patientEmail" name="patientEmail" required="" type="text" class="form-control input-md">
                            </div>
                        </div>  
                    </fieldset>
                    <fieldset class="center-block">
                        <legend>Drug list</legend>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="lab">Add a new drug</label>  
                            <div class="col-md-4"> 
                                <input type = "text" maxlength = "45" class="form-control input-md" id="addForm" placeholder="add a drug">
                            </div>
                            <div class="col-md-4">
                                <button id = "add" type="button" class="btn-sm btn-success">Add</button>
                                <button id = "remove" type="button" class="btn-sm btn-warning">Remove</button>
                            </div>
                        </div>                          
                    </fieldset>  

                    <style>
                        #DrugList {width: 20%; margin-left: 40%;} 
                        .checkbox-inline,  .checkcheckcheck {
                            float: left;
                        }                                                   
                    </style>
                    <div class="form-group" id="DrugList">

                    </div>           
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4" for="name"></label>  
                        <div class="col-sm-4">
                            <input type="submit" value="Send" class="btn-primary form-control" />
                        </div>
                    </div>  
                </form>
                <%-- Ajax Message for update will display here --%>
                <div  role="alert" id="result"> </div>
            </div>

        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>

