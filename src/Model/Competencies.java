package Model;

import java.sql.SQLException;

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

		System.out.println("finadd");
	}

	
	@Override
	public String toString() {
		return "Competencies [IdComp=" + IdComp + ", Name=" + Name + ", Desc="
				+ Desc + ", Isnecessary=" + Isnecessary + ", IdMother="
				+ IdMother + "]";
	}
}
