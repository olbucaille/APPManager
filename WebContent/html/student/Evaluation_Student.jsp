<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Competencies"%>
<%@page import="Model.EvaluationForm"%>
<%@page import="Model.Evaluation"%>
<%@page import="Model.CrossEvaluation"%>
<%@page import="Model.AutoEvaluation"%>


<jsp:include page="/html/Layout.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="/APPManager/css/evaltype.css">
<link rel="stylesheet" type="text/css" href="/APPManager/css/left_menu.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>

<div id="title">EVALUATIONS</div>

<div class="leftmenubox">
		<ul class="leftmenu">
			<li id="leftmenubox_title"><a id="leftmenu_title" href="#">Evaluation Liste</a></li>
		

			<%
				List<Evaluation> evalList= Evaluation.GetEvaluation();
				String idUser = "4242";
			   	if (evalList !=null){
			   		System.out.println("probleme BDD");
			   		for (Evaluation eval : evalList) {
			   			if (eval.getType().equals("cross")){
			   				if (CrossEvaluation.crossEvaluationIsAlreadyDone(eval.getID_evaluation() ,idUser )){//pour v�rifier si l'�l�ve a deja fait l'evaluation
			   					%>
			   				
			<li id="leftmenubox_tab" ><a id="leftmenu_ref" href="#"><%=eval.getName() %> (DONE)</a></li>
			<% }else{%>
			<li  id="leftmenubox_tab" onclick="cross_evaluation(<%=eval.getID_evaluation()%>)"
				><a id="leftmenu_ref" href="#"><%=eval.getDate() +" - "+eval.getName()   %></a></li>
			<% 
			   				}
			   			}else if (eval.getType().equals("auto")){
			   				if (AutoEvaluation.autoEvaluationIsAlreadyDone(eval.getID_evaluation() ,idUser )){//pour v�rifier si l'�l�ve a deja fait l'evaluation
			   					%>
			<li id="leftmenubox_tab" ><a id="leftmenu_ref" href="#"><%=eval.getName() %> (DONE)</a></li>
			<% }else{%>

			<li id="leftmenubox_tab" onclick="auto_evaluation(<%=eval.getID_evaluation()%>)"><a id="leftmenu_ref" href="#"><%= eval.getDate() + " - "+eval.getName()  %></a></li>
			<% 
			   				}
			   			}
			   		}
			   	}	
			%>
			</ul>
		</div>

<div id="block-central">
	

	<div class="centerAndRight">
		<div id="cross_evaluation" style="display: none;">
			<jsp:include page="/html/student/Cross_Evaluation.jsp"></jsp:include>
		</div>
		<div id="auto_evaluation" style="display: none;">
			<jsp:include page="/html/student/Auto_Evaluation.jsp"></jsp:include>
		</div>

	</div>
</div>
<script src="/APPManager/js/Evaluation.js" type="text/javascript"></script>



<jsp:include page="/html/Layout_foot.jsp"></jsp:include>