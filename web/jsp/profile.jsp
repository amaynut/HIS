<%-- 
    Document   : profile
    Created on : Jul 11, 2014, 2:51:28 AM
    Author     : Said GUERRAB
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="description" content="Patient home page" />
        <title>Hospital Information System: Patient home page</title>
        <%@include file="/WEB-INF/jspf/common_head.jspf" %>
        <script src="../js/jquery.maskedinput.js" type="text/javascript"></script>
        <link href="../BootStrapFormValidator/css/bootstrapValidator.min.css" rel="stylesheet" type="text/css"/>
        <script src="../BootStrapFormValidator/js/bootstrapValidator.min.js" type="text/javascript"></script>
        <script type="text/javascript">

            var inputFields = document.getElementsByTagName("input");
            function setReadOnly() {

                for (var i = 0; i < inputFields.length; i++) {
                    inputFields[i].disabled = true;
                }
            }
            function makeEditable() {

                for (var i = 0; i < inputFields.length; i++) {
                    inputFields[i].disabled = false;
                }
                document.getElementById("Edit").innerHTML = "Save";
                document.getElementById("save").type = "submit";

            }
        </script>
        <script type="text/javascript">
            jQuery(function($) {
                $("#DateOfBirth").mask("9999-99-99");
                $("#phone").mask("(999) 999-9999");
                $("#zipCode").mask("a9a-a9a");
                $("#state").mask("aa");
            });
        </script>
        <script>
            $(document).ready(function() {
                $('#form-profile').bootstrapValidator({
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        birthday: {
                            validators: {
                                date: {
                                    format: 'YYYY-MM-DD',
                                    message: 'The value is not a valid date'
                                }
                            }
                        },
                        email: {
                            validators: {
                                notEmpty: {
                                    message: 'The email is required and cannot be empty'
                                },
                                emailAddress: {
                                    message: 'The input is not a valid email address'
                                }
                            }
                        },
                        password: {
                            validators: {
                                identical: {
                                    field: 'confirmPassword',
                                    message: 'The password and its confirm are not the same'
                                }
                            }
                        },
                        confirmPassword: {
                            validators: {
                                identical: {
                                    field: 'password',
                                    message: 'The password and its confirm are not the same'
                                }
                            }
                        }
                    }
                });
                // send the form to the controller through Ajax call
                var form = $('#form-profile');
                form.submit(function() {

                    $.ajax({
                        type: form.attr('method'),
                        url: form.attr('action'),
                        data: form.serialize(),
                        success: function(data) {
                            $('#result').html(data);
                            $('#result').attr("class", "alert alert-success");
                        }
                    });

                    return false;
                });
            });
        </script>
    </head>
    <body onload="setReadOnly()">
        <%@include file="/WEB-INF/jspf/header.jspf" %>

        <div id="main-wrapper">
            <div class="container">
                <h1 style='text-align: center'>My Profile</h1>
                <!-- Profile Picture -->
                <div class="col-xs-10 col-sm-3 text-center">
                    <img src="http://api.randomuser.me/portraits/women/50.jpg" alt="profile picture" class="center-block img-circle img-responsive">
                </div>
                <form class="form-horizontal" id="form-profile" method="post" action="/NewHIS/update_profile">
                    <fieldset> 
                        <legend>Name: </legend> 
                        <!-- Text input-->                     
                        <div class="form-group">                          
                            <label class="col-md-4 control-label" for="firstName">First Name</label>  
                            <div class="col-md-4">
                                <input type="hidden" name="userType" value="${user.type}"/>
                                <input id="firstName" value="${user.firstName}" name="firstName" type="text" placeholder="First Name" class="form-control input-md" required="">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="lastName">Last Name</label>  
                            <div class="col-md-4">
                                <input id="lastName" name="lastName"  value="${user.lastName}" type="text" placeholder="Last Name" class="form-control input-md" required="">

                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend>Email & Password: </legend>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="email" >Email</label>  
                            <div class="col-md-4">
                                <input id="email" name="email" readonly="" value="${user.email}" type="text" placeholder="Email address" class="form-control input-md" required="">

                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-4 control-label">Password</label>
                            <div class="col-lg-3">
                                <input type="password" value="${user.password}" class="form-control" name="password" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-4 control-label">Retype password</label>
                            <div class="col-lg-3">
                                <input type="password" value="${user.password}" class="form-control" name="confirmPassword" placeholder="Repeat password"/>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <legend>Phone & Birthday: </legend>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="phone">Date of birth</label>  
                            <div class="col-md-3">
                                <input id="birthday" value="${user.birthday}" name="birthday" type="text" placeholder="Your birthday" class="form-control input-md">
                                <span class="help-block">Format: YYYY-MM-DD</span>  
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="phone">Phone</label>  
                            <div class="col-md-4">
                                <input id="phone" name="phone" value="${user.phone}" type="text" placeholder="Your phone number" class="form-control input-md">
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
                                <input id="street" value="${user.street}" name="street" type="text" placeholder="Street number and name" class="form-control input-md">
                                <span class="help-block">Street name and number</span>  
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="zipCode">Zip Code</label>  
                            <div class="col-md-4">
                                <input id="zipCode" value="${user.zipCode}" name="zipCode" type="text" placeholder="Postal Code" class="form-control input-md">
                                <span class="help-block">Format: H2L M8K</span>  
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="city">City</label>  
                            <div class="col-md-4">
                                <input id="city" value="${user.city}" name="city" type="text" placeholder="City" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="state">State</label>  
                            <div class="col-md-4">
                                <input id="state" value="${user.state}" name="state" type="text" placeholder="" class="form-control input-md">
                                <span class="help-block">Format: QC, AB, ON...</span>  
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="Country">Country</label>
                            <div class="col-md-4">
                                <select id="Country" name="Country" class="form-control">
                                    <option value="Canada">Canada</option>
                                    <option value="United State">United State</option>
                                </select>
                            </div>
                        </div>
                    </fieldset>
                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="Edit"></label>
                        <div class="col-md-4">
                            <a id="Edit" name="Edit" style="width:10em;" class="btn btn-primary" onclick="makeEditable()" >Edit</a>
                            <button id="save" name="Save" style="width:10em;" class="btn btn-primary" >Save</button>
                        </div>
                    </div>


                </form>
                <%-- Ajax Message for update will display here --%>
                <div  role="alert" id="result"> </div>
            </div>

        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
        <script type="text/javascript">

        </script>

    </body>
</html>

