package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Evaluation;

/**
 * Servlet implementation class SNewEvaluation
 */
@WebServlet("/SNewEvaluation")
public class SNewEvaluation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SNewEvaluation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String name;
		String type;
		String date;
		String comment;
		
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<BODY>");
		out.println("<H1> new evaluation saved</H1>");	
		name = request.getParameter("name");
		type = request.getParameter("type");
		date = request.getParameter("date");
		comment = request.getParameter("comment");
		out.println("name :"+name);
		out.println("<br>");
		out.println("type :"+type);
		out.println("<br>");
		out.println("date :"+date);
		out.println("<br>");
		out.println("comment :"+comment);
		out.println("<br>");
		out.println("</BODY></HTML>");
		out.close();
		
		Evaluation myEval = new Evaluation("",name,type,date,comment);
		Evaluation.AddEvaluation(myEval);
		
		redirection(request,response,"./html/teacher/Evaluation_teacher.jsp");
	}
	
	//methode g�n�rique de redirection
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
