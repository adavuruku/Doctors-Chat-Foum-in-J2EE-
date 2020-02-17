<%-- 
    Document   : index
    Created on : Dec 20, 2018, 6:37:33 PM
    Author     : sherif146
--%>

<%@page import="java.util.List"%>
<%--<%@page import="java.util.List"%>
<%@page import="entity.Postrecord"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Doctors Forum Platform </title>
        <link rel="icon" href="res/medback.png" type="image/x-icon" />
        <link rel="shortcut icon" href="res/medback.png" type="image/x-icon" /> 


       <link rel="stylesheet" type="text/css" href="res/bootstrap-theme.css"/>
        <link href="res/boot.css" rel="stylesheet" type="text/css" media="screen"/>
         <link href="res/bootstrap.min.css" rel="stylesheet" media="screen"/>
    </head>
    <body style="background-image: url('res/medback.png');">
       <%@include file="header.jsp" %>
        <div class="row" style="margin-bottom:60px">
            <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7" style="background:white">
               <%@include file="projectInfo2.jsp" %>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5" style="background:beige">
                <form role="form"  name="reg_form"  id="form" class="form-vertical" action="./doclogin" method="POST">
                            <h4 style="margin-bottom:20px;background-color:#CCFF33;padding:10px">Please Login - Doctors</h4>
                    <hr/>
                            <div class="form-group">
                                    <label for="txtreg">Doctor ID : </label>
                                    <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                            <input type="text" class="form-control" id="txtreg" name="txtreg" value="<%= request.getAttribute("txtreg")%>" required="true" placeholder="Enter Your Staff ID"/>
                                    </div>
                            </div>
                            <div class="form-group">
                                    <label for="password">Enter Password: </label>
                                    <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span> 
                                            <input type="password" class="form-control" id="password"  name="password" required="true" placeholder="Enter Your Password"/>
                                    </div>
                            </div>
                            <div class="form-group">
                                    <div class="input-group">
                                            <input type="submit" name="proceed" style="margin-bottom:10px;padding:5px 20px 5px 20px" value="SUBMIT" class="btn btn-primary btn-md"></input>
                                    </div>
                            </div>
                           
                </form> 
            </div>
        </div>
        <!-- close of container fluid in header file -->
         <%@include file="footer.jsp" %>
    </div>
    </body>
</html>
