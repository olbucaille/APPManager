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
    			if((boolean)session.getAttribute(StringProvider.getIsAdmin()))
    			{
    			%>
      				<li><a>Home</a></li>
      				<li><a class="active">My Groups</a></li>
      				<li><a>Evaluations</a></li>
     				<li><a>Modules' Members</a></li>
      				<li><a>Profile</a></li>
      				<li><a>Help</a></li>
      				<li><a>Logout</a></li>
      			<%
    			}else if((boolean)session.getAttribute(StringProvider.getIsModulemanager()))
    			{
      			%>
      				<li><a>Home</a></li>
      				<li><a class="active">My Group</a></li>
      				<li><a>Evaluations</a></li>
     				<li><a>Modules' Members</a></li>
      				<li><a>Profile</a></li>
      				<li><a>Help</a></li>
      				<li><a>Logout</a></li>
      			<%
      			}else if((boolean)session.getAttribute(StringProvider.getIsTutor()))
      			{
      			%>
      				<li><a>Home</a></li>
      				<li><a class="active">My Groups</a></li>
      				<li><a>Evaluations</a></li>
     				<li><a>Modules' Members</a></li>
     				<li><a>Settings</a>
      				<li><a>Profile</a></li>
      				<li><a>Help</a></li>
      				<li><a>Logout</a></li>
      			<%
      			}else if((boolean)session.getAttribute(StringProvider.getIsStudent()))
      			{
      			%>
      				<li><a>Home</a></li>
      				<li><a class="active">My Groups</a></li>
      				<li><a>Evaluations</a></li>
     				<li><a>Modules' Members</a></li>
     				<li><a>Settings</a>
      				<li><a>Profile</a></li>
      				<li><a>Help</a></li>
      				<li><a>Logout</a></li>
      			<%
      			}
      			%>
    				</ul>
  			</div>
  			<div class="content isOpen">
    			<a class="button"></a>
    			
  		