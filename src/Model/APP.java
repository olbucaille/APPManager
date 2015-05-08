package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;
//model de l'app
public class APP {

	//Idde l'APP
	private String IdAPP;
	//nom de l'app de type "electronique ou electronique 2015,;...)
	private String name; 
	//debut de l'app
	private String StartDate;
	//fin de l'app
	private String EndDate;


	public APP(String IdAPP, String Name, Object startDate, Object EndDate) {
		//start/End non implementé
		this.IdAPP = IdAPP;
		this.name = Name;

	}



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


	public static void addOrReplaceAPPUser(String IdUser, String IdAPP)
	{
		String req = "INSERT INTO user_appsession(idapp,idutilisateur) VALUES(\""+IdAPP+"\", \""+IdUser+"\")";
		try {
			AccesBD.getInstance().executeUpdate(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public static List<APP> GetAllAPP()
	{
		ArrayList<APP> array= new ArrayList<APP>();
		ResultSet rs = null ;
		try {
			String req = "SELECT idAPP,Type FROM appsession; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);


			if(rs!= null)
			{
				while(rs.next()){
					array.add( new APP(rs.getString("idAPP"), rs.getString("Type"), null, null));

				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//	System.out.println(array.get(0).getName());
		return array;

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

	public String getIdAPP() {
		return IdAPP;
	}



	public void setIdAPP(String idAPP) {
		IdAPP = idAPP;
	}


}