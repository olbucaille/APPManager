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

/**
 * Servlet implementation class SControllerAPP
 * sert à gerer tous ce qui à rapport à l'objet APP ( voir en BDD)
 */
@WebServlet("/SControllerAPP")
public class SControllerAPP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SControllerAPP() {
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
	//Insert un APP en bdd et remontre les app en cours
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String RequestString =(String) request.getParameter("action");
		System.out.println(RequestString);
		if(RequestString!=null &&RequestString.equals("add APP session"))
		{
			//pas de verification des champs !!
		
			String type = (String)request.getParameterValues(StringProvider.getAppApptype())[0];
			String Sdate = (String)request.getParameterValues(StringProvider.getAppStartdate())[0];
			String Edate= (String)request.getParameterValues(StringProvider.getAppEnddate())[0];
			System.out.println(type+Sdate+Edate);
			APP.InsertAAPP(type, Sdate, Edate);
			
		}
		doShowSettings(request,response);
	}

	//redirige simplement vers les settings
	private void doShowSettings(HttpServletRequest request ,HttpServletResponse response) {
			HttpSession s = request.getSession();
			
			List<APP> ArrayALLAPP = APP.GetAllAPP();
				
				request.setAttribute("ListOfAllAPP", ArrayALLAPP);
				
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
