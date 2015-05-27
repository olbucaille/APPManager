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

import java.sql.*;


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
		
		String RequestString =(String) request.getParameter("action");
		System.out.println(RequestString);
		doShowSettings(request,response);
		redirection(request, response, "./MemberList.jsp");
	}

	//redirige simplement vers les settings
	private void doShowSettings(HttpServletRequest request ,HttpServletResponse response) {
		HttpSession s = request.getSession();

		List<Team> ArrayALLTeam = Team.GetAllTeam();

		request.setAttribute("ListOfAllTeam", ArrayALLTeam);

		List<User> ArrayALLuser = User.GetAllUser();

		request.setAttribute("ListOfAllUser", ArrayALLuser);
		
		
		String query = "SELECT * FROM 'team_user'";

		try {
			String myUrl = "jdbc:mysql://APPManager/src/BDDManager";
			Connection conn = DriverManager.getConnection(myUrl, "root", "");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				String item = rs.getString("COF_NAME");}
			    } catch (SQLException e ) {} 
			

		
		try {

				
			//		init();
			getServletContext().getRequestDispatcher("/WEB-INF/MemberList.jsp").forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
		
	}
	

	
	public List findWithName(String name) {
		return em.createQuery("SELECT * FROM 'team_user'").getResultList();
		}

	
	protected void redirection(HttpServletRequest request, HttpServletResponse response, String page) 
	{
		
	}
	


}
