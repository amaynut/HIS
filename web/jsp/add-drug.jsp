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
        <script src="../js/SwitchUserType.js" type="text/javascript"></script>
        <%@page import="java.sql.*"%>
        <%@page import="java.util.*"%>
        <%@page import="database.ConnectToDB"%>
        <%!List<String> labsList;%>
        <%!List<String> namesList;%>
        <!-- Get the data from the data base for auto-complete -->
        <%
            try {
                Connection conn = ConnectToDB.ConnectToMySQL();
                Statement st1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                Statement st2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

                String queryLabs = "SELECT Distinct(Laboratory) from hospital.drug";
                String queryDrugNames = "SELECT Distinct(Name) from hospital.drug";
                ResultSet rsLabs = st1.executeQuery(queryLabs);
                ResultSet rsNames = st2.executeQuery(queryDrugNames);

                labsList = new ArrayList<>();
                while (rsLabs.next()) {
                    labsList.add("'" + rsLabs.getString(1) + "'");
                }
                namesList = new ArrayList<>();
                while (rsNames.next()) {
                    namesList.add("'" + rsNames.getString(1) + "'");
                }

            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>     
        <script src="<%=root%>/js/ListsForAutocomplete.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                var labs = eval(<%=labsList%>);
                var names = eval(<%=namesList%>);
                $("#lab").autocomplete({source: labs, minLength: 1});
                $("#name").autocomplete({source: names, minLength: 1});
            });</script>
            <%-- Check if the email exist with Ajax/Jquery/Java Servlet --%>
        <script src="<%=root%>/js/CheckEmail.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>

        <div id="main-wrapper">
            <div class="container">
                <h1 style='text-align: center'>Add a new drug</h1>
                <form class="form-horizontal" id="form_add_user" method="post" action="<%=root%>/AddDrug">                     
                    <fieldset>
                        <legend>Drug Information</legend>                          
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="name">Drug Name</label>  
                            <div class="col-md-4">
                                <input id="name" name="name" required="" type="text" placeholder="The drug name" class="form-control input-md">
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="price">Drug Price</label>  
                            <div class="col-md-4">
                                <input id="price" name="price" required="" type="number" step="any" placeholder="The drug price" class="form-control input-md">
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="lab">Drug Laboratory</label>  
                            <div class="col-md-4">
                                <input id="lab" name="lab" required="" type="text" placeholder="The drug lobaratory" class="form-control input-md">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4">
                                <input type="submit" value="add" class="btn-lg" />
                            </div>
                        </div>
                    </fieldset>                    

                </form>
                <%-- Ajax Message for update will display here --%>
                <div  role="alert" id="result"> </div>
            </div>

        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
    </body>
</html>

