<%@page import="java.util.List"%>
<%@page import="Model.APP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:include page="/html/Layout.html"></jsp:include>

<%
List<APP> list = (List) request.getAttribute("ListOfAllAPP");

%>
<div style="width:395px; float:right; margin-right: 1px;margin-top: 5px;">
<form action="/APPManager/SControllerAPP" method="POST" >


	<br />
    
	<label for="APPType">APP Type : </label>
    <input type="text" name="APPType">
	<br /><br /> 

	<label for="StartDate">Start Date : </label>
	<input type="text" name="StartDate" class="datepicker">
	<br /><br />
	
	<label for="EndDate">End Date : </label>
	 <input type="text" name="EndDate" class="datepicker">
	<br /><br />
	
    <input type="submit" name="action" value="add APP session" name="submit" />
   


</form> 
</div>
<br />
<p>-----------------------------------------------------------------</p>


<div style="width:395px; float:right; margin-right: 1px;margin-top: 5px;">
<form action="/APPManager/SControllerTeam" method="POST" >


	<br />
    
	<label for="TeamName">Team Name : </label>
    <input type="text" name="TeamName">
	<br /><br /> 

	
	<select name="APPOfTheTeam" size="1">
	    	<option selected>none
	 <%
	   
				
		if(list!=null)
		{
			int i = 0;
			for( i=0; i<list.size();i++)	
				out.println("<option value=\""+list.get(i).getIdAPP()+"\">"+list.get(i).getName());		    
		}%>
	   
	   
	    </select>

	<br /><br />
	
    <input type="submit" name="action" value="add Team session" name="submit" />
   


</form> 
</div>



<!-- rajouter une colonne liste des eleves
	--------------------------------profs
	----------------------------des app courants
	on selectionne les eleves, profs, l'app et cela les ajoute dans la table user-app
	avant tout ça lorsque l'on se connecte on doit verifier si il existe dans la base locale et sinon l'ajouter -->
	<br/><br />
<SELECT NAME="toppings" MULTIPLE SIZE=5>
<OPTION VALUE="mushrooms">mushrooms
<OPTION VALUE="greenpeppers">green peppers
<OPTION VALUE="onions">onions
<OPTION VALUE="tomatoes">tomatoes
<OPTION VALUE="olives">olives
</SELECT>

<jsp:include page="/html/Layout-foot.html"></jsp:include>