package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
 * sert à gerer tous ce qui à rapport à l'objet competencies ( voir en BDD)
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
	 * coordone les appels en fonction de la requete
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//System.out.println("enter control cmp");
	
		String RequestString =(String) request.getParameter("action");
		System.out.println(RequestString);
		if(RequestString.equals("CompetenciesManagmentPage"))
		{
			doDisplayPageCompetenciesManagment(request,response);
		}
		else  if(RequestString.equals("addcompetencies"))
		{
			doAddCompetencies(request,response);
		}
		else if(RequestString.equals("deleteCompetencie"))
		{
		
			String value = (String) request.getParameter("value");
			
			if(value == null)
				value ="";
				Competencies.deleteCompetencies(value);
				doDisplayPageCompetenciesManagment(request,response);
			
		}
	}
	//ajoute une compétence
	//existe une verifiavtion des champs
	private void doAddCompetencies(HttpServletRequest request,
			HttpServletResponse response) {
		//!!!!!!!!!!!!ici pas de control d'identitée
		//+ verifier que la compétence n'existe pas ::
		String isneeded =null;
		String name = (String)request.getParameterValues(StringProvider.getCompName())[0];
		try{
		 isneeded  = (String)request.getParameterValues("IsNeeded")[0];
		}
		catch(NullPointerException e)
		{
			isneeded = null;
		}
		String mothercomp = (String)request.getParameterValues(StringProvider.getCompMothercomp())[0];
		String category = (String)request.getParameterValues(StringProvider.getCompCategory())[0];
		
		if(isneeded == null)
			isneeded = "false";
			else
				isneeded = "true";
		
		System.out.println(name+isneeded+mothercomp);
		Competencies c = new Competencies(null,name,null,Boolean.parseBoolean(isneeded),category,mothercomp);
		System.out.println(c.toString());
		Competencies.AddCompetency(c);
		doDisplayPageCompetenciesManagment(request, response);
		
	}

	//affiche la page des compétences ( donc chargement via bdd avant)
	//note : est appelée lorsque l'on ajoute une compétence
	private void doDisplayPageCompetenciesManagment(HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession s = request.getSession();
		String Type = (String) s.getAttribute(StringProvider.getNumber());
		System.out.println(Type);
		Map<String, Boolean> map = User.checkPrivileges(Type);
		if(map.get("IsModuleManager"))
		{
			//get all competencies,
		//OKAY	//get all competencies relative to module of the module manager via app session
			//get all competencies without mother for list 
			//forward to competencies management to display
			
			List<Competencies> arrayCompWithoutMother = Competencies.GetCompetenciesWithoutMother();
			List<Competencies> arrayCompWithMother = Competencies.GetCompetenciesWithMother();
			
			request.setAttribute("compToListChoice", arrayCompWithoutMother);
			request.setAttribute("compToDisplay", arrayCompWithMother);
			
			
			try {
		//		init();
			
				getServletContext().getRequestDispatcher("/html/moduleManager/CompetenciesManagment.jsp").forward(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			//note : need to implementestt quite quick the affectation by the admin, module manager and tutor in order to get a proper BDD
			//note 2 : need to quick link together the functionals chains !!! ( forward the pages, connexion,...) it is curently quite a mess
			//		to implement a proper test environnement...
		}
		else
		redirection(request, response, "./test.jsp");
	
		
	}

	//methode générique de redirection
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
