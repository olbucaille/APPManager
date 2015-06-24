package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.APP;
import Model.Attendance;
import Model.Competencies;

/**
 * Servlet implementation class SControllerAttendance
 */
@WebServlet("/SControllerAttendance")
public class SControllerAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SControllerAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String RequestString =(String) request.getParameter("action");
		System.out.println(RequestString);
		if(RequestString.equals("addSession"))
		{
			String IdTutor = (String) request.getParameter("idTutor");
			Attendance.addSession(IdTutor);
		}
		else  if(RequestString.equals("updateAttendance")){
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
