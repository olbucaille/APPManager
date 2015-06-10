<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
 <jsp:include page="/html/Layout.jsp"></jsp:include>   
<html>
<link rel="stylesheet" type="text/css" href="../../css/left_menu.css">
<link rel="stylesheet" type="text/css" href="../../css/css_student/style_student.css">
    <script src="../../js/d3.v3.min.js"></script>
	<script src="../../js/RadarChart.js"></script>
<head>
</head>
	<body >	
	<div class="content_body">
	
	<div class="leftmenubox">
	<ul class="leftmenu">
		<li id="leftmenubox_title"><a id="leftmenu_title" href="#">Team
				Red Fire</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#">Thibault
				Larour</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#">Olivier
				Bucaille</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#">Arnaud
				Buso</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#">Raphael
				Luo</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref" href="#">Justin
				Kwan</a></li>
				</ul>
		</div>
				
	<div class="centerAndRight">
		<div class="center">
			<div id="body">
			  	<div id="chart">
			  	<script >
			  //Legend titles
			  	

			  	//Data
			  	
			  	var LegendOptions = ['larour','bucaille','buso'];			  	
			  	var category = ['teamWork','aefefef','aefefef','dfefefefezf','ezfef'];
			  	<%
			  	List<String> catList= new ArrayList<String>();
			  	List<String> groupList= new ArrayList<String>();
			  	
			  	
			  	catList.add("teamWork");
			  	catList.add("aefefef");
			  	catList.add("aefefef");
			  	catList.add("dfefefefezf");
			  	catList.add("ezfef");
			  	
			  	groupList.add("larour");
			  	groupList.add("bucaille");
			  	groupList.add("buso");
			  	
			  	float l= 0;
			  	%>
				var d = [
				         <% for(String group : groupList){%>
						  [ 
						   <% for(String cat : catList){
							   l=l+(float)0.1;
						   %>
							{axis:"<%=cat%>",value:<%=l%>},
							<% }%>
						  ],
						  <% }%>
						];
					</script>
 
			    	<script type="text/javascript" src="../../js/RadarScript.js"></script>
			    </div>
		    </div>
		</div>
		<div class="right">
		<div id="notification">
			    	<h1>Notification</h1>
			    	<h3>Name : tata </h3>
			    	<h3>lastname : toto</h3>
			    	<h3>email : toto@gmail.com </h3>
			    </div>
			    <br>
			    <div id="profile">
			    	<h1>Profile </h1>
			    	<h3>Name : tata </h3>
			    	<h3>lastname : toto</h3>
			    	<h3>email : toto@gmail.com </h3>
			    	
			    </div>
		</div>
	</div>
				
	<div>
	</div>
	</div>
	</body>
</html>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>