<%-- 
    Document   : index
    Created on : Dec 20, 2018, 6:37:33 PM
    Author     : sherif146
--%>

<%@page import="entity.myInfo"%>
<%@page import="entity.workArchieve"%>
<%@page import="entity.qualProf"%>
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
    </head>
    <body style="background-image: url('medback.png');">
       <%@include file="headerLogin.jsp" %>
        <div class="row"style="margin-bottom:60px">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="background:white">
               <%@include file="regNavLogin.jsp" %>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="background:white; padding:10px">
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
                    <%
                        int k = 1;
                        @SuppressWarnings("unchecked") 
                        List<myInfo> results = (List<myInfo>)request.getAttribute("myinfo");
                        //System.out.println("EWW");
                        if (results != null) {%>
                        <%for (myInfo result : results) { 
                            %>
                            <table style="font-size:22px; font-weigth:bold;" class="table table-bordered table-condensed table-responsive table-hover">
                            <thead >
                                <tr style="background-color: grey;color:yellow">
                                    <th style="background-color: grey;color:yellow" COLSPAN="2"><H3>Doctor Profile !!</H3></th>
                                </tr>
                            </thead>
                      
                            <tbody>
                                <tr>
                                    <td>Doctors Name </td>
                                    <td><%=result.getDocName().toUpperCase()%></td>
                                </tr>
                                 <tr>
                                    <td COLSPAN="2"></td>
                                </tr>
                                <tr>
                                    <td>Gender </td>
                                    <td><%=result.getDocGender()%></td>
                                </tr>
                                
                                <tr>
                                    <td COLSPAN="2"></td>
                                </tr>
                                <tr>
                                    <td>Phone No / Email Address </td>
                                    <td><%=result.getDocPhone()%> / <%=result.getDocEmail()%></td>
                                </tr>
                                <tr>
                                    <td COLSPAN="2"></td>
                                </tr>
                                <tr>
                                    <td>Country  </td>
                                    <td><%=result.getDocCountry()%></td>
                                </tr>
                                <tr>
                                    <td COLSPAN="2"></td>
                                </tr>
                                <tr>
                                    <td>State / Local Government </td>
                                    <td><%=result.getDocState()%> / <%=result.getDocLgov()%></td>
                                </tr>
                                <tr>
                                    <td COLSPAN="2"></td>
                                </tr>
                                <tr>
                                    <td>Contact Address  </td>
                                    <td><%=result.getDocContact()%></td>
                               </tr>
                                <tr>
                                    <td COLSPAN="2"></td>
                                </tr>
                                <tr>
                                    <td><a class="btn btn-danger" style="color:yellow;font-weight:bold; text-decoration: none; padding:10px;" href="./closeProfile">Private Profile</a></td>
                                    <td><a class="btn btn-primary" style="color:yellow;font-weight:bold; text-decoration: none; padding:10px;" href="./openProfile">Public Profile</a></td>
                                </tr>
                                <tr>
                                    <td COLSPAN="2"></td>
                                </tr>
                            </tbody>
                            </table>
                            
                       <%}}%>       
                 </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="background:white">
               <%@include file="profile.jsp" %>
            </div>
            
        </div>
        <!-- close of container fluid in header file -->
         <%@include file="footer.jsp" %>
    </div>
    </body>
   
</html>
