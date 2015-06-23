<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@page import="Model.Team"%>

<jsp:include page="/html/Layout.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="/APPManager/css/left_menu.css">
<link rel="stylesheet" type="text/css"
	href="/APPManager/css/css_student/style_student.css">
<script src="/APPManager/js/d3.v3.min.js"></script>
<script src="/APPManager/js/RadarChart.js"></script>

<div id="title">PROFILE</div>

 <% 
 
 String idUser=(String)session.getValue("NUMBER"); 
 String idTeam = Team.GetIdTeamOfUser(idUser);
 Team team = Team.GetTeamWithId(idTeam);
 List <User> userList=Team.GetTeamUsers(team);

 %> 

<div class="leftmenubox">
	<ul class="leftmenu">
		<li id="leftmenubox_title"><a id="leftmenu_title" href="#"><%=team.getName() %></a></li>
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
			
			if (userList.isEmpty()){
				System.out.println("user empty");
			}else{
				%>
		<li id="leftmenubox_title"><a id="leftmenu_title" href="#">Tutors</a></li>
		<%for (User user : userList) {
				 if (user.getType().equalsIgnoreCase("Tutor")){%>
		<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#"><%=user.getNom()%>
				<%=user.getPrenom()%></a></li>
			<%	}
			}
		}%>
	</ul>
</div>


<div id="block-central">
	<div class="centerAndRight">
		<div class="center">
			<div id="body">
				<div id="chart">
					<script>
			  //Legend titles
			  	
			  	//Data
			  	
			  	var LegendOptions = ['larour','bucaille','buso'];			  	
			  	var category = ['teamWork','Communication','aefefef','dfefefefezf','ezfef'];
			  	<%
			  	List<String> catList= new ArrayList<String>();
			  	List<String> groupList= new ArrayList<String>();
			  	
			  	
			  	catList.add("TeamWork");
			  	catList.add("Communication");
			  	catList.add("Project Management");
			  	catList.add("Design");
			  	catList.add("Profesionnal skills");
			  	
			  	groupList.add("larour");
			  	groupList.add("bucaille");
			  	groupList.add("buso");
			  	
			  	float l= 0;
			  	%>
				var d = [
				         <% for(String group : groupList){%>
						  [ 
						   <% for(String cat : catList){
							   l=l+(float)0.1;
						   %>
							{axis:"<%=cat%>",value:<%=l%>},
							<% }%>
						  ],
						  <% }%>
						];
					</script>

					<script type="text/javascript" src="/APPManager/js/RadarScript.js"></script>
				</div>
			</div>
		</div>
		<div class="right">
			<div id="notification">
				<h1>Notification</h1>
				<h3>Name : tata</h3>
				<h3>lastname : toto</h3>
				<h3>email : toto@gmail.com</h3>
			</div>
			<br>
			<div id="profile">
				<h1>Profile</h1>
				<h3>Name : tata</h3>
				<h3>lastname : toto</h3>
				<h3>email : toto@gmail.com</h3>

			</div>
		</div>
	</div>

	<div></div>

</div>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>