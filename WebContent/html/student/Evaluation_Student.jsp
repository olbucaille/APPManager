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
<link rel="stylesheet" type="text/css" href="../../css/css_student/evaltype.css">
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<head>
</head>
	<body>	
		<div class="left">
			<h1>Evaluation Liste</h1>
			<div id="evaluation_list">
				<ul class="list-side">
					<li onclick="cross_evaluation()">cross evaluation</li>
					<li onclick="auto_evaluation()">auto evaluation</li>
					<li onclick="evaluation()">evaluation</li>

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
			<div id="evaluation" style="display:none;">
				<jsp:include page="/html/student/Evaluation.jsp"></jsp:include>
			</div>
		</div>	
		<script src="../../js/Evaluation.js" type="text/javascript"></script>
	</body>
	
</html>