package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

import com.sun.org.apache.xpath.internal.operations.Bool;

public class Competencies {
	
	



	private String IdComp;
	private String Name;
	private String Desc;
	private Boolean Isnecessary;
	private String IdMother;
	
	public Competencies(String idComp, String name, String desc,
			Boolean isnecessary, String idMother) {


		IdComp = idComp;
		Name = name;
		Desc = desc;
		Isnecessary = isnecessary;
		IdMother = idMother;
	}
	
	
	
	
	public String getIdComp() {
		return IdComp;
	}




	public void setIdComp(String idComp) {
		IdComp = idComp;
	}




	public String getName() {
		return Name;
	}




	public void setName(String name) {
		Name = name;
	}




	public static  void AddCompetency(Competencies cp)
	{
		try {
			String req = "INSERT INTO competencies(Name, Description, Isnecessary, IdMother) VALUES (\""+cp.Name+"\", \""+cp.Desc+"\", \""+cp.Isnecessary+"\", \""+cp.IdMother+"\")";
			System.out.println(req);
			AccesBD.getInstance().executeUpdate(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//System.out.println("finadd");
	}
	
	public static List<Competencies> GetCompetenciesWithoutMother()
	{
		ArrayList<Competencies> array= new ArrayList<Competencies>();
		ResultSet rs = null ;
		try {
			String req = "SELECT idComp,Name FROM competencies WHERE idMother = \"none\" OR idMother = null; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				array.add( new Competencies(String.valueOf(rs.getInt("idComp")), rs.getString("Name"), null, null, null));
				
			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;

	}

	
	@Override
	public String toString() {
		return "Competencies [IdComp=" + IdComp + ", Name=" + Name + ", Desc="
				+ Desc + ", Isnecessary=" + Isnecessary + ", IdMother="
				+ IdMother + "]";
	}
}
