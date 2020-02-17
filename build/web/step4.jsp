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
<link rel="stylesheet" type="text/css" href="res/select2.css"/>
       <link rel="stylesheet" type="text/css" href="res/bootstrap-datepicker.css"/>
       <link rel="stylesheet" type="text/css" href="res/bootstrap-datepicker3.min.css"/>
       <script type="text/javascript" src="res/jquery-3.2.1.js"></script>
       <script type="text/javascript" src="res/select2.js"></script>
       <script type="text/javascript" src="res/select2.min.js"></script>
       <script type="text/javascript" src="res/bootstrap-datepicker.js"></script>

       <link rel="stylesheet" type="text/css" href="res/bootstrap-theme.css"/>
       <link rel="stylesheet" type="text/css" href="res/bootstrap-theme.min.css"/>
        <link  rel="stylesheet" type="text/css" href="res/boot.css" media="screen"/>
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
                    <form role="form"  name="reg_form"  id="form" class="form-horizontal" action="./step4" method="POST">
                                <h4 style="margin-bottom:20px;background-color:#CCCCFF;padding:10px">Step (04/04) - ACHIEVEMENTS / AWARDS </h4>
                                <h4 style="margin-bottom:20px;COLOR:YELLOW;background-color:GREY;padding:10px">YOUR PLATFORM ID -  <%= request.getAttribute("USERID")%> </h4>
                        <hr/>

                                <input type="hidden"  id="txtuserid" name="userid" value="<%= request.getAttribute("USERID")%>" />    
                                
                                <div class="form-group">
                                    <label for="schoolname" class="control-label col-xs-3"> Award Name <span style="color:red">*</span>: </label> 
                                    <div class="col-xs-9">
                                            <input type="text" class="form-control" id="certname" name="compname" value="<%= request.getAttribute("compname")%>" required="true" placeholder="Enter Name Of Company"/>
                                    </div>
                                </div>
                                <div class="form-group"> 
                                 <label for="contact" class="control-label col-xs-3">Detail Information <span style="color:red">*</span> : </label>
                                 <div class="col-xs-9">
                                     <textarea class="form-control" rows="5" id="duty" name="duty" placeholder="Enter Your Position / Duty In The Job">
                                         <%= request.getAttribute("duty")%></textarea>
                                 </div>
                             </div>
                                
                                 <div class="form-group" style="margin-top:25px">
                                    <label for="year" class="control-label col-xs-3">Award Date : <span style="color:red">*</span> : </label>
                                    <div class="col-xs-9">
                                        <div class="input-group date" data-provide="datepicker">

                                                <input type="text" class="form-control"  id="year" name="year"  required="true" />
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <label for="error" class="control-label col-xs-9"></label>
                                    <div class="col-xs-3">
                                            <input type="submit" name="proceed" style="margin-bottom:10px;padding:5px 20px 5px 20px" value="SUBMIT" class="btn btn-primary btn-lg"></input>
                                    </div>
                                </div>
                               

                    </form>
                 </div>
                
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="background:white">
               <%@include file="s4.jsp" %>
            </div>
            <div class="col-xs-12" style="background-color: whitesmoke">
                    <%
                        int k = 1;
                        @SuppressWarnings("unchecked") 
                        List<workArchieve> results = (List<workArchieve>)request.getAttribute("allreadyAchieve");
   
                        if (results != null) {%>
                            <table style="font-size:22px; font-weigth:bold;" class="table table-bordered table-condensed table-responsive table-hover">
                            <thead >
                                <tr style="background-color: grey;color:yellow">
                                    <th>SNo.</th>
                                    <th>Title</th>
                                    <th>Details</th>
                                    <th>Date</th>
                                    <th></th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                             <%for (workArchieve result : results) { 
                             %>
                                <tr>
                                    <td COLSPAN="6"></td>
                                </tr>
                                <tr>
                                    <td><%=k%></td>
                                    <td><%=result.getTitle()%></td>
                                    <td><%=result.getDuty()%></td>
                                    <td><%=result.getDateStart()%></td>
                                    <td><a class="btn btn-primary" style="color:yellow;font-weight:bold;  text-decoration: none; padding:10px;" href="./removeAward?bfid=<%=result.getId()%>">Delete</a></td>
                                  
                                </tr>
                              <%k++;}%>  
                            </tbody>
                        </table>
                                
                       <%}%>   
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
