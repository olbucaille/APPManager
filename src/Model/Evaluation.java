package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

public class Evaluation {
	
	//identifiant de l'evalaution
	private String iD_evaluation;
	//nom de l'évalaution (court)
	private String name;
	//desciption de l'évalaution
	private String type;
	//date de l'évalaution
	private String date;
	//commentaire
	private String comment;

	
	
	//contructeur
	public Evaluation(String iD_evaluation, String name, String type,String date, String comment) {


		this.iD_evaluation=iD_evaluation;
		this.name=name;
		this.type=type;
		this.date=date;
		this.comment=comment;
	}
	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		name = name;
	}

	public String getID_evaluation() {
		return iD_evaluation;
	}

	public void setID_evaluation(String iD_evaluation) {
		iD_evaluation = iD_evaluation;
	}
	

	//ajout d'une evalaution, simple requte
		public static  void AddEvaluation(Evaluation cp)
		{
			try {
				String req = "INSERT INTO evaluation(Name, Type, Date,Comment) VALUES (\""+cp.name+"\", \""+cp.type+"\", \""+cp.date+"\", \""+cp.comment+"\")";
				System.out.println(req);
				AccesBD.getInstance().executeUpdate(req);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			//System.out.println("finadd");
		}
		
		


		public static Evaluation GetEvaluationWithID(String idEval)
		{
			Evaluation eval=null;
			ResultSet rs = null ;
			try {
				String req = "SELECT ID_evaluation,Name,Type,Date,Comment FROM evaluation WHERE ID_evaluation = \""+idEval+"\" ; ";
				System.out.println(req);
				rs = AccesBD.getInstance().executeQuery(req);
			
			
			if(rs!= null)
			{
				while(rs.next()){
					eval = new Evaluation(String.valueOf(rs.getString("ID_evaluation")), rs.getString("Name"), rs.getString("Type"), rs.getString("Date"), rs.getString("Comment"));				
				
					System.out.println(new Evaluation(String.valueOf(rs.getString("ID_evaluation")), rs.getString("Name"), rs.getString("Type"), rs.getString("Date"), rs.getString("Comment")).toString());			}
			}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return eval;

		}
	
	
	public static List<Evaluation> GetEvaluation()
	{
		List<Evaluation> evalList= new ArrayList<Evaluation>();
		ResultSet rs = null ;
		try {
			String req = "SELECT ID_evaluation,Name,Type,Date,Comment FROM evaluation ; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				evalList.add( new Evaluation(String.valueOf(rs.getString("ID_evaluation")), rs.getString("Name"), rs.getString("Type"), rs.getString("Date"), rs.getString("Comment")));				
			
				System.out.println(new Evaluation(String.valueOf(rs.getString("ID_evaluation")), rs.getString("Name"), rs.getString("Type"), rs.getString("Date"), rs.getString("Comment")).toString());			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return evalList;

	}

	
	@Override
	public String toString() {
		return "Evaluation [ID_evaluation=" + iD_evaluation + ", Name=" + name + ", Type="
				+ type + ", Date=" + date + ", Comment=" + comment + "]";
	}


}
