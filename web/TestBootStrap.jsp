<%-- 
    Document   : TestBootStrap
    Created on : Jul 14, 2014, 1:14:58 PM
    Author     : Said
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery.min.js"></script>

        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
          <script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Hospital Information System</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <div class="page-header">
            <h1>Test Bootstrap <small>Subtext for header</small></h1>
        </div>
        <div class="well  well-lg">
            The main text goes here
        </div>

        <!--  Footer -->
        <style>
            .img_footer { width: 6em;}
            .location {height: 7em; width: 5em;}

            hr { color: #7FA423;
                 background-color: white;
                 height: 2px;
                 width: 95%;
            }

        </style>
        <hr>
        <div id="footer">
            <div class="container">
                <div class="row">
                    <h3 class="footertext">About Us:</h3>
                    <br>
                    <div class="col-md-4">

                        <img src="images/emergency_call.png" class="img_footer" alt="Emergency Numbers" >
                        <br>
                        <h4 class="footertext">Emergency Numbers</h4>

                        <ul>
                            <li>Montreal Police: (514) 280-2222</li>
                            <li>Ambulance/ Fire/ Police: 911</li>
                            <li>Info-Crime Quebec: 1 800 711-1800</li>
                            <li>Gas/Odor Detection: (514) 598-3111</li>
                            <li>Urgence Santé: (514) 723-5600</li>
                        </ul>


                    </div>
                    <div class="col-md-4">

                        <img src="images/email.png" class="img_footer" alt="Contact Information" >
                        <br>
                        <h4 class="footertext">Contact Information</h4>
                        <ul>
                            <li>Phone 1: +1 885 968 9658 </li>
                            <li>Phone 2: +1 854 152 9654</li>
                            <li>Fax: +1 148 458 9658</li>
                            <li>Email: contact@onlinehis.com</li>
                        </ul>

                    </div>
                    <div class="col-md-4">

                        <img src="images/location.png" class="img_footer location" alt="Location">
                        <br>
                        <h4 class="footertext">Location</h4>
                        <address>

                            Vanier College Hospital <br>
                            4259 Freedom Street, Floor 4 <br>
                            H1M 4L6 Montreal (Quebec)<br>
                            Canada
                        </address>

                    </div>
                </div>
                <div class="row">
                    <p><center><a href="#">Contact Stuff Here</a> <p class="footertext">Copyright, Said GUERRAB, 2014</p></center></p>
                </div>
            </div>
        </div>
    </body>
</html>
