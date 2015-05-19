<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Competencies"%>
<%@page import="Model.Evaluation"%>
<html>
<body>
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
   			
   			//afficher comp�tence
   			%>		<tr>
   	   					<td><h3><%=comp_lvl1.getName() %></h3></td>
   	   					<td><input name = "<%=comp_lvl1.getIdComp()%>" class= "range" type="range" min="0" max="5" value="1" step="1" /></td>
   	   				</tr>
	   					<% 
   			String idComp = comp_lvl1.getIdComp();

    		for (Competencies comp_lvl2 : eval1.getUnderCompetenciesInCompetence(idComp)) {	
    			//afficher les sous comp�tences
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
 			//request.getSession().setAttribute(evaluationId, eval1);
 			//request.setAttribute("evaluationId", evaluationId);
 			//request.getRequestDispatcher("/WebContent/html/student/Evaluation-Student.jsp").forward(request, response);%>	
	</form>	
	</body>
	</html>