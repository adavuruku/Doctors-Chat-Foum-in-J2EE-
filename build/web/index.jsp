<%-- 
    Document   : index
    Created on : Dec 20, 2018, 6:37:33 PM
    Author     : sherif146
--%>

<%@page import="java.util.List"%>
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
        <div class="row">
            <div class="col-xs-12" style="background:white">
                    <%@include file="serverInfo.jsp" %>
            </div>
            <div class="col-xs-12 col-sm-12" style="background:white;margin-bottom:20px">
                 <%@include file="projectInfo.jsp" %>
            </div>
        </div>
        <!-- close of container fluid in header file -->
         <%@include file="footer.jsp" %>
    </div>
    </body>
</html>
