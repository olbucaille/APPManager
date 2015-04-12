<%@page import="java.util.List"%>
<%@page import="Model.Competencies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Competencies Managment</title>
</head>
<body>


<%
List<Competencies> listWM = (List) request.getAttribute("compToDisplay");
List<Competencies> list = (List) request.getAttribute("compToListChoice");


 %>

<ol>
<%if(list!=null)
	{
		int i = 0;
		for( i=0; i<list.size();i++)	
		{
			out.println("<li><span>"+list.get(i).getName()+"</span></li>");
			out.println("<ol>");
			if(listWM!=null)
			{
				for( int j=0; j<listWM.size();j++)	
				{		
					if(listWM.get(j).getIdMother().trim().equals(String.valueOf(list.get(i).getIdComp())))
					{
						out.println("<li>"+listWM.get(j).getName()+"</li>");						
					}
				}
			}
			out.println("</ol>");
		}

	}
	else 
	out.print("problem");%>
</ol>

<form action="/APPManager/SControllerCompetencies" method="POST" >


	<label for="motherCompetence">Under the competence</label>
    <select name="motherCompetence" size="1">
    	<option selected>none
 <%
   
			
	if(list!=null)
	{
		int i = 0;
		for( i=0; i<list.size();i++)	
			out.println("<option value=\""+list.get(i).getIdComp()+"\">"+list.get(i).getName());		    
	}%>
   
   
    </select>
    
    
    
    
    <br /> <br />
    
	<label for="Name">Name</label>
    <input type="text" name="Name">
	<br /> <br />

	<label for="IsNeeded">Is needed to validate any module</label>
	<input type="checkbox" name="IsNeeded" value="yes"/> yes <br><br/>

   <input type="submit" name="action" value="addcompetencies" name="submit" />
   


</form> 
</body>
</html>