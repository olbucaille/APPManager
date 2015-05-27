<%@page import="java.util.List"%>
<%@page import="Model.APP"%>
<%@page import="Model.Team"%>
<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:include page="/html/Layout.jsp"></jsp:include>

<%
List<Team> listTeam = (List) request.getAttribute("ListOfAllTeam");
List<User> listUser = (List) request.getAttribute("ListOfAllUser");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MemberList</title>
</head>
<body>
<h1 class= "header">APP Manager</h1>

<form method="post" action="/APPManager/MemberListMain"></form>
		<%
	   
				
		if(listUser!=null)
		{
			int i = 0;
			for( i=0; i<listUser.size();i++)	
				out.println("<option value=\""+listUser.get(i).getNumber()+"\">"+listUser.get(i).getNomFamille()+" "+listUser.get(i).getPrenom()+" "+listUser.get(i).getNumber()+" "+listUser.get(i).getType() );		    
		}
		
		if(listTeam!=null)
		{
			int i = 0;
			for( i=0; i<listTeam.size();i++)	
				out.println("<option value=\""+listTeam.get(i).getIdTeam()+"\">"+listTeam.get(i).getName());		    
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


</body>
</html>