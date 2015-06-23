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
	</ul>
</div>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>