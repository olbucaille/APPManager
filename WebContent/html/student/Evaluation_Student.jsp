<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
<html>
<link rel="stylesheet" type="text/css" href="../../css/css_student/style_student.css">
<link rel="stylesheet" type="text/css" href="../../css/css_student/style_evaluation.css">
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/JavaScript">$(document).ready(function(){ 
$.get("Auto_Evaluation.jsp",function(data){ //初始將a.html include div#iframe
$("#iframe").html(data);
}); 
$(function(){
$('.list-side li').click(function() {
		// 找出 li 中的超連結 href(#id)
	var $this = $(this),
	_clickTab = $this.find('a').attr('target'); // 找到連結a中的targer標籤值
	$.get(_clickTab,function(data){
	$("#iframe").html(data);	
	});
})
})
});</script>
<head>
</head>
	<body>	
		<div class="left">
			<h1>Evaluation Liste</h1>
			<div id="evaluation_list">
				<ul class="list-side">
					<li><a target="Auto_Evaluation.jsp" >about</a></li>
					<li><a target="Auto_Evaluation.jsp" >news</a></li>
					<li><a target="Cross_Evaluation.jsp" >product</a></li>
				</ul>
			
			</div>
		</div>  			
       					
		<div id="iframe">
			<!--jquery 插入html 位址-->
		</div>
			
		<script src="../../js/Evaluation.js" type="text/javascript"></script>
	</body>
	
</html>