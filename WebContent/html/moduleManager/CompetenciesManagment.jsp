<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
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

List<String> listCategory = new ArrayList<String>();
listCategory.add("Team Work");
listCategory.add("Communication");
listCategory.add("Project managment");
listCategory.add("Design/Implementation");
listCategory.add("Profesionnal skills");

Iterator it = listCategory.iterator();

%>


<h1>Skills Managment</h1>


<p>
	<%=message %>
</p>

<ol>
	<%if(list!=null)
	{
		int i = 0;
		while (it.hasNext())
			{
			String valueCat =(String) it.next();
			//if(x.getCategory().trim().equals(valueCat))
			%><br /><big><p style="color:red;">
			<%=valueCat %>
			</big></p><br />
			<%
			for( i=0; i<list.size();i++)	
			{
				if(list.get(i).getCategory().trim().equals(valueCat.trim()))
				{
				out.println("<li class=\"liste\"><span>"+list.get(i).getName()+"</span> <a href=\"/APPManager/SControllerCompetencies?action=deleteCompetencie&value="+list.get(i).getIdComp()+"\"><img src=\"/APPManager/images/RedCross.svg\" width=\"10\" height=\"10\"></img></a> <input type=\"checkbox\"  value=\""+list.get(i).getIdComp()+"\" class=\"addToAPP\" /></li> ");
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
			}
	}
	else 
	out.print("problem");%>
</ol>

<br />
<form  action="/APPManager/SControllerCompetencies" method="POST">


	<label for="Category">Under the category</label> <select
		name="Category" size="1">
		<option selected>Team Work
		<option>Communication
		<option>Project managment
		<option>Design/Implementation
		<option>Profesionnal skills
	</select> <br />
	
		
	</select> <br /> <br /> <label for="Name">Name</label> <input type="text"
		name="Name"> <br /> <br /> 
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level1">level1</label> <input type="text"
		name="level1"> <br /> <br /> 
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level2">level2</label> <input type="text"
		name="level2"> <br /> <br />
		 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level3">level3</label> <input type="text"
		name="level3"> <br /> <br /> 
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level4">level4</label> <input type="text"
		name="level4"> <br /> <br /> 
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level5">level5</label> <input type="text"
		name="level5"> <br /> <br /> 
		
		<label for="IsNeeded">Is
		needed to validate any module</label> <input type="checkbox" name="IsNeeded"
		value="yes" /> yes <br>
	<br /> <input type="submit" name="action" value="addcompetencies"
		name="submit" />


    
    
</form>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>

<script>
// On reprend le même id que dans le précédent chapitre

$(".addToAPP").click(function(){
     
    $.ajax({
       url : "SControllerCompetencies",
       type : "GET",
       data : {
		   action: "affectskills",
    	   idcomp: this.value,
    	 //  app: ,
    	   checked: this.checked
    	   }, 
       
       success : function(code_html, statut){
       },

       error : function(resultat, statut, erreur){
         
       },

       complete : function(resultat, statut){

       }

    });
   
});</script>