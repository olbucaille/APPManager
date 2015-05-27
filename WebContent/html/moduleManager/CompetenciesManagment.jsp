<%@page import="java.util.List"%>
<%@page import="Model.Competencies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:include page="/html/Layout.jsp"></jsp:include>


<%
List<Competencies> listWM = (List) request.getAttribute("compToDisplay");
List<Competencies> list = (List) request.getAttribute("compToListChoice");
String message = (String)  request.getAttribute("message"); 
if (message ==null )
	message = "";
%>
 
 
 <h1>Skills Managment</h1>
 
 
 <p>
<%=message %>
</p>

<ol>
<%if(list!=null)
	{
		int i = 0;
		for( i=0; i<list.size();i++)	
		{
			out.println("<li class=\"liste\"><span>"+list.get(i).getName()+"</span> <a href=\"/APPManager/SControllerCompetencies?action=deleteCompetencie&value="+list.get(i).getIdComp()+"\"><img src=\"/APPManager/images/RedCross.svg\" width=\"10\" height=\"10\"></img></a></li> ");
			out.println("<ol class=\"liste\">");
			if(listWM!=null)
			{
				for( int j=0; j<listWM.size();j++)	
				{		
					if(listWM.get(j).getIdMother().trim().equals(String.valueOf(list.get(i).getIdComp())))
					{
						out.println("<li class=\"liste\" style=\"margin-left:30px;\">"+listWM.get(j).getName()+" <a href=\"/APPManager/SControllerCompetencies?action=deleteCompetencie&value="+listWM.get(j).getIdComp()+"\"><img src=\"/APPManager/images/RedCross.svg\" width=\"10\" height=\"10\"></img></a></li> ");						
					}
				}
			}
			out.println("</ol>");
		}

	}
	else 
	out.print("problem");%>
</ol>

<br/>
<form action="/APPManager/SControllerCompetencies" method="POST" >


<label for="Category">Under the category</label>    
    <select name="Category" size="1">
    	<option selected> Team Work
		<option >Communication
		<option >Project managment
		<option >Design/Implementation
		<option >Profesionnal skills 		  
    </select> <br /><br />
    
    

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
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>