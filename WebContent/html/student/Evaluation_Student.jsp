<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Competencies"%>
<%@page import="Model.Evaluation"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
<html>
<link rel="stylesheet" type="text/css" href="../../css/css_student/style_student.css">
<link rel="stylesheet" type="text/css" href="../../css/css_student/style_evaluation.css">
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>

<head>
</head>
	<body>	
		<div>
			<div class="left">
				<h1>Evaluation Liste</h1>
				<div id="evaluation_list">
				<h3>Evaluation Liste2</h3>
				<h3>Evaluation Liste2</h3>
				<h3>Evaluation Liste2</h3>
				<h3>Evaluation Liste2</h3>
				
				</div>
			</div>
			<div class="centerAndRight">
				<div id="evaluation_student">
				
				<input type="radio"  value="five" id="five" class="radio" name="progress">
			    <label for="five" class="label">non acquis</label>
			
			    <input type="radio" class="radio" name="progress" value="twentyfive" id="twentyfive" checked>
			    <label for="twentyfive" class="label">intermédiare</label>
			
			    <input type="radio" class="radio" name="progress" value="fifty" id="fifty">
			    <label for="fifty" class="label">acquis</label>
			
			    <input type="radio" class="radio" name="progress" value="seventyfive" id="seventyfive">
			    <label for="seventyfive" class="label">75%</label>
			
			    <input type="radio" class="radio" name="progress" value="onehundred" id="onehundred">
			    <label for="onehundred" class="label">100%</label>
			
			    <div class="progress">
			      <div class="progress-bar"></div>
			    </div>
			  <input class= "fill"  data-idx='2' type="range" min="0" max="5" value="1" step="1"  />
        			
        			
       			<form id="form" name ="form_evaluation" method="post" action="/APPManager/SEvaluation">

				<% 
		    	List<Competencies> compList= Competencies.GetAllCompetencies();

		    	Evaluation eval1 = new Evaluation(compList);
		    	
	    	
		    	for (String family : eval1.getFamilyListInEvaluation()) {	
		    		//afficher famille
		    		%>	<table>
		    	   			<tbody>
		    	   				<tr>
		    	   					<td><h2><%=family %></h2></td>
		    	   					<td><input class= "range" type="range" min="0" max="5" value="1" step="1" /></td>
		    	   				</tr>
		    	   <% 
		    		for (Competencies comp_lvl1 : eval1.getCompetenciesInFamily(family)) {
		    			
		    			//afficher compétence
		    			%>		<tr>
		    	   					<td><h3><%=comp_lvl1.getName() %></h3></td>
		    	   					<td><input name = "<%=comp_lvl1.getIdComp()%>" class= "range" type="range" min="0" max="5" value="1" step="1" /></td>
		    	   				</tr>
   	   					<% 
		    			String idComp = comp_lvl1.getIdComp();

			    		for (Competencies comp_lvl2 : eval1.getUnderCompetenciesInCompetence(idComp)) {	
			    			//afficher les sous compétences
			    			%>	<tr>
		    	   					<td><h5><%=comp_lvl2.getName() %></h5></td>
		    	   					<td><input name = "<%=comp_lvl2.getIdComp()%>" class= "range" type="range" min="0" max="5"
		    	   					 value="1" step="1"   oninput="setMark(this.name,this.value)" onchange="setMark(this.name,this.value)"/></td>
		    	   				</tr>
		  					<% 
			    		}
		    		}	
		    	   //un commentaire par famille
		    	   %>	<tr>
		  					<td colspan=2>
					    	<label for ="comment"> Write a comment </label>
							<TEXTAREA rows="2" name="comment"></TEXTAREA>	</td>
		  				</tr>
		  			</tbody>
		    	</table>	
				<% 
		    	}
		    	%>	
				<br><input type="submit"  />		
				<input type="hidden" name="evaluationId" value="${eval1}" />
				<% 		    	
		    	String evaluationId = "evaluationId";
    			request.getSession().setAttribute(evaluationId, eval1);
    			request.setAttribute("evaluationId", evaluationId);
    			request.getRequestDispatcher("/WebContent/html/student/Evaluation-Student.jsp").forward(request, response);%>	
				</form>				
	
		
				</div>
		
			</div>
		
		</div>
		<script src="../../js/Evaluation.js" type="text/javascript"></script>
	</body>
	
</html>