package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.StringProvider;

/**
 * Servlet implementation class SControllerMain
 * is a dispatcher for all requests it forward to the correct specialized servlet of the controller module
 * !!!!!!!!!!!!!!!!!!!!!!!!!!Classe de moins en moins utiliser, encore utile, ou � supp ? 
 */
@WebServlet("/SControllerMain")
public class SControllerMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SControllerMain() {
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
	
		String RequestString = StringProvider.getWelcome();
		RequestString =(String) request.getParameter("action");
		
		switch (RequestString) {
        case "welcome":
        	  redirection(request, response, "/index."); // ne marche pas, donner l'adresse correcte de page d'acceuil
            break;
        case "CompetenciesManagmentPage":
      	 new SControllerCompetencies().doGet(request, response);
          break;
        case "addcompetencies":
        	System.out.println("addcmp");
         	 new SControllerCompetencies().doGet(request, response);
             break;
          
       
        default:
            redirection(request, response, "/index."); // ne marche pas, donner l'adresse correcte de page d'acceuil
            
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
