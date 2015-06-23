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
			getServletContext().getRequestDispatcher("/html/student/MemberList.jsp").forward(request, response);
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
		
	}
	


}
//STEP 1. Import required packages

/*public class JDBCExample {
 // JDBC driver name and database URL
 static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
 static final String DB_URL = "jdbc:mysql://localhost/STUDENTS";

 //  Database credentials
 static final String USER = "username";
 static final String PASS = "password";
 
 public static void main(String[] args) {
 Connection conn = null;
 Statement stmt = null;
 try{
    //STEP 2: Register JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    //STEP 3: Open a connection
    System.out.println("Connecting to a selected database...");
    conn = DriverManager.getConnection(DB_URL, USER, PASS);
    System.out.println("Connected database successfully...");
    
    //STEP 4: Execute a query
    System.out.println("Creating statement...");
    stmt = conn.createStatement();

    String sql = "SELECT id, first, last, age FROM Registration";
    ResultSet rs = stmt.executeQuery(sql);
    //STEP 5: Extract data from result set
    while(rs.next()){
       //Retrieve by column name
       int id  = rs.getInt("id");
       int age = rs.getInt("age");
       String first = rs.getString("first");
       String last = rs.getString("last");

       //Display values
       System.out.print("ID: " + id);
       System.out.print(", Age: " + age);
       System.out.print(", First: " + first);
       System.out.println(", Last: " + last);
    }
    rs.close();
 }catch(SQLException se){
    //Handle errors for JDBC
    se.printStackTrace();
 }catch(Exception e){
    //Handle errors for Class.forName
    e.printStackTrace();
 }finally{
    //finally block used to close resources
    try{
       if(stmt!=null)
          conn.close();
    }catch(SQLException se){
    }// do nothing
    try{
       if(conn!=null)
          conn.close();
    }catch(SQLException se){
       se.printStackTrace();
    }//end finally try
 }//end try
 System.out.println("Goodbye!");
}//end main
}//end JDBCExample */

