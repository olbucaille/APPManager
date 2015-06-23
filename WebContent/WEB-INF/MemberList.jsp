<%@page import="java.util.List"%>
<%@page import="Model.APP"%>
<%@page import="Model.Team"%>
<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="/html/Layout.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/APPManager/css/left_menu.css">

<div id="title">MODULE'S MEMBERS</div>

<div id="block-central">
<ul class="leftmenu">
	<%
		List<Team> listTeam = Team.GetAllTeam();	

	for (Team team : listTeam){
	%>
		 <li id="leftmenubox_title"><a id="leftmenu_title" href="#"><%=team.getName() %></a></li>
		 
		 <% 
		for(User user : Team.GetTeamUsers(team)){
			%>
		<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#"><%=user.getPrenom()%>   <%=user.getNomFamille()%></a></li>
		
		<% 
		}
		
	}
		
		
	%>

	<%-- 
<nav class="mm">    
		    <div class="mm-item">
		      <h4><a href="#">Module Manager</a></h4>
		      <ul>
		        <li><a href="#">Manager</a></li>
		      </ul>
		    </div>
		    </nav>
		    

<nav class="tt">    
		    <div class="tt-item">
		      <h4><a href="#">Tutors</a></h4>
		      <ul>
		        <li><a href="#">Tutor</a></li>
		        <li><a href="#">Tutor</a></li>
		      </ul>
		    </div>
		    </nav>


<nav class="gp">    
		    <div class="menu-item">
		      <h4><a href="#">Group_1</a></h4>
		      <ul>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		      </ul>
		    </div>
		      
		    <div class="menu-item">
		      <h4><a href="#">Group_2</a></h4>
		      <ul>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		      </ul>
		    </div>
		      
		    <div class="menu-item">
		      <h4><a href="#">Group_3</a></h4>
		      <ul>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		      </ul>
		    </div>
		    <div class="menu-item">
		      <h4><a href="#">Group_4</a></h4>
		      <ul>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		      </ul>
		    </div>
		    <div class="menu-item">
		      <h4><a href="#">Group_5</a></h4>
		      <ul>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		        <li><a href="#">Member</a></li>
		      </ul>
		    </div>
		</nav>
--%>


</div>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>