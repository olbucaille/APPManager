<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Competencies"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
<html>
<link rel="stylesheet" type="text/css" href="../../css/css_student/style_student.css">
<link rel="stylesheet" type="text/css" href="../../css/css_student/style_evaluation.css">
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script src="../../js/evaluation.js" type="text/javascript"></script>
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
			  
				<% List<Competencies> strList = new ArrayList<Competencies>();
//Competencies(String idComp, String name, String desc,Boolean isnecessary, String Category, String idMother)
		    	Competencies comp1 = new Competencies("comp1", "java", "toto",true, "programmation", "toto");
		    	strList.add(comp1);
		    	Competencies comp2 = new Competencies("comp2", "html", "toto",true, "programmation", "toto");
		    	strList.add(comp2);
		    	Competencies comp3 = new Competencies("comp3", "javascript", "toto",true, "programmation", "toto");
		    	strList.add(comp3);
		    	Competencies comp4 = new Competencies("comp4", "css", "toto",true, "programmation", "toto");
		    	strList.add(comp4);
		    	Competencies comp5 = new Competencies("comp5", "json", "toto",true, "programmation", "toto");
		    	strList.add(comp5);
		    		
		    	Competencies comp10 = new Competencies("comp10", "aider les autres", "toto",true, "travailler en equipe", "toto");
		    	strList.add(comp10);
		    	Competencies comp11 = new Competencies("comp11", "communiquer", "toto",true, "travailler en equipe", "toto");
		    	strList.add(comp11);
		    	Competencies comp12 = new Competencies("comp12", "ecouter", "toto",true, "travailler en equipe", "toto");
		    	strList.add(comp12);
		    	Competencies comp13 = new Competencies("comp13", "se faire écouter", "toto",true, "travailler en equipe", "toto");
		    	strList.add(comp13);
		    	
		    	Competencies comp20 = new Competencies("comp20", "retard", "toto",true, "assiduite", "toto");
		    	strList.add(comp20);
		    	Competencies comp21 = new Competencies("comp21", "abscence", "toto",true, "assiduite", "toto");
		    	strList.add(comp21);
		    	Competencies comp22 = new Competencies("comp22", "toto", "toto",true, "assiduite", "toto");
		    	strList.add(comp22);
		    	
		    	%>
		    	<table>
		    	   <tbody> <!-- Corps du tableau -->
		    	   <%    

		    	String cat= "";
		    	for (Competencies competence : strList) {
		    	
		    	    if (cat.equals("")==true){//first category
		    	    	System.out.println("first");
		    	    	cat=competence.getCategory();	
		    	    	%> 
		    	    	<tr><td colspan=2><h3> <%= cat%></h3></td> </tr><% 
 
		    	    }else if(competence.getCategory().equals(cat)==false){// if it's a new category
		    	    	%><td colspan=2><label for ="comment"> Write a comment </label>
						<br/><TEXTAREA rows="3" name="comment"></TEXTAREA>	</td><% 
		    	    	System.out.println("new");
		    	    	cat=competence.getCategory();	
		    	    			
		    	    	%><tr><td colspan=2> <h3> <%= cat%></h3> </td></tr> <% 
 
		    	   }
		    	    
		    	    System.out.println(competence.getName());
		        	%><tr>
			    	    	<td> <h5> <%= competence.getName()%></h5></td> <% 	
        			
        			%><td><div class="slider">
        			<div class="progress-bar" id="progress-bar"></div></td>
  			    	</tr>
  			    	
  			    	<% 
		    	}
		    	%><td colspan=2>
		    	<label for ="comment"> Write a comment </label>
				<TEXTAREA rows="2" name="comment"></TEXTAREA>	</td>
				</tr>
			    
			    </tbody>
		    	</table>	
			    	
			    	
				<form id="form1" name="form1" method="post" action enctype="text/plain" alt="">
				<p>
				<input type="button" id="createID" value="Create Form" onclick="writeform(strList)" />				
				<br />				
				</p>				
				</form>				
				<hr>
				
				<!-- Just below is the key code in the body for positioning the form-->
				
				<p id="paraID">
				
				&nbsp;
				
				</p>
				
				</div>
		
			</div>
		
		</div>
	</body>
</html>
