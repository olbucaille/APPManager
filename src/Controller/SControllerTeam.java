package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.APP;
import Model.StringProvider;
import Model.Team;
import Model.User;

/**
 * Servlet implementation class SControllerTeam
 */
@WebServlet("/SControllerTeam")
public class SControllerTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SControllerTeam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//Insert une Team en bdd et redirige vers Settings
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
			//pas de verification des champs !!
		
			String TeamName = (String)request.getParameterValues(StringProvider.getTeamTeamname())[0];
			String IdAPP = (String)request.getParameterValues(StringProvider.getTeamAppofteam())[0];
			Team.InsertATeam(IdAPP,TeamName);
			
		
		doShowSettings(request,response);
	}

	//redirige simplement vers les settings
	private void doShowSettings(HttpServletRequest request ,HttpServletResponse response) {
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

}
