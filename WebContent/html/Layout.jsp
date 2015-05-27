<%@page import="Model.StringProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>APP Manager</title>
		<link rel="stylesheet" type="text/css" href="/APPManager/css/layout.css" />
	</head>
	
	<body>
		<div class="wrapper">
  			<div class="sidebar">
    			<div class="title">APP Manager</div>
    			<ul class="nav">
    			<%
    			
    				System.out.println(session.getAttribute(StringProvider.getIsAdmin()));
    			if(String.valueOf(session.getAttribute(StringProvider.getIsAdmin())).equals("true"))
    			{
    			%>
      				<li><a href="#"><i class="fa fa-home fa-lg"></i>You are an Admin</a></li>
      				<li><a href="#" class="active"><i class="fa fa-users fa-lg"></i>My Groups</a></li>
      				<li><a href="#"><i class="fa fa-star fa-lg"></i>Evaluations</a></li>
     				<li><a href="#"><i class="fa fa-list fa-lg"></i>Modules' Members</a></li>
     				<li><a href="#"><i class="fa fa-cog fa-lg"></i>Settings</a>
      				<li><a href="#"><i class="fa fa-user fa-lg"></i>Profile</a></li>
      				<li><a href="#"><i class="fa fa-question fa-lg"></i>Help</a></li>
      				<li><a href="../../index.jsp"><i class="fa fa-power-off fa-lg"></i>Logout</a></li>
      			<%
    			}else if(String.valueOf(session.getAttribute(StringProvider.getIsModulemanager())).equals("true"))
    			{
      			%>
      				<li><a href="#"><i class="fa fa-home fa-lg"></i>You are MM</a></li>
      				<li><a href="#" class="active"><i class="fa fa-users fa-lg"></i>My Group</a></li>
      				<li><a href="#"><i class="fa fa-star fa-lg"></i>Evaluations</a></li>
     				<li><a href="#"><i class="fa fa-list fa-lg"></i>Modules' Members</a></li>
     				<li><a href="#"><i class="fa fa-cog fa-lg"></i>Settings</a>
      				<li><a href="#"><i class="fa fa-user fa-lg"></i>Profile</a></li>
      				<li><a href="#"><i class="fa fa-question fa-lg"></i>Help</a></li>
      				<li><a href="../../index.jsp"><i class="fa fa-power-off fa-lg"></i>Logout</a></li>
      			<%
      			}else if(String.valueOf(session.getAttribute(StringProvider.getIsTutor())).equals("true"))
      			{
      			%>
      				<li><a href="#"><i class="fa fa-home fa-lg"></i>You are a Tutor</a></li>
      				<li><a href="/APPManager/html/teacher/MyGroups_teacher.jsp" class="active"><i class="fa fa-users fa-lg"></i>My Groups</a></li>
      				<li><a href="#"><i class="fa fa-star fa-lg"></i>Evaluations</a></li>
     				<li><a href="#"><i class="fa fa-list fa-lg"></i>Modules' Members</a></li>
     				<li><a href="#"><i class="fa fa-cog fa-lg"></i>Settings</a>
      				<li><a href="/APPManager/html/teacher/Profile_teacher.jsp"><i class="fa fa-user fa-lg"></i>Profile</a></li>
      				<li><a href="#"><i class="fa fa-question fa-lg"></i>Help</a></li>
      				<li><a href="../../index.jsp"><i class="fa fa-power-off fa-lg"></i>Logout</a></li>
      			<%
      			}else if(String.valueOf(session.getAttribute(StringProvider.getIsStudent())).equals("true"))
      			{
      			%>
      				<li><a href="#"><i class="fa fa-home fa-lg"></i>You are a Student</a></li>
      				<li><a href="#" class="active"><i class="fa fa-users fa-lg"></i>My Groups</a></li>
      				<li><a href="#"><i class="fa fa-star fa-lg"></i>Evaluations</a></li>
     				<li><a href="#"><i class="fa fa-list fa-lg"></i>Modules' Members</a></li>
      				<li><a href="#"><i class="fa fa-user fa-lg"></i>Profile</a></li>
      				<li><a href="#"><i class="fa fa-question fa-lg"></i>Help</a></li>
      				<li><a href="../../index.jsp"><i class="fa fa-power-off fa-lg"></i>Logout</a></li>
      			<%
      			}else
      			{
      			%>
      				<li><a>Logout</a></li>
      			<%
      			}
      			%>
    				</ul>
  			</div>
  			<div class="content isOpen">
    			<a class="button"></a>
    			
 