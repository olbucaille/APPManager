package Model;

import java.sql.SQLException;

import BDDManager.AccesBD;

public class APP {
	
	private String name; 
	private String StartDate;
	private String EndDate;
	
	
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
