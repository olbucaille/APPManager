<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Evaluation"%>
<%@page import="Model.User"%>
<%@page import="Model.Team"%>
<!DOCTYPE html>
<html>
 <jsp:include page="/html/Layout.jsp"></jsp:include>  
<head>
<meta charset="UTF-8">
<title>Evaluation</title>
<link rel="stylesheet" type="text/css" href="../../css/css_teacher/evaluation_teacher.css">
</head>
<body>



<nav class="STD">
     <h1>My teams</h1>    
     <%
     
		List<Team> teamList= Team.GetAllTeam();
     List <User> userList;
	   	if (teamList !=null){
	 		
	   		for (Team team : teamList) {		
   				%>
   				<div class="STD-item">
   				<h4><a href="#">Team : <%=team.getName()  %></a></h4>
	   				<ul>
	   				<% 
	   				userList=null;
	   				userList= Team.GetTeamUsers(team);
	   				if (userList.isEmpty()){
	   					System.out.println("user empty");
	   				}else{

		   				 for (User user : userList) {	%>
		   					<li><a href="#"><%=user.getNom()%>  <%=user.getPrenom()%> </a></li>
		   					<%}	
	   				}%>
	   				</ul>
   				</div>
   				<% 
	   		}
	   	}	
	%>	   
    </nav>







  <form action="index.html" class="contact">
    <h1>Evaluation of 05/12/2015</h1>
    <fieldset class="contact-inner">
      <p class="contact-input">
        <input type="text" name="comment" placeholder="Comment" autofocus>
      </p>

      <p class="contact-input">
        <label for="select" class="select">
          <select name="subject" id="select">
            <option value="" selected>Choose Type…</option>
            <option value="1">cross</option>
            <option value="1">auto</option>
          </select>
        </label>
      </p>

      <p class="contact-input">
        <textarea rows="10" cols="50" name="freecomment" placeholder="Free Comments"></textarea>
      </p>

      <p class="contact-submit">
        <input type="submit" value="Submit">
      </p>
    </fieldset>
  </form>






<nav class="EV"> 
     <h1>List of Evaluations</h1>   
		    <div class="EV-item">
		    <%
				List<Evaluation> evalList= Evaluation.GetEvaluation();
			   	if (evalList !=null){
			   		System.out.println("probleme BDD");
			   		for (Evaluation eval : evalList) {
			   			if (eval.getType().equals("cross")){
			   				%>
			   				<h4><a href="#">Cross Evaluation : <%=eval.getDate() +" - "+eval.getName()   %></a></h4>
			   				
			   				<% 
			   			}else if (eval.getType().equals("auto")){
			   				%>
			   				<h4><a href="#">auto Evaluation : <%=eval.getDate() +" - "+eval.getName()   %></a></h4>
			   				
			   				<% 
			   			}
			   		}
			   	}	
			%>	
		    </div>
	</nav>


</body>
</html>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>