<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Competencies"%>
<%@page import="Model.EvaluationForm"%>
<form id="form" name ="form_evaluation" method="post" action="/APPManager/SEvaluation">

	<%
		List<Competencies> compList= Competencies.GetAllCompetencies();
	   	EvaluationForm eval1 = new EvaluationForm(compList);	
	  	int count=0;
	   	for (String family : eval1.getFamilyListInEvaluation()) {	
	   		//afficher famille
	%>	<table>
   	   			<tbody>
   	   				<tr>
   	   					<td colspan = "2"><h2><%=family %></h2></td>
   	   					
   	   				</tr>
   	   <% 
   		for (Competencies comp_lvl1 : eval1.getCompetenciesInFamily(family)) {
   			
   			//afficher compétence
   			%>		<tr>
   						
						</br>
						
						<td><h3>  <%=comp_lvl1.getName() %></h3></td>
						<td>
						<style media="screen" type="text/css">
 
						#star1-<%=count%>:checked ~ label
						{
						  color: #FF0000;
						  text-shadow:1px 1px #FF0000, 2px 2px #FF0000, .1em .1em .2em rgba(0,0,0,.5);
						}
						

						#star2-<%=count%>:checked ~ label{
						  color: #FF8C00;
						  text-shadow:1px 1px #FF8C00, 2px 2px #FF8C00, .1em .1em .2em rgba(0,0,0,.5);
						}
						

						#star3-<%=count%>:checked ~ label{
						  color: #00FF00;
						  text-shadow:1px 1px #00FF00, 2px 2px #00FF00, .1em .1em .2em rgba(0,0,0,.5);
						}
						

						#star4-<%=count%>:checked ~ label{
						  color: #008000;
						  text-shadow:1px 1px #008000, 2px 2px #008000, .1em .1em .2em rgba(0,0,0,.5);
						}
						

						#star5-<%=count%>:checked ~ label{
						  color: #6495ED;
						  text-shadow:1px 1px #6495ED, 2px 2px #6495ED, .1em .1em .2em rgba(0,0,0,.5);
						}
						
						</style>
						<strong class="choice<%=count%>">Choose a rating</strong>
						<fieldset class="rating <%=count%>">
							<input type="radio" id="star5-<%=count%>" name="rating<%=count%>" value="Au-delà" /><label
								for="star5-<%=count%>" title="Rocks!"></label> <input type="radio"
								id="star4-<%=count%>" name="rating<%=count%>" value="Acquis" /><label for="star4-<%=count%>"
								title="Pretty good"></label> <input type="radio" id="star3-<%=count%>"
								name="rating<%=count%>" value="En cours" /><label for="star3-<%=count%>" title="Meh"></label>
							<input type="radio" id="star2-<%=count%>" name="rating<%=count%>" value="Bof bof" /><label
								for="star2-<%=count%>" title="Kinda bad"></label> <input type="radio"
								id="star1-<%=count%>" name="rating<%=count%>" value="Nul" /><label for="star1-<%=count%>"
								title="Sucks big time"></label>
						
						</fieldset>
						<script type="text/javascript">
						$('#star1-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)

						$('#star2-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)

						$('#star3-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)

						$('#star4-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)

						$('#star5-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)
						</script>
						</td>
   			</tr>
	   					<% 
	   					count++;
   			String idComp = comp_lvl1.getIdComp();

    		for (Competencies comp_lvl2 : eval1.getUnderCompetenciesInCompetence(idComp)) {	
    			//afficher les sous compétences
    			%>	<tr>
  
						
						<td><h5> -> <%=comp_lvl2.getName() %></h5></td>
						<td>
						<style media="screen" type="text/css">
 
						#star1-<%=count%>:checked ~ label
						{
						  color: #FF0000;
						  text-shadow:1px 1px #FF0000, 2px 2px #FF0000, .1em .1em .2em rgba(0,0,0,.5);
						}
						

						#star2-<%=count%>:checked ~ label{
						  color: #FF8C00;
						  text-shadow:1px 1px #FF8C00, 2px 2px #FF8C00, .1em .1em .2em rgba(0,0,0,.5);
						}
						

						#star3-<%=count%>:checked ~ label{
						  color: #00FF00;
						  text-shadow:1px 1px #00FF00, 2px 2px #00FF00, .1em .1em .2em rgba(0,0,0,.5);
						}
						

						#star4-<%=count%>:checked ~ label{
						  color: #008000;
						  text-shadow:1px 1px #008000, 2px 2px #008000, .1em .1em .2em rgba(0,0,0,.5);
						}
						

						#star5-<%=count%>:checked ~ label{
						  color: #6495ED;
						  text-shadow:1px 1px #6495ED, 2px 2px #6495ED, .1em .1em .2em rgba(0,0,0,.5);
						}
						
						</style>
						<strong class="choice<%=count%>">Choose a rating</strong>
						<fieldset class="rating <%=count%>">
							<input type="radio" id="star5-<%=count%>" name="rating<%=count%>" value="Au-delà" /><label
								for="star5-<%=count%>" title="Rocks!"></label> <input type="radio"
								id="star4-<%=count%>" name="rating<%=count%>" value="Acquis" /><label for="star4-<%=count%>"
								title="Pretty good"></label> <input type="radio" id="star3-<%=count%>"
								name="rating<%=count%>" value="En cours" /><label for="star3-<%=count%>" title="Meh"></label>
							<input type="radio" id="star2-<%=count%>" name="rating<%=count%>" value="Bof bof" /><label
								for="star2-<%=count%>" title="Kinda bad"></label> <input type="radio"
								id="star1-<%=count%>" name="rating<%=count%>" value="Nul" /><label for="star1-<%=count%>"
								title="Sucks big time"></label>
						</fieldset>
						<script type="text/javascript">
						$('#star1-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)

						$('#star2-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)

						$('#star3-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)

						$('#star4-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)

						$('#star5-<%=count%>').change(
								function(){
									$('.choice<%=count%>').text( this.value );
								} 
						)
						</script>
						</td>
						</tr>
 					<% 
 					count++;
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
