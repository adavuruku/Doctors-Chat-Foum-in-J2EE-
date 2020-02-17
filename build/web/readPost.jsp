<%-- 
    Document   : index
    Created on : Dec 20, 2018, 6:37:33 PM
    Author     : sherif146
--%>

<%@page import="entity.commentInfo"%>
<%@page import="entity.postInfo"%>
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
    </head>
    <body style="background-image: url('medback.png');">
       <%@include file="headerLogin.jsp" %>
        <div class="row"style="margin-bottom:60px">
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="background:white; position:relative">
               <%@include file="regNavLogin.jsp" %>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" style="background:white">
                
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
                <div class="col-xs-12 " style="padding:5px">
                <h4 style="margin-bottom:20px;background-color:#CCCCFF;padding:10px">READ / VIEW POST / TREND </h4>
                    <h4 style="margin-bottom:20px;COLOR:YELLOW;background-color:GREY;padding:10px">YOUR PLATFORM ID -  <%= request.getAttribute("USERID")%> </h4>
                <hr/>
                 <%
                        
                        
                        @SuppressWarnings("unchecked") 
                        List<postInfo> newslists = (List<postInfo>)request.getAttribute("completePost");
                        if (newslists != null) {
                            for (postInfo newslist : newslists) { %>
                                <div class="col-xs-12">
                                    <h3 style="color:black" ><strong style="color:red">Title :</strong> <strong ><%= newslist.getTitle()%></strong></h3>
                                    <h5 style="color:blue"><strong><span style="color:green">Posted By : </span><%= newslist.getDocname()%></strong></h5>
                                    <h5><strong><span style="color:green">Date Posted : </span><%= newslist.getDatePost()%></strong></h5>
                                   
                                </div>
                                <div class="col-xs-12">
                                        <p style="font-size:20px;"><%= newslist.getContent()%></p>
                                       
                                        <p style="font-size:20px;">
                                            <strong class="btn btn-info btn-lg" ><%= newslist.getNoComment()%> Comments</strong>
                                            <%if(newslist.getDocProfile().equals("0")){%>
                                                <strong style="color:brown">
                                                <a style="color:white;padding:6px;margin-left:10px" class="btn btn-primary btn-lg" 
                                                   href="./viewDocProfile?docid=<%= newslist.getDocid()%>">
                                                    View <%= newslist.getDocname()%> Profile</a>
                                                </strong>
                                                <%}%>
                                        </p>
                                         <hr/>
                                </div>
                                <%
                            }
                        }


                        //all comments
                        @SuppressWarnings("unchecked") 
                        List<commentInfo> newslistsCom = (List<commentInfo>)request.getAttribute("allComment");
                        if (newslistsCom != null) {
                            for (commentInfo newslist : newslistsCom) { %>
                                <div class="col-xs-12">
                                    <h5 style="color:blue"><strong><span style="color:green">Comment By : </span><%= newslist.getDocName()%></strong> @ <%= newslist.getDateComment()%> </h5>
                                    <p style="font-size:20px;"><%= newslist.getContent()%>
                                         <%if(newslist.getDocProfile().equals("0")){%>
                                             <strong style="color:brown">
                                             <a style="color:white;padding:6px;margin-left:10px" class="btn btn-success btn-lg" 
                                                href="./viewDocProfile?docid=<%= newslist.getDocid()%>">
                                                 View <%= newslist.getDocName()%> Profile</a>
                                             </strong>
                                             <%}%>
                                     </p>
                                     <hr/>
                                </div>
                                <%
                            }
                        }
                        %>
                        
                        <div class="col-xs-12">
                            <form role="form"  name="reg_form"  id="form" class="form-vertical" action="./readPost" method="POST">
                                <input type="hidden"  id="txtuserid" name="userid" value="<%= request.getAttribute("USERID")%>" />
                                <input type="hidden"  id="postid" name="postid" value="<%= request.getAttribute("POSTID")%>" />

                                <div class="form-group">
                                    <label for="title">Post Your Comment : </label>
                                    <div class="input-group col-xs-12">
                                        <textarea rows="15"  class="form-control" id="body" name="body" required="true" placeholder="Enter The Post Contenets"><%= 
                                            request.getAttribute("body")
                                        %></textarea> 
                                    </div>
                                </div>
                                    <div class="form-group" >
                                        <label for="error" 
                                               class="control-label col-xs-9" ></label>
                                        <div class="col-xs-3">
                                                <input type="submit" name="proceed" style="margin-bottom:10px;padding:5px 20px 5px 20px" value="SUBMIT" class="btn btn-primary btn-lg"></input>
                                    </div>
                                </div>
                            </form>                  
                        </div>
                </div>
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
