<%-- 
    Document   : profile
    Created on : Jul 11, 2014, 2:51:28 AM
    Author     : Said GUERRAB
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description" content="Patient home page" />
        <title>Hospital Information System: Patient home page</title>     
        <%@include file="/WEB-INF/jspf/common_head.jspf" %>      
        <script src="../js/SwitchUserType.js" type="text/javascript"></script>
        <%@page import="java.sql.*"%>
        <%@page import="java.util.*"%>
        <%@page import="database.ConnectToDB"%>
        <%!List<String> specialitiesList;%>
        <!-- Get the data from the data base for auto-complete -->
        <%
            try {
                Connection conn = ConnectToDB.ConnectToMySQL();
                Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

                String sql = "select Distinct(Specialty) from Hospital.Doctor";
                ResultSet rs = st.executeQuery(sql);

                specialitiesList = new ArrayList<>();
                while (rs.next()) {
                    specialitiesList.add("'" + rs.getString("Specialty") + "'");
                }

            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>     
        <script src="<%=root%>/js/ListsForAutocomplete.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                var specialities = eval(<%=specialitiesList%>);
                $("#specialty").autocomplete({source: specialities, minLength: 2});
                $("#country").autocomplete({source: countries, minLength: 2});
                $('.datepicker').datepicker();
            });</script>
            <%-- Check if the email exist with Ajax/Jquery/Java Servlet --%>
        <script src="<%=root%>/js/CheckEmail.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>

        <div id="main-wrapper">
            <div class="container">
                <h1 style='text-align: center'>Add User</h1>
                <form class="form-horizontal" id="form_add_user" method="post" action="<%=root%>/AddUser">
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="Country">Select user type:</label>
                        <div class="col-md-4">
                            <select id="UserType" name="UserType" class="form-control">
                                <option value="default">Select a user type</option>
                                <option value="Doctor">Doctor</option>
                                <option value="Patient">Patient</option>
                                <option value="MedicalAssistant">Medical Assistant</option>
                                <option value="MedicalOfficer">Medical Officer</option>
                            </select>
                        </div>
                    </div>
                    <%-- Common Field --%>
                    <div id="common_fields" style="display:none" >
                        <fieldset> 
                            <legend>Name: </legend> 
                            <!-- Text input-->                     
                            <div class="form-group">                          
                                <label class="col-md-4 control-label" for="firstName">First Name</label>  
                                <div class="col-md-4">
                                    <input id="firstName" value="" name="firstName" type="text" placeholder="First Name" class="form-control input-md" required="">
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="lastName">Last Name</label>  
                                <div class="col-md-4">
                                    <input id="lastName" name="lastName"  value="" type="text" placeholder="Last Name" class="form-control input-md" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="lastName">Gender</label>  
                                <div class="col-md-4">
                                    <select id="gender" name="gender" class="form-control">
                                        <option value="">Select Gender</option>
                                        <option value="Man">Man</option>
                                        <option value="Woman">Woman</option>
                                    </select>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Email & Password: </legend>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="email" >Email</label>  
                                <div class="col-md-4 email">
                                    <input id="email" name="email"  value="" type="text" placeholder="Email address" class="form-control input-md" required="">
                                    <span id="result" style="color:red;"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-4 control-label">Password</label>
                                <div class="col-lg-3">
                                    <input type="password" value="" class="form-control" name="password" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-4 control-label">Retype password</label>
                                <div class="col-lg-3">
                                    <input type="password" value="" class="form-control" name="confirmPassword" placeholder="Repeat password"/>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Phone & Birthday: </legend>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="phone">Date of birth</label>  
                                <div class="col-md-3">
                                    <input id="birthday" value="" name="birthday" type="text" placeholder="Your birthday" class="form-control input-md">
                                    <span class="help-block">Format: YYYY-MM-DD</span>  
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="phone">Phone</label>  
                                <div class="col-md-4">
                                    <input id="phone" name="phone" value="" type="tel" placeholder="Your phone number" class="form-control input-md">
                                    <span class="help-block">Format: 514-854-6985</span>  
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Address: </legend>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="street">Street</label>  
                                <div class="col-md-4">
                                    <input id="street" value="" name="street" type="text" placeholder="Street number and name" class="form-control input-md">
                                    <span class="help-block">Street name and number</span>  
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="zipCode">Zip Code</label>  
                                <div class="col-md-4">
                                    <input id="zipCode" value="" name="zipCode" type="text" placeholder="Postal Code" class="form-control input-md">
                                    <span class="help-block">Format: H2L M8K</span>  
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="city">City</label>  
                                <div class="col-md-4">
                                    <input id="city" value="" name="city" type="text" placeholder="City" class="form-control input-md">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="state">State</label>  
                                <div class="col-md-4">
                                    <input id="state" value="" name="state" type="text" placeholder="" class="form-control input-md">
                                    <span class="help-block">Format: QC, AB, ON...</span>  
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="state">Country</label>  
                                <div class="col-md-4">
                                    <input id="country" value="" name="country" type="text" placeholder="Type for auto-completion..." class="form-control input-md">
                                </div>
                            </div>                       
                        </fieldset>
                    </div>
                    <%-- Doctor Field --%>
                    <fieldset style="display:none" id="fs_specialty">
                        <legend>Specialty</legend>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="specialty">Choose Specialty</label>  
                            <div class="col-md-3">
                                <input id="specialty" value="" name="specialty" placeholder="Type for auto-completion" type="text"  class="form-control input-md">
                            </div>
                        </div>
                    </fieldset>
                    <fieldset style="display:none" id="fs_check_in_out">
                        <legend>Check in & Check out dates</legend>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="checkIn">Check in date:</label>  
                            <div class="col-md-3">
                                <input id="checkIn" class="date datepicker" size="16" type="text" value="" data-date-format="dd-mm-yyyy">
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="checkOut">Check out date:</label>  
                            <div class="col-md-3">
                                <input id="checkOut" class="date datepicker" size="16" type="text" value="" data-date-format="dd-mm-yyyy">
                            </div>
                        </div>
                    </fieldset>
                    <!-- Button -->
                    <div class="form-group">
                        <div class="col-md-4">
                            <button id="save" name="Save" style="width:10em;" class="btn btn-primary">Save</button>
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

