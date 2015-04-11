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

import Model.Competencies;
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
	System.out.println("enter control cmp");
		
		String RequestString =(String) request.getParameter("action");
		System.out.println(RequestString);
		if(RequestString.equals("CompetenciesManagmentPage"))
		{
			HttpSession s = request.getSession();
			String Type = (String) s.getAttribute(StringProvider.getNumber());
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
		else  if(RequestString.equals("addcompetencies"))
		{
			//!!!!!!!!!!!!ici pas de control d'identitée
			//+ verifier que la compétence n'existe pas ::
			
			String name = (String)request.getParameterValues(StringProvider.getCompName())[0];
			String isneeded  = (String)request.getParameterValues("IsNeeded")[0];
			String mothercomp = (String)request.getParameterValues(StringProvider.getCompMothercomp())[0];
			
			if(isneeded == null)
				isneeded = "false";
				else
					isneeded = "true";
			
			System.out.println(name+isneeded+mothercomp);
			Competencies c = new Competencies(null,name,null,Boolean.parseBoolean(isneeded),mothercomp);
			System.out.println(c.toString());
			Competencies.AddCompetency(c);
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
