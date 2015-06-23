<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Competencies"%>
<%@page import="Model.EvaluationForm"%>
<%@page import="Model.Evaluation"%>


<jsp:include page="/html/Layout.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../../css/evaltype.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

<div id="title">EVALUATIONS</div>

<div id="block-central">

	<div class="left">
		<h1>Evaluation Liste</h1>
		<div id="evaluation_list">

			<%
				List<Evaluation> evalList= Evaluation.GetEvaluation();
			   	if (evalList !=null){
			   		System.out.println("probleme BDD");
			   		for (Evaluation eval : evalList) {
			   			if (eval.getType().equals("cross")){
			   				%>
			<li onclick="cross_evaluation()" style="display: block;"><%=eval.getDate() +" - "+eval.getName()   %></li>
			<% 
			   			}else if (eval.getType().equals("auto")){
			   				%>
			<li onclick="auto_evaluation()" style="display: block;"><%= eval.getDate() + " - "+eval.getName()  %></li>
			<% 
			   			}
			   		}
			   	}	
			%>
			<% 
				
				%>
		</div>
	</div>
	<div class="centerAndRight">
		<div id="cross_evaluation" style="display: none;">
			<jsp:include page="/html/student/Cross_Evaluation.jsp"></jsp:include>
		</div>
		<div id="auto_evaluation" style="display: none;">
			<jsp:include page="/html/student/Auto_Evaluation.jsp"></jsp:include>
		</div>

	</div>



</div>
<script src="../../js/Evaluation.js" type="text/javascript"></script>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>