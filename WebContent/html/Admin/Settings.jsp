<%@page import="java.util.List"%>
<%@page import="Model.APP"%>
<%@page import="Model.Team"%>
<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="/html/Layout.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="/APPManager/css/left_menu.css">
	<link rel="stylesheet" type="text/css"
	href="/APPManager/css/css_admin/admin.css">


<div id="title">SETTINGS</div>

<div class="leftmenubox">
	<ul class="leftmenu">
		<li id="leftmenubox_title"><a id="leftmenu_title">Module Creator</li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref"
			href="javascript:accessAPP()">APP Creator</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref"
			href="javascript:accessTeam()">Team Creator</a></li>
		<li id="leftmenubox_tab"><a id="leftmenu_ref"
			href="javascript:accessAffect()">Linker</a></li>
	</ul>
</div>

<div id="block-central">

	<%
		List<APP> list = (List) request.getAttribute("ListOfAllAPP");
		List<Team> listTeam = (List) request.getAttribute("ListOfAllTeam");
		List<User> listUser = (List) request.getAttribute("ListOfAllUser");
		String message = (String)  request.getAttribute("message"); 
		if (message ==null )
			message = "";
	%>
	<p>
		<%=message%>
	</p>
	<div id="block-accessAPP">
		<div
			style="height: 200px; width: 47.2%; margin: 1% 0 1% 1.6%">
			<form action="/APPManager/SControllerAPP" method="POST">


				<br /> <label for="APPType">APP Type : </label> <input type="text"
					name="APPType"> <br /> <br /> <label for="StartDate">Start
					Date : </label> <input type="text" name="StartDate" class="datepicker">
				<br /> <br /> <label for="EndDate">End Date : </label> <input
					type="text" name="EndDate" class="datepicker"> <br /> <br />
				<input type="submit" name="action" value="add APP session"
					name="submit" />



			</form>
		</div>
	</div>

	<div id="block-accessTeam">
		<div
			style="height: 200px; width: 47.2%; margin: 1% 0 1% 1.6%;">
			<form action="/APPManager/SControllerTeam" method="POST">


				<br /> <label for="TeamName">Team Name : </label> <input
					type="text" name="TeamName"> <br /> <br /> <label
					for="APPOfTheTeam">APP Name : </label> <select name="APPOfTheTeam"
					size="1">
					<option selected>none
						<%
						if(list!=null)
														{
													int i = 0;
													for( i=0; i<list.size();i++)	
														out.println("<option value=\""+list.get(i).getIdAPP()+"\">"+list.get(i).getName());		    
														}
					%>
					
				</select> <br /> <br /> <input type="submit" name="action"
					value="add Team session" name="submit" />



			</form>
		</div>
	</div>


	<!-- rajouter une colonne liste des eleves
	--------------------------------profs
	----------------------------des app courants
	on selectionne les eleves, profs, l'app et cela les ajoute dans la table user-app
	avant tout ça lorsque l'on se connecte on doit verifier si il existe dans la base locale et sinon l'ajouter -->


	<div>


		<div id="block-accessAffect">
			<BIG><B>Associate the users</B></BIG> <BR>

			<form name="formulaire"
				action="/APPManager/SControllerUser?action=associate" method="POST">

				<TABLE>
					<TR>
						<TD align="center"><B><FONT size="2">All the User
									by name, id and current status</FONT></B><BR /> <br /> <select align=top
							name="liste1" size=15 style="width: 250px" multiple="multiple">
								<%
									if(listUser!=null)
																									{
																								int i = 0;
																								for( i=0; i<listUser.size();i++)	
																									out.println("<option value=\""+listUser.get(i).getNumber()+"\">"+listUser.get(i).getNomFamille()+" "+listUser.get(i).getPrenom()+" "+listUser.get(i).getNumber()+" "+listUser.get(i).getType() );		    
																									}
								%>

						</select></TD>
						<TD align="center"><INPUT type="button" value="Ajouter >>>"
							onClick="Deplacer(this.form.liste1,this.form.liste2)"> <BR>
							<BR> <INPUT type="button" value="&lt;&lt;&lt; Enlever"
							onClick="Deplacer(this.form.liste2,this.form.liste1)"></TD>
						<TD align="center"><FONT size="2"><B>User To
									affect and change</B></FONT><BR> <SELECT align=top name="liste2"
							size=15 style="width: 250px" multiple="multiple">
								<OPTION value="10">----------------------</OPTION>
						</SELECT></TD>
					</TR>
				</TABLE>
				<SCRIPT language="javascript">
					document.formulaire.liste2.options.length = 0;
				</SCRIPT>

				<!--                        DATA                             -->

				<label for="APPOfTheUser">APP Name (Only if module manager)
					: </label> <select name="APPOfTheUser" size="1">
					<option selected>none
						<%
						if (list != null) {
							int i = 0;
							for (i = 0; i < list.size(); i++)
								out.println("<option value=\"" + list.get(i).getIdAPP()
										+ "\">" + list.get(i).getName());
						}
					%>
					
				</select> <label for="TeamOfUser">Team Name : </label> <select
					name="TeamOfUser" size="1">
					<option selected>none

						<!--TEAM -->

						<%
							if (listTeam != null) {
								int i = 0;
								for (i = 0; i < listTeam.size(); i++)
									out.println("<option value=\""
											+ listTeam.get(i).getIdTeam() + "\">"
											+ listTeam.get(i).getName());
							}
						%>
					
				</select> <label for="Role">Role : </label> <select name="Role" size="1">
					<option selected>none
					<option>Student
					<option>Tutor
					<option>Module Manager
				</select> <input type="submit" name="action" value="Modify association"
					name="submit" />





			</FORM>
		</div>
	</div>


</div>
<script type="text/javascript"
	src="/APPManager/js/admin-js.js"></script>

<jsp:include page="/html/Layout_foot.jsp"></jsp:include>