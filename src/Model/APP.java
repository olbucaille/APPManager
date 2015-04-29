package Model;

import java.sql.SQLException;

import BDDManager.AccesBD;
//model de l'app
public class APP {
	
	//nom de l'app de type "electronique ou electronique 2015,;...)
	private String name; 
	//debut de l'app
	private String StartDate;
	//fin de l'app
	private String EndDate;
	
	
	//permet d'ajouter une session avec les attributs de base 
	public static void InsertAAPP(String name, String StartDate, String EndDate)
	{
		String req = "INSERT INTO appsession(Type,StartDate,EndDate) VALUES(\""+name+"\", \""+StartDate+"\",\""+EndDate+"\")";
		try {
			AccesBD.getInstance().executeUpdate(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//getter, setter, rien de plus
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDate() {
		return StartDate;
	}
	public void setStartDate(String startDate) {
		StartDate = startDate;
	}
	public String getEndDate() {
		return EndDate;
	}
	public void setEndDate(String endDate) {
		EndDate = endDate;
	}
	
	

}
