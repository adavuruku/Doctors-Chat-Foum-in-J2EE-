<%-- 
    Document   : index
    Created on : Dec 20, 2018, 6:37:33 PM
    Author     : sherif146
--%>

<%@page import="entity.workArchieve"%>
<%@page import="entity.qualProf"%>
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
       <%@include file="headerLogin.jsp" %>
        <div class="row"style="margin-bottom:60px">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="background:white">
               <%@include file="regNavLogin.jsp" %>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="background:beige">
                  <div class="col-xs-12 " style="padding:5px">
                    <h4 style="margin-bottom:20px;margin-top:10px;background-color:grey;color:yellow;padding:10px">SEARCH FOR A DOCTOR AND RELATED POST </h4> 
                    <form role="form" name="mailform" class="form-horizontal" action="./search" method="POST">
                        <div class="form-group">
                            <label for="txtsearch" class="control-label col-xs-3">Enter Description</label>
                            <div class="col-xs-7">
                                <input type="text" class="form-control" id="txtsearch" name="txtsearch" placeholder="Enter Your Search Criteria Either By Doctors Name Or Doctors Post">
                            </div>
                            <div class=" col-lg-2">
                                <button type="submit" name="submitsearch" class="btn btn-success">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12">
                    <form role="form"  name="reg_form"  id="form" class="form-vertical" action="./createPost" method="POST">
                        <h4 style="margin-bottom:20px;background-color:#CCCCFF;padding:10px">CREATE A NEW POST / TREND </h4>
                        <h4 style="margin-bottom:20px;COLOR:YELLOW;background-color:GREY;padding:10px">YOUR PLATFORM ID -  <%= request.getAttribute("USERID")%> </h4>
                        <hr/>

                        <input type="hidden"  id="txtuserid" name="userid" value="<%= request.getAttribute("USERID")%>" />    

                        <div class="form-group">
                            <label for="title">Post Title : </label>
                            <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-edit"></span></span>
                                    <input type="text" class="form-control" id="title" name="title" value="<%= request.getAttribute("title")%>" required="true" placeholder="Enter The Post Title"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title">Post Body : </label>
                            <div class="input-group col-xs-12">
                                <textarea rows="15"  class="form-control" id="body" name="body" required="true" placeholder="Enter The Post Contenets"><%= 
                                    request.getAttribute("body")
                                %></textarea> 
                            </div>
                        </div>


                        <div class="form-group" >
                            <label for="error" style="margin-bottom:20px;background-color:grey;padding:10px;color:yellow" 
                                   class="control-label col-xs-9" ><%= request.getAttribute("error")%></label>
                            <div class="col-xs-3">
                                    <input type="submit" name="proceed" style="margin-bottom:10px;padding:5px 20px 5px 20px" value="SUBMIT" class="btn btn-primary btn-lg"></input>
                            </div>
                        </div>
                    </form>
                 </div>
                
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="background:white">
               <%@include file="post.jsp" %>
            </div>
            
        </div>
        <!-- close of container fluid in header file -->
         <%@include file="footer.jsp" %>
    </div>
    </body>
    <script type="text/javascript">
            $(document).ready(function() {
                    $('.js-example-basic-single').select2();
            });
    </script>
</html>
