<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Competencies Managment</title>
</head>
<body>

<form action="noname" method="POST" >


	<label for="motherCompetence">Under the competence</label>
    <select name="motherCompetence" size="1">
    	<option selected>none
 
    </select>
    
    <br /> <br />
    
	<label for="Name">Name</label>
    <input type="text" name="Name">
	<br /> <br />

	<label for="IsNeeded">Is needed to validate any module</label>
	<input type="checkbox" name="IsNeeded" value="yes"/> yes <br><br/>

   <input type="submit" name="submit" />

</form> 
</body>
</html>