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
<link rel="stylesheet" type="text/css"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/APPManager/css/layout.css" />
</head>

<body>
	<%
		System.out
				.println(session.getAttribute(StringProvider.getIsAdmin()));
		if (String.valueOf(
				session.getAttribute(StringProvider.getIsAdmin())).equals(
				"true")) {
	%>

	<div id="menu-rond">
		<div id="mask-menu">
			<i class="fa fa-home fa-3x"></i>
		</div>
		<div id="buttn-1" class="buttn">
			<i class="fa fa-home fa-2x"></i>
		</div>
		<div id="buttn-2" class="buttn">
			<i class="fa fa-users fa-2x"></i>
		</div>
		<div id="buttn-3" class="buttn">
			<i class="fa fa-star fa-2x"></i>
		</div>
		<div id="buttn-4" class="buttn"><a href="http://localhost:8081/APPManager/MemberListMain">
			<i class="fa fa-list fa-2x"></i></a>
		</div>
		<div id="buttn-5" class="buttn active"><a href="\Admin\Settings.jsp">
			<i class="fa fa-cog fa-2x"></i></a>
		</div>
		<div id="buttn-6" class="buttn">
			<i class="fa fa-user fa-2x"></i>
		</div>
		<div id="buttn-7" class="buttn">
			<i class="fa fa-question fa-2x"></i>
		</div>
		<div id="buttn-8" class="buttn"><a href="http://localhost:8081/APPManager/">
			<i class="fa fa-power-off fa-2x"></i></a>
		</div>
	</div>

	<div id="menu-text">
		<div id="text-buttn-1" class="text-buttn">ADMIN</div>
		<div id="text-buttn-2" class="text-buttn">MY GROUPS</div>
		<div id="text-buttn-3" class="text-buttn">EVALUATIONS</div>
		<div id="text-buttn-4" class="text-buttn">MODULE'S MEMBERS</div>
		<div id="text-buttn-5" class="text-buttn">SETTINGS</div>
		<div id="text-buttn-6" class="text-buttn">PROFILE</div>
		<div id="text-buttn-7" class="text-buttn">HELP</div>
		<div id="text-buttn-8" class="text-buttn">LOGOUT</div>
	</div>

	<%
		} else if (String.valueOf(
				session.getAttribute(StringProvider.getIsModulemanager()))
				.equals("true")) {
	%>

	<div id="menu-rond">
		<div id="mask-menu">
			<i class="fa fa-home fa-3x"></i>
		</div>
		<div id="buttn-1" class="buttn">
			<i class="fa fa-home fa-2x"></i>
		</div>
		<div id="buttn-2" class="buttn">
			<i class="fa fa-users fa-2x"></i>
		</div>
		<div id="buttn-3" class="buttn">
			<i class="fa fa-star fa-2x"></i>
		</div>
		<div id="buttn-4" class="buttn"><a href="http://localhost:8081/APPManager/MemberListMain">
			<i class="fa fa-list fa-2x"></i></a>
		</div>
		<div id="buttn-5" class="buttn active"><a href="http://localhost:8081/APPManager/SControllerCompetencies?action=CompetenciesManagmentPage">
			<i class="fa fa-cog fa-2x"></i></a>
		</div>
		<div id="buttn-6" class="buttn">
			<i class="fa fa-user fa-2x"></i>
		</div>
		<div id="buttn-7" class="buttn">
			<i class="fa fa-question fa-2x"></i>
		</div>
		<div id="buttn-8" class="buttn"><a href="http://localhost:8081/APPManager/">
			<i class="fa fa-power-off fa-2x"></i></a>
		</div>
	</div>

	<div id="menu-text">
		<div id="text-buttn-1" class="text-buttn">MANAGER</div>
		<div id="text-buttn-2" class="text-buttn">MY GROUPS</div>
		<div id="text-buttn-3" class="text-buttn">EVALUATIONS</div>
		<div id="text-buttn-4" class="text-buttn">MODULE'S MEMBERS</div>
		<div id="text-buttn-5" class="text-buttn">SETTINGS</div>
		<div id="text-buttn-6" class="text-buttn">PROFILE</div>
		<div id="text-buttn-7" class="text-buttn">HELP</div>
		<div id="text-buttn-8" class="text-buttn">LOGOUT</div>
	</div>

	<%
		} else if (String.valueOf(
				session.getAttribute(StringProvider.getIsTutor())).equals(
				"true")) {
	%>

	<div id="menu-rond">
		<div id="mask-menu">
			<i class="fa fa-home fa-3x"></i>
		</div>
		<div id="buttn-1" class="buttn">
			<i class="fa fa-home fa-2x"></i>
		</div>
		<div id="buttn-2" class="buttn active"><a href="/APPManager/SControllerTutorAttendance">
			<i class="fa fa-users fa-2x"></i></a>
		</div>
		<div id="buttn-3" class="buttn"><a href="/APPManager/SControllerTutorEvaluation">
			<i class="fa fa-star fa-2x"></i></a>
		</div>
		<div id="buttn-4" class="buttn"><a href="http://localhost:8081/APPManager/MemberListMain">
			<i class="fa fa-list fa-2x"></i></a>
		</div>
		<div id="buttn-5" class="buttn">
			<i class="fa fa-cog fa-2x"></i>
		</div>
		<div id="buttn-6" class="buttn"><a href="/APPManager/SControllerTutorProfile">
			<i class="fa fa-user fa-2x"></i></a>
		</div>
		<div id="buttn-7" class="buttn">
			<i class="fa fa-question fa-2x"></i>
		</div>
		<div id="buttn-8" class="buttn"><a href="http://localhost:8081/APPManager/">
			<i class="fa fa-power-off fa-2x"></i></a>
		</div>
	</div>

	<div id="menu-text">
		<div id="text-buttn-1" class="text-buttn">TUTOR</div>
		<div id="text-buttn-2" class="text-buttn">MY GROUPS</div>
		<div id="text-buttn-3" class="text-buttn">EVALUATIONS</div>
		<div id="text-buttn-4" class="text-buttn">MODULE'S MEMBERS</div>
		<div id="text-buttn-5" class="text-buttn">SETTINGS</div>
		<div id="text-buttn-6" class="text-buttn">PROFILE</div>
		<div id="text-buttn-7" class="text-buttn">HELP</div>
		<div id="text-buttn-8" class="text-buttn">LOGOUT</div>
	</div>

	<%
		} else if (String.valueOf(
				session.getAttribute(StringProvider.getIsStudent()))
				.equals("true")) {
	%>

	<div id="menu-rond">
		<div id="mask-menu">
			<i class="fa fa-home fa-3x"></i>
		</div>
		<div id="buttn-1" class="buttn">
			<i class="fa fa-home fa-2x"></i>
		</div>
		<div id="buttn-2" class="buttn"><a href="/APPManager/html/student/MyGroup.jsp">
			<i class="fa fa-users fa-2x"></i></a>
		</div>
		<div id="buttn-3" class="buttn"><a href="/APPManager/html/student/Evaluation_Student.jsp">
			<i class="fa fa-star fa-2x"></i></a>
		</div>
		<div id="buttn-4" class="buttn"><a href="http://localhost:8081/APPManager/MemberListMain">
			<i class="fa fa-list fa-2x"></i></a>
		</div>
		<div id="buttn-6" class="buttn active"><a href="/APPManager/html/student/Profile.jsp">
			<i class="fa fa-user fa-2x"></i></a>
		</div>
		<div id="buttn-7" class="buttn">
			<i class="fa fa-question fa-2x"></i>
		</div>
		<div id="buttn-8" class="buttn"><a href="http://localhost:8081/APPManager/">
			<i class="fa fa-power-off fa-2x"></i></a>
		</div>
	</div>

	<div id="menu-text">
		<div id="text-buttn-1" class="text-buttn">STUDENT</div>
		<div id="text-buttn-2" class="text-buttn">MY GROUP</div>
		<div id="text-buttn-3" class="text-buttn">EVALUATIONS</div>
		<div id="text-buttn-4" class="text-buttn">MODULE'S MEMBERS</div>
		<div id="text-buttn-6" class="text-buttn">PROFILE</div>
		<div id="text-buttn-7" class="text-buttn">HELP</div>
		<div id="text-buttn-8" class="text-buttn">LOGOUT</div>
	</div>

	<%
		} else {
	%>

	<div id="menu-rond">
		<div id="mask-menu">
			<i class="fa fa-home fa-3x"></i>
		</div>
		<div id="buttn-8" class="buttn"><a href="http://localhost:8081/APPManager/">
			<i class="fa fa-power-off fa-2x"></i></a>
		</div>
	</div>

	<div id="menu-text">
		<div id="text-buttn-8" class="text-buttn">LOGOUT</div>
	</div>
	
	<%
		}
	%>