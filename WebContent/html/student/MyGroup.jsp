<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Media"%>
<%@page import="Model.User"%>
<%@page import="Model.Team"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
 <jsp:include page="/html/Layout.jsp"></jsp:include>  
<html lang="en">
<head>
<!-- Force latest IE rendering engine or ChromeFrame if installed -->
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->
<meta charset="utf-8">
<title>jQuery File Upload Demo - AngularJS version</title>
<meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for AngularJS. Supports cross-domain, chunked and resumable file uploads and client-side image resizing. Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


</head>
<body>
<% 


System.out.println("app :"+ session.getValue("NUMBER"));
session.getValue("NUMBER"); %>

   	<div class="leftmenubox">
	<ul class="leftmenu">
    <%  List <User> userList;	
    Team team = new Team("1",null ,null );
		%>
		<li id="leftmenubox_title"><a id="leftmenu_title" href="#"><%=team.getName() %></a></li>
			<% 
			userList=null;
			// récuperer la team en fonction de l'utilisateur
			
			userList= Team.GetTeamUsers(team);
			if (userList.isEmpty()){
				System.out.println("user empty");
			}else{
				 for (User user : userList) {	
				 if (user.getType()=="Student")%>
				 	<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#"><%=user.getNom()%>  <%=user.getPrenom()%></a></li>
					
				<%}	
			}
			
			if (userList.isEmpty()){
				System.out.println("user empty");
			}else{
				%>
				<li id="leftmenubox_title"><a id="leftmenu_title" href="#">Tutors</a></li>
				 <%for (User user : userList) {	
				 if (user.getType()=="Tutor")%>
				 	<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#"><%=user.getNom()%>  <%=user.getPrenom()%></a></li>
				<%}	
			}%>
			</ul>
		</div>



<form action="/APPManager/UploadDownloadFileServlet" method="POST" enctype="multipart/form-data">
Select File to Upload:<input type="file" name="fileName">
<br>
<input type="submit" value="Upload">
</form>


<%
List <Media> mediaList = Media.getMediaOfTeam(team.getIdTeam());
for(Media med :mediaList){
	%><li ><a href="/APPManager/UploadDownloadFileServlet?fileName=<%=med.getName()%>">Download <%=med.getName()%></a></li><% 
}

%>
</body>
</html>
