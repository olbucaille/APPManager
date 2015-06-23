<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="Model.Competencies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="/html/Layout.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="/APPManager/css/left_menu.css">
<link rel="stylesheet" type="text/css"
	href="/APPManager/css/css_mm/modulemanager.css">

<div id="title">SETTINGS</div>

<div class="leftmenubox">
	<ul class="leftmenu">
		<li id="leftmenubox_title"><a id="leftmenu_title">Skills
				Managment</li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref"
			href="javascript:access1()">Team Work</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref"
			href="javascript:access2()">Communication</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref"
			href="javascript:access3()">Project Managment</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref"
			href="javascript:access4()">Design/Affectation</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref"
			href="javascript:access5()">Professionnal skills</a></li>
	</ul>
</div>

<div id="block-central">
	<%
		List<Competencies> listWM = (List) request.getAttribute("compToDisplay");
	List<Competencies> list = (List) request.getAttribute("compToListChoice");
	List<String> arrayCompOfApp = (List) request.getAttribute("arrayCompOfApp");

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
	<ol>
		<%
			if(list!=null)
			{
				int i = 0;
				int num = 1;
				while (it.hasNext())
			{
			String valueCat =(String) it.next();
			//if(x.getCategory().trim().equals(valueCat))
		%>
		<div id="block<%=num%>">
			<%
				num++;
			%>
			<big><p style="color: red;">
					<%=valueCat%>
				</p></big>
			<%
				for( i=0; i<list.size();i++)	
				{
					if(list.get(i).getCategory().trim().equals(valueCat.trim()))
					{

						System.out.println("test select zone : "+arrayCompOfApp.size());

						if(arrayCompOfApp.contains(list.get(i).getIdComp()))
						{

							System.out.println("ENTER SELECT ZONE");

					out.println("<li class=\"liste\"><span>"+list.get(i).getName()+"</span> <a href=\"/APPManager/SControllerCompetencies?action=deleteCompetencie&value="+list.get(i).getIdComp()+"\"><img src=\"/APPManager/images/RedCross.svg\" width=\"10\" height=\"10\"></img></a> <input type=\"checkbox\"  value=\""+list.get(i).getIdComp()+"\" class=\"addToAPP\" checked></li> ");
						
						}else
					out.println("<li class=\"liste\"><span>"+list.get(i).getName()+"</span> <a href=\"/APPManager/SControllerCompetencies?action=deleteCompetencie&value="+list.get(i).getIdComp()+"\"><img src=\"/APPManager/images/RedCross.svg\" width=\"10\" height=\"10\"></img></a> <input type=\"checkbox\"  value=\""+list.get(i).getIdComp()+"\" class=\"addToAPP\" ></li> ");
						
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
			%>
		</div>
		<%
			}
			}
			else 
			out.print("problem");
		%>

	</ol>

	<div style="top: 100px; right: 30px; position: fixed;">
		<form action="/APPManager/SControllerCompetencies" method="POST">


			<label for="Category">Under the category</label> <select
				name="Category" size="1">
				<option selected>Team Work
				<option>Communication
				<option>Project managment
				<option>Design/Implementation
				<option>Profesionnal skills
			</select> <br /> </select> <br /> <br /> <label for="Name">Name</label> <input
				type="text" name="Name"> <br /> <br />

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level1">level1</label>
			<input type="text" name="level1"> <br /> <br />

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level2">level2</label>
			<input type="text" name="level2"> <br /> <br />

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level3">level3</label>
			<input type="text" name="level3"> <br /> <br />

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level4">level4</label>
			<input type="text" name="level4"> <br /> <br />

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="level5">level5</label>
			<input type="text" name="level5"> <br /> <br /> <label
				for="IsNeeded">Is needed to validate any module</label> <input
				type="checkbox" name="IsNeeded" value="yes" /> yes <br> <br />
			<input type="submit" name="action" value="addcompetencies"
				name="submit" />




		</form>
	</div>
</div>
<jsp:include page="/html/Layout_foot.jsp"></jsp:include>
<script type="text/javascript" src="/APPManager/js/modulemanager-js.js"></script>

<script>
		// On reprend le même id que dans le précédent chapitre

		$(".addToAPP").click(function() {

			$.ajax({
				url : "SControllerCompetencies",
				type : "GET",
				data : {
					action : "affectskills",
					idcomp : this.value,
					//  app: ,
					checked : this.checked
				},

				success : function(code_html, statut) {
				},

				error : function(resultat, statut, erreur) {

				},

				complete : function(resultat, statut) {

				}

			});

		});
	</script>