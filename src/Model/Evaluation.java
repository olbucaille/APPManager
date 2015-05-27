package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

public class Evaluation {
	
	//identifiant de l'evalaution
	private String ID_evaluation;
	//nom de l'évalaution (court)
	private String Name;
	//desciption de l'évalaution
	private String Type;
	//date de l'évalaution
	private String Date;

	
	
	//contructeur
	public Evaluation(String ID_evaluation, String Name, String Type,String Date) {


		this.setID_evaluation(ID_evaluation);
		this.setName(Name);
		this.setType(Type);
		this.setDate(Date);
	}
	

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getID_evaluation() {
		return ID_evaluation;
	}

	public void setID_evaluation(String iD_evaluation) {
		ID_evaluation = iD_evaluation;
	}
	

	//ajout d'une evalaution, simple requte
		public static  void AddEvaluation(Evaluation cp)
		{
			try {
				String req = "INSERT INTO evaluation(Name, Type, Date) VALUES (\""+cp.Name+"\", \""+cp.Type+"\", \""+cp.Date+"\")";
				System.out.println(req);
				AccesBD.getInstance().executeUpdate(req);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			//System.out.println("finadd");
		}
		
	
	public static List<Evaluation> GetEvaluation()
	{
		List<Evaluation> evalList= new ArrayList<Evaluation>();
		ResultSet rs = null ;
		try {
			String req = "SELECT ID_evaluation,Name,Type,Date FROM evaluation ; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				evalList.add( new Evaluation(String.valueOf(rs.getString("ID_evaluation")), rs.getString("Name"), rs.getString("Type"), rs.getString("Date")));				
			
				System.out.println(new Evaluation(String.valueOf(rs.getString("ID_evaluation")), rs.getString("Name"), rs.getString("Type"), rs.getString("Date")).toString());			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return evalList;

	}

	
	@Override
	public String toString() {
		return "Evaluation [ID_evaluation=" + ID_evaluation + ", Name=" + Name + ", Type="
				+ Type + ", Date=" + Date + "]";
	}


}
