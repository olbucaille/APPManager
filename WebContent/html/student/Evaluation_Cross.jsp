<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Competencies"%>
<%@page import="Model.EvaluationForm"%>
<%@page import="Model.Evaluation"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
<jsp:include page="/html/Layout.jsp"></jsp:include>
<html>
<link rel="stylesheet" type="text/css" href="../../css/evaltype.css">
<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

<head>
</head>
	<body>	
		<div class="left">
			<h1>Evaluation Liste</h1>
			<div id="evaluation_list">
			
			<%
				List<Evaluation> evalList= Evaluation.GetEvaluation();
			    List<Competencies> compList= Competencies.GetCompetenciesWithoutMother();
			   	if (evalList !=null){
			   		System.out.println("probleme BDD");
			   		for (Evaluation eval : evalList) {
			   			if (eval.getType().equals("cross")){
			   				%>
			   				<li onclick="cross_evaluation()" style="display:block;"><%=eval.getDate() +" - "+eval.getName() +" - "+ Competencies.getACompetenciesName("titi") %></li>
			   				
			   				<% 
			   			}else if (eval.getType().equals("auto")){
			   				%>
			   				<li onclick="auto_evaluation()" style="display:block;"><%= eval.getDate() + " - "+eval.getName()  %></li>
			   				<% 
			   			}
			   		}
			   	}
			   
			   		
			%>	
			
			
   	   	
				
			</div>
			
						<div id="evaluation_list">
			
			<%
				List<Evaluation> evalList1= Evaluation.GetEvaluation();
			    List<Competencies> compList1= Competencies.GetCompetenciesWithoutMother();
			   	if (evalList !=null){
			   		System.out.println("probleme BDD");
			   		for (Evaluation eval : evalList) {
			   			if (eval.getType().equals("cross")){
			   				%>
			   				<li onclick="cross_evaluation()" style="display:block;"><%=eval.getDate() +" - "+eval.getName() +" - "+ Competencies.getACompetencies("esy") %></li>
			   				
			   				<% 
			   			}else if (eval.getType().equals("auto")){
			   				%>
			   				<li onclick="auto_evaluation()" style="display:block;"><%= eval.getDate() + " - "+eval.getName()  %></li>
			   				<% 
			   			}
			   		}
			   	}
			   
			   		
			%>	
			
			
   	   	
				
			</div>
			
						<div id="evaluation_list">
			
			<%
				List<Evaluation> evalList2= Evaluation.GetEvaluation();
			    List<Competencies> compList2= Competencies.GetCompetenciesWithoutMother();
			   	if (evalList !=null){
			   		System.out.println("probleme BDD");
			   		for (Evaluation eval : evalList) {
			   			if (eval.getType().equals("cross")){
			   				%>
			   				<li onclick="cross_evaluation()" style="display:block;"><%=eval.getDate() +" - "+eval.getName() +" - "+ Competencies.getACompetencies("test45") %></li>
			   				
			   				<% 
			   			}else if (eval.getType().equals("auto")){
			   				%>
			   				<li onclick="auto_evaluation()" style="display:block;"><%= eval.getDate() + " - "+eval.getName()  %></li>
			   				<% 
			   			}
			   		}
			   	}
			   
			   		
			%>	
			
			
   	   	
				
			</div>
			
			
		</div>  	
		
		
		
		<div class="centerAndRight">	
			<div id="cross_evaluation" style="display:none;">
				<jsp:include page="/html/student/Cross_Evaluation.jsp"></jsp:include>
			</div>
			<div id="auto_evaluation" style="display:none;">
				<jsp:include page="/html/student/Auto_Evaluation.jsp"></jsp:include>
			</div>
			
		</div>	
		<script src="../../js/Evaluation.js" type="text/javascript"></script>
		
	
	</body>
	
</html>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>