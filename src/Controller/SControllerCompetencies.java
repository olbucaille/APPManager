package Controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import Model.StringProvider;
import Model.User;

/**
 * Servlet implementation class SControllerCompetencies
 */
@WebServlet("/SControllerCompetencies")
public class SControllerCompetencies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SControllerCompetencies() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String RequestString =(String) request.getParameter("action");
		if(RequestString.equals("AjoutCompetenceTuteur"))
		{
			HttpSession s = request.getSession();
			String Type = (String) s.getAttribute(StringProvider.getNUMBER());
			System.out.println(Type);
			Map<String, Boolean> map = User.checkPrivileges(Type);
			if(map.get("IsModuleManager"))
			{
				//get all competencies,
				//get all competencies relative to module of the module manager via app session
				//forward to competencies management to display
				
				
				
				//note : need to implement quite quick the affectation by the admin, module manager and tutor in order to get a proper BDD
				//note 2 : need to quick link together the functionals chains !!! ( forward the pages, connexion,...) it is curently quite a mess
				//		to implement a proper test environnement...
			}
			else
			redirection(request, response, "./test.jsp");
				
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
