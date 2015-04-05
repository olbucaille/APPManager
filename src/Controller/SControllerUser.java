package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.StringProvider;
import Model.User;

/**
 * Servlet implementation class SControllerUser
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
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String login = request.getParameter("login");
		String pass = request.getParameter("pass");
		
		User user =User.isGranted(login, pass);
		if(user != null)
		{
			HttpSession session = request.getSession();
			session.setAttribute( StringProvider.getNom(), "NONAME");
			session.setAttribute(StringProvider.getType(), user.getType());
			session.setAttribute( StringProvider.getNumber(), user.getNumber());
			session.setAttribute(StringProvider.getPrenom(), user.getNom());
		}
		redirection(request, response, "/Test.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request,response);
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
