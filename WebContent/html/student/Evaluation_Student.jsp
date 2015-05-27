<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Competencies"%>
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
				<ul class="list-side">
					<li onclick="cross_evaluation()" style="display:block;">cross evaluation</li>
					<li onclick="auto_evaluation()" style="display:block;">auto evaluation</li>
					

				</ul>
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