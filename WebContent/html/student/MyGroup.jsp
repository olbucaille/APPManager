<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Media"%>
<%@page import="Model.User"%>
<%@page import="Model.Team"%>

<jsp:include page="/html/Layout.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="/APPManager/css/left_menu.css">
<link rel="stylesheet" type="text/css"
	href="/APPManager/css/css_student/style_student.css">

<div id="title">MY GROUP</div>


 <% 
 
 String idUser=(String)session.getValue("NUMBER"); 
 String idTeam = Team.GetIdTeamOfUser(idUser);
 Team team = Team.GetTeamWithId(idTeam); 
 if (team!=null){
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
	<form action="/APPManager/UploadDownloadFileServlet" method="POST"
		enctype="multipart/form-data">
		Select File to Upload:<input type="file" name="fileName"> <br>
		<input type="submit" value="Upload">
	</form>


	<%
List <Media> mediaList = Media.getMediaOfTeam(team.getIdTeam());
for(Media med :mediaList){
	%><li><a
		href="/APPManager/UploadDownloadFileServlet?fileName=<%=med.getName()%>">Download
			<%=med.getName()%></a></li>
	<% 
}
%>
<%	} //si l'utilisateur n'a pas de groupe%>
</div>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>
