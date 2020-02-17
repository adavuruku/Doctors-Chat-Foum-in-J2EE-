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
       <%@include file="headerAdmin.jsp" %>
        <div class="row"style="margin-bottom:60px">
            
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background:white">
                 
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
                                            <strong style="color:brown">
                                                <a style="color:white;padding:6px;margin-left:10px" class="btn btn-danger btn-lg" 
                                                   href="./deletePost?postid=<%= newslist.getPostid()%>">
                                                   Delete Post &raquo; </a>
                                            </strong>
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
                                     </p>
                                     <hr/>
                                </div>
                                <%
                            }
                        }
                        %>
                        
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
