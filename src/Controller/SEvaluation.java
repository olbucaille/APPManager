package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Competencies;
import Model.EvaluationForm;


/**
 * Servlet implementation class Evaluation
 */
@WebServlet("/SEvaluation")
public class SEvaluation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SEvaluation() {
        super();
         // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String evaluationId = request.getParameter("evaluationId");
		EvaluationForm myEval = (EvaluationForm) request.getSession().getAttribute(evaluationId);
		request.getSession().removeAttribute(evaluationId);

		for (Competencies comp : myEval.getCompetenciesInEvaluation()){
			String idComp = comp.getIdComp();
			myEval.setMarkToCompetencies(idComp, Integer.parseInt(request.getParameter(idComp)));;
			out.println(myEval.getMarkOfCompetencies(idComp));
			
		}	
		
		
		

	}

}
