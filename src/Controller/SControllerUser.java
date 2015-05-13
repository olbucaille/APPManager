package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BDDManager.AccesBD;
import Model.APP;
import Model.Competencies;
import Model.StringProvider;
import Model.Team;
import Model.User;

/**
 * Servlet implementation class SControllerUser
 * 
 * sert à gerer tous ce qui à rapport à l'objet User ( voir en BDD)
 */
@WebServlet("/SControllerUser")
public class SControllerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SControllerUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * ajoute un utilsisateur, à terme, l'enregistre dans la bdd si premiere connexion avec un statut de base modifié par la suite 
	 * par l'admin
	 * est ensuite redirigé dsur la page qui lui convient ( eleve, tuteur (et bon groupe chargé si besoin),....)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String action = (String) request.getParameter("action");


		if(action!= null &&action.equals("associate"))
		{
			String[] arrayUser =request.getParameterValues("liste2");
			String Team =request.getParameter("TeamOfUser");
			String APP =request.getParameter("APPOfTheUser");
			String Role = request.getParameter("Role");
			
			System.out.println(Team);
			System.out.println(APP);
			if(arrayUser != null)
			{
				for(int i=0;i<arrayUser.length;i++)
				{
					Team  t= new Team("","");
					if(Role.equals("Module Manager")) 
					{
						APP a = new APP("", "", "", "");
						a.addOrReplaceAPPUser(arrayUser[i],APP); //pas utile dans les autres cas, on connais par rapport au TEAM
						User.updatePriviledge(arrayUser[i],false,false,true,false);//si Module manager, alors on update que Module manager, sinon, c'est autres valeures sont écrasées...
					}
					
						t.addOrReplaceTeamUser(arrayUser[i],Team);
						
						if(Role.equals("Tutor")) 
							User.updatePriviledge(arrayUser[i],false,true,false,false);//si Module manager, alors on update que Module manager, sinon, c'est autres valeures sont écrasées...
						else if(Role.equals("Student")) 
							User.updatePriviledge(arrayUser[i],true,false,false,false);//si Module manager, alors on update que Module manager, sinon, c'est autres valeures sont écrasées...
						
					
					
				}
			}
			
		//	System.out.println(array[2]);
		//	System.out.println(request.getParameter("liste2"));
		}
		else
		{
			doStuffAuth(request,response);

		}
	}

	private void doStuffAuth(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String login = request.getParameter("login");
		String pass = request.getParameter("pass");

		User user =User.isGranted(login, pass);
		if(user != null)
		{
			HttpSession session = request.getSession();
			session.setAttribute( StringProvider.getNom(), user.getNomFamille());
			session.setAttribute( StringProvider.getType(), user.getType());
			session.setAttribute( StringProvider.getNumber(), user.getNumber());
			session.setAttribute( StringProvider.getPrenom(), user.getNom());
		}

		//!!!! il faudrai mettre en place le process qui renseigne au moins les gens étant élève comme Isstudent et gens professeur comme etant IsTutor
		// --->> MARCHE, a ajuster en fonction des strings de type que renvois le LDAP
		if(user.getType().equals("eleve"))
			User.AddUser(user, true,false);
		else if(user.getType().equals("professeur"))
			User.AddUser(user, false, true);

		//"algo de redirection en fonction du type
		Map<String, Boolean> map = User.checkPrivileges(user.getNumber());
		HttpSession session = request.getSession();
		session.setAttribute( StringProvider.getIsAdmin(), map.get("IsAdmin"));
		session.setAttribute( StringProvider.getIsModulemanager(), map.get("IsModuleManager"));
		session.setAttribute( StringProvider.getIsTutor(), map.get("IsTutor"));
		session.setAttribute( StringProvider.getIsStudent(), map.get("IsStudent"));

		if(map.get("IsAdmin"))
			redirectAdmin(request, response);
		else if(map.get("IsModuleManager"))
			response.sendRedirect("/APPManager/SControllerCompetencies?action=CompetenciesManagmentPage");
		else if(map.get("IsTutor"))
			response.sendRedirect("/APPManager/html/teacher/Profile_teacher.jsp");
		else if(map.get("IsStudent"))
			response.sendRedirect("/APPManager/html/student/Profile.html");
		else
			response.sendRedirect("/APPManager/index.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}


	protected void redirectAdmin(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession s = request.getSession();

		List<APP> ArrayALLAPP = APP.GetAllAPP();

		request.setAttribute("ListOfAllAPP", ArrayALLAPP);
		
		List<Team> ArrayALLTeam = Team.GetAllTeam();

		request.setAttribute("ListOfAllTeam", ArrayALLTeam);

		List<User> ArrayALLuser = User.GetAllUser();

		request.setAttribute("ListOfAllUser", ArrayALLuser);

		
		try {
			//		init();

			getServletContext().getRequestDispatcher("/html/Admin/Settings.jsp").forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void redirection(HttpServletRequest request, HttpServletResponse response, String page) 
	{
		try{
			getServletContext().getRequestDispatcher(page).forward(request, response);
		}
		catch(ServletException e)
		{

		}
		catch(IOException e)
		{

		}

	}

}
