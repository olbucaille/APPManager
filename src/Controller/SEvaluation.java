package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.AutoEvaluation;
import Model.Category;
import Model.Competencies;
import Model.CrossEvaluation;
import Model.Evaluation;
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
		PrintWriter out = response.getWriter();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		Enumeration allParameterNames = request.getParameterNames();	
	    Object object = allParameterNames.nextElement();
	    String param =  (String)object;
	    String value =  request.getParameter(param);
	    out.println("Parameter Name is '"+param+"' and Parameter Value is '"+value+"'");
	    out.println("<br>");
	    String id_user="4242";
		Evaluation eval = Evaluation.GetEvaluationWithID(value);
		// si c'est une évaluation croisée
		if (eval.getType().equals("cross")){
			
			System.out.println();
			String idCrossEval = CrossEvaluation.AddCrossEvaluation(new CrossEvaluation("",eval.getID_evaluation(), id_user, "1", dateFormat.format(date) , "comment"));
			out.println("idcross"+idCrossEval);
			List <Category> categoryList = Category.GetAllCategory();
			List<String> studentList= new ArrayList<String>();
			studentList.add("olivier");
			studentList.add("Rafael");
			studentList.add("arnaud");
			studentList.add("justin");
			int count =0;
			response.setContentType("text/html");	

			    for (Category family : categoryList) {	
			   		//afficher famille
			
			   		for (String student : studentList) {
			   			object = allParameterNames.nextElement();
					    param =  (String)object;
					    value =  request.getParameter(param);
					    out.println("student "+student+" Name is '"+param+"' and Parameter Value is '"+value+"'");
					    CrossEvaluation.AddCrossEvaluationMark(idCrossEval ,"1","1" ,value,family.getIdcategory());
					    out.println("<br>");
				   		count++;
			   		}	
			   	   //un commentaire par famille
			   		object = allParameterNames.nextElement();
				    param =  (String)object;
				    value =  request.getParameter(param);
				    out.println("commentaire Name is '"+param+"' and Parameter Value is '"+value+"'");
				    out.println("<br>");
				count++;
			   	}
			
			
			

		// si c'est une auto evalaution
		}else if(eval.getType().equals("auto")){
			String idAutoEval = AutoEvaluation.AddAutoEvaluation(new AutoEvaluation("",eval.getID_evaluation(), id_user, dateFormat.format(date)));
			List<Competencies> compList= Competencies.GetAllCompetencies();
		   	EvaluationForm eval1 = new EvaluationForm(compList);	
		  	int count=0;
		   	for (String family : eval1.getFamilyListInEvaluation()) {	
		   		//afficher famille
	
		   		for (Competencies comp_lvl1 : eval1.getCompetenciesInFamily(family)) {
		   			
		   			//afficher compétence
		   			object = allParameterNames.nextElement();
				    param =  (String)object;
				    value =  request.getParameter(param);
				    out.println("comp "+comp_lvl1.getName()+" Name is '"+param+"' and Parameter Value is '"+value+"'");
				    AutoEvaluation.AddAutoEvaluationMark(idAutoEval ,comp_lvl1.getIdComp(),value,id_user);
			   					count++;
		   			String idComp = comp_lvl1.getIdComp();
	
		    		for (Competencies comp_lvl2 : eval1.getUnderCompetenciesInCompetence(idComp)) {	
		    			//afficher les sous compétences
		 		 
		 					count++;
		    		}
		   		}	
		   	//un commentaire par famille
		   		object = allParameterNames.nextElement();
			    param =  (String)object;
			    value =  request.getParameter(param);
			    out.println("comment Name is '"+param+"' and Parameter Value is '"+value+"'");
			    
	   		count++;
		   	}
		   	
		}
		response.sendRedirect("/APPManager/SControllerStudentEvaluation");	
		out.close();
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
