<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@page import="Model.Team"%>
<%@page import="Model.Attendance"%>
<jsp:include page="/html/Layout.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/APPManager/css/left_menu.css">
<link rel="stylesheet" type="text/css"
	href="/APPManager/css/css_teacher/groups_teacher.css">

<div id="title">MY GROUPS</div>



 <% 
 int count = 0;
 String idTutor=(String)session.getValue("NUMBER"); 
 //l'utilisateur est un tuteur
 List <String> idTeamList = Team.GetIdTeamsOfTutor(idTutor);
 if (idTeamList!=null){
	 %> 
		
		<div class="leftmenubox">
			<ul class="leftmenu">
				<%
	 //pour chaque équipe du tuteur
	 for (String idTeam : idTeamList){
		 Team team = Team.GetTeamWithId(idTeam); 
		 if (team!=null){
		 List <User> userList=Team.GetTeamUsers(team);
		count++;
		%>
		<li id="leftmenubox_title"><a href="javascript:access<%=count%>()" id="leftmenu_title" ><%=team.getName() %></a></li>
		<% 
				userList=null;
				// récuperer la team en fonction de l'utilisateur
				userList= Team.GetTeamUsers(team);
				if (userList.isEmpty()){
					System.out.println("user empty");
				}else{
					 for (User user : userList) {	
					 if (user.getType().equalsIgnoreCase("Student")){%>
			<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#"><%=user.getNom()%>
					<%=user.getPrenom()%></a></li>
					
			<%			}
					}
				}
				
		}
	}
%></ul>
</div><%
}//fin if teamList%>



 <% 
int nbSession = Attendance.getTotalSession(idTutor);
 System.out.println(""+nbSession);
 count = 0;
 //l'utilisateur est un tuteur
 if (idTeamList!=null){
	 %> 
		
<div id="block-central">
<button id="addSession" value = <%=idTutor %>>Add New Session</button>
	<div id="block-general">
		 
				<%
	 //pour chaque équipe du tuteur
	 for (String idTeam : idTeamList){
		 Team team = Team.GetTeamWithId(idTeam); 
		 if (team!=null){
			 List <User> userList=Team.GetTeamUsers(team);
			 count++;
			 %>
			 <div id="block-access<%=count%>" style="display: block">
			 <h1 class="team_title"><%=team.getName() %></h1>
				<table class="table">
					<tbody id=Atd-tbody style="display: block">
						<tr>
						<th>Nom</th>
			<% for(int i = 1;i<nbSession;i++){%>				
						<th>Session<%=i%></th>	
			<% }%>				
						</tr>		
			<% 
			userList=null;
			// récuperer la team en fonction de l'utilisateur
			userList= Team.GetTeamUsers(team);
			if (userList.isEmpty()){
				System.out.println("user empty");
			}else{
				 for (User user : userList) {	
				 	if (user.getType().equalsIgnoreCase("Student")){%>
				<tr>
					<td><%=user.getNom()%>
				<%=user.getPrenom()%></td>
					
					<% for(int i = 1;i<nbSession;i++){%>				
						<td><input type="checkbox"  value="list.get(i).getIdComp()" checked></td>	
					<% }%>	
						
				</tr>
		<%			}
				}
			}//fin else	
			%></table>
			</div>
			<%
		}//fin if
	}
%>
		</div>
		</div><%
}//fin if teamList%>



<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript"
	src="/APPManager/js/multi-table_groups.js"></script>
<script>
		// On reprend le même id que dans le précédent chapitre

		$("#addSession").click(function() {

			$.ajax({
				url : "SControllerAttendance",
				type : "GET",
				data : {
					action : "addSession",
					idTutor : this.value,
					//  app: ,
					
				},

				success : function(code_html, statut) {
				},

				error : function(resultat, statut, erreur) {

				},

				complete : function(resultat, statut) {

				}

			});

		});
	</script>
	
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>