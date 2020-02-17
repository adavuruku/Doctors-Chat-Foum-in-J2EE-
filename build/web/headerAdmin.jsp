<%-- any content can be specified here e.g.: --%>
<%@ page pageEncoding="UTF-8" %>
 <%
    HttpSession ses = request.getSession(false);
%>
<nav id="myNavbar" class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><%= ses.getAttribute("docName")%></a>
		</div>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="nav navbar-nav">
				<li><a href="./adminViewAllPost" target="_self">View All Posts</a></li>
                                 <li><a href="./logout" target="_self" style="color:red">Log Out</a></li>
                       </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li style="font-family:due;font-weight:bold" class="active"><a href="#"><% out.print(java.util.Calendar.getInstance().getTime());%></a></li>
                        </ul>
		</div>
	</div>
</nav>
                       
                        
<div class="container-fluid">
    <div style="font-family:due;color:brown;padding-bottom:5px;padding-top:5px;background-color:beige" class="jumbotron">
            <h1 style="font-family:due;color:brown;padding:20px;padding-bottom:5px">Doctor's Forum System </h1>
            <p style="font-family:due;color:blue;padding-left:20px">Welcome - <%= ses.getAttribute("docName")%> - To Doctors Platform Administartive Home!!! </p>
    </div>

