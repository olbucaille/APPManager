<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
   <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
<title>Settings</title>
</head>
<body>

<!-- Ajout d'app note, SControllerAPP non créé -->
<form action="/APPManager/SControllerAPP" method="POST" >


	<br />
    
	<label for="APPType">APP Type : </label>
    <input type="text" name="APPType">
	<br /><br /> 

	<label for="StartDate">Start Date : </label>
	<input type="text" name="StartDate" class="datepicker">
	<br /><br />
	
	<label for="EndDate">End Date : </label>
	 <input type="text" name="StartDate" class="datepicker">
	<br /><br />
	
    <input type="submit" name="action" value="addcompetencies" name="submit" />
   


</form> 

</body>
</html>