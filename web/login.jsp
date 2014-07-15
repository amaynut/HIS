<%-- 
    Document   : login
    Created on : 10-Jun-2014, 11:20:51 AM
    Author     : Said GUERRAB
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <title>Hospital Information System: HOME PAGE</title>
       
        <%@include file="WEB-INF/jspf/common_head.jspf" %>
         <script type="text/javascript">
            $(document).ready(function() {
                $('#olvidado').click(function(e) {
                    e.preventDefault();
                    $('div#form-olvidado').toggle('500');
                });
                $('#acceso').click(function(e) {
                    e.preventDefault();
                    $('div#form-olvidado').toggle('500');
                });
            });
        </script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <div id="main-wrapper">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 col-md-offset-3">
                        <h4 style="border-bottom: 1px solid #c5c5c5;">
                            <i class="glyphicon glyphicon-user">
                            </i>
                            Account Access
                        </h4>
                        <div style="padding: 20px;" id="form-olvidado">
                            <form accept-charset="UTF-8" role="form" id="login-form" method="get" action="login">
                                <fieldset>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">
                                            @
                                        </span>
                                        <input class="form-control" placeholder="Email" name="email" type="email" required="" autofocus="">
                                    </div>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">
                                            <i class="glyphicon glyphicon-lock">
                                            </i>
                                        </span>
                                        <input class="form-control" placeholder="Password" name="password" type="password" value="" required="">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Access
                                        </button>
                                        <p class="help-block">
                                            <a class="pull-right text-muted" href="#" id="olvidado"><small>Forgot your password?</small></a>
                                        </p>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div style="display: none;" id="form-olvidado">
                            <h4 class="">
                                Forgot your password?
                            </h4>
                            <form accept-charset="UTF-8" role="form" id="login-recordar" method="post">
                                <fieldset>
                                    <span class="help-block">
                                        Email address you use to log in to your account
                                        <br>
                                        We'll send you an email with instructions to choose a new password.
                                    </span>
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">
                                            @
                                        </span>
                                        <input class="form-control" placeholder="Email" name="email" type="email" required="">
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block" id="btn-olvidado">
                                        Continue
                                    </button>
                                    <p class="help-block">
                                        <a class="text-muted" href="#" id="acceso"><small>Account Access</small></a>
                                    </p>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="WEB-INF/jspf/footer.jspf" %>


    </body>
</html>

