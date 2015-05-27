package MemberList;

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


@WebServlet("/MemberListMain")
public class MemberListMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListMain() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doDisplayPage(request,response);
		redirection(request, response, "./MemberList.jsp");
	}
	private void doDisplayPage(HttpServletRequest request,
			HttpServletResponse response) {
		
	}
	
	
	protected void redirection(HttpServletRequest request, HttpServletResponse response, String page) 
	{
	}
	


}
