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
       <%@include file="header.jsp" %>
        <div class="row"style="margin-bottom:60px">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="background:white">
               <%@include file="s1.jsp" %>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="background:beige">
                <form role="form"  name="reg_form"  id="form" class="form-horizontal" action="./step1" method="POST">
                            <h4 style="margin-bottom:20px;background-color:#CCCCFF;padding:10px">Step (01/06) - Personal / Contact Information </h4>
                    <hr/>
                    
                    
                            <div class="form-group">
                                <label for="txtname" class="control-label col-xs-3">Full Name <span style="color:red">*</span>: </label>
                                <div class="col-xs-9">
                                        <input type="text" class="form-control" id="txtname" name="txtname" value="<%= request.getAttribute("txtname")%>" required="true" placeholder="First Name Middle Name Last Name"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtphone" class="control-label col-xs-3">Phone No. <span style="color:red">*</span>: </label>
                                <div class="col-xs-9">
                                        <input type="phone" class="form-control" id="txtphone" name="txtphone" value="<%= request.getAttribute("txtphone")%>" required="true" placeholder="Enter Phone No."/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtemail" class="control-label col-xs-3">Email Address. <span style="color:red">*</span>: </label>
                                <div class="col-xs-9">
                                        <input type="email" class="form-control" id="txtemail" name="txtemail" value="<%= request.getAttribute("txtemail")%>" required="true" placeholder="Enter Email Address."/>
                                </div>
                            </div>
                    
                            <div class="form-group">
                                <label for="gender" class="control-label col-xs-3">Select Gender <span style="color:red">*</span> : </label>
                                <div class="col-xs-9">
                                    <select class="form-control js-example-basic-single" id="gender" name="gender" value="<%= request.getAttribute("gender")%>">
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="country" class="control-label col-xs-3">Select Gender <span style="color:red">*</span> : </label>
                                <div class="col-xs-9">
                                    <select class="form-control js-example-basic-single" id="country" name="country" value="<%= request.getAttribute("country")%>">
                                        <option value="Nigeria">Nigeria</option>
                                    </select>
                                </div>
                            </div>
                    
                            <div class="form-group">
                                <label for="state" class="control-label col-xs-3">Select State <span style="color:red">*</span> : </label>
                                <div class="col-xs-9">
                                    <select class="form-control js-example-basic-single" id="state" name="state" value="<%= request.getAttribute("state")%>">
                                         <option value="Abuja">Abuja</option>
                                        <option value="Jos">Jos</option>
                                        <option value="Kano">Kano</option>
                                        <option value="Rivers">Rivers</option>
                                        <option value="Bauchi">Bauchi</option>
                                        <option value="Enugu">Enugu</option>
                                        <option value="Oyo">Oyo</option>
                                    </select>
                                </div>
                            </div>
                           
                            <div class="form-group">
                                <label for="lgov" class="control-label col-xs-3">Select Local Gov't <span style="color:red">*</span> : </label>
                                <div class="col-xs-9">
                                    <select class="form-control" value="<%= request.getAttribute("lgov")%>" id="lgov" name="lgov">
                                        <option value="Abuja">Abuja</option>
                                        <option value="Jos">Jos</option>
                                        <option value="Kano">Kano</option>
                                        <option value="Rivers">Rivers</option>
                                        <option value="Bauchi">Bauchi</option>
                                        <option value="Enugu">Enugu</option>
                                        <option value="Oyo">Oyo</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                 <label for="contact" class="control-label col-xs-3">Contact Address <span style="color:red">*</span> : </label>
                                 <div class="col-xs-9">
                                     <textarea class="form-control" rows="5" 
                                               id="contact" name="contact" 
                                               placeholder="Enter Your Contact Address"><%= 
                                                   request.getAttribute("contact")
                                               %></textarea>
                                 </div>
                             </div>
                                     
                    
                            <div class="form-group">
                                    <label for="txtPassword" class="control-label col-xs-3">Enter Password: </label>
                                    <div class="col-xs-9">
                                            <input type="password" class="form-control" id="txtPassword"  name="txtPassword" required="true" placeholder="Enter Your Password"/>
                                    </div>
                                    <span class="help-block" id="result4" style="color:brown;text-weight:bold;text-align:center;"></span>
                            </div>
                            <div class="form-group">
                                    <label for="txtPasswordC" class="control-label col-xs-3">Re-Enter Password: </label>
                                    <div class="col-xs-9">
                                            <input type="password" class="form-control" id="txtPasswordC"  name="txtPasswordC" required="true" placeholder="Re-Enter Your Password"/>
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
            <a href="step1.jsp"></a>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="background:white">
               <%@include file="s1.jsp" %>
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
