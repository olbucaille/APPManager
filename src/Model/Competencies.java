package Model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

import com.sun.org.apache.xpath.internal.operations.Bool;
//modele des comp�tences
public class Competencies implements Serializable{
	
	//identifiant de la comp�tence
	private String IdComp;
	//nom de la comp�tence (court)
	private String Name;
	//desciption de la competence
	private String Desc;
	//bool si il est necessaire de la valider pour avoir le module
	private Boolean Isnecessary;
	//identifiant de la comp�tence "m�re"
	private String IdMother;
	//cat�gorie ou famille
	private String Category;
	
	
	//contructeur
	public Competencies(String idComp, String name, String desc,
			Boolean isnecessary, String Category, String idMother) {


		IdComp = idComp;
		Name = name;
		Desc = desc;
		Isnecessary = isnecessary;
		this.Category = Category;
		IdMother = idMother;
	}
	
	
	
	
	public String getDesc() {
		return Desc;
	}




	public Boolean getIsnecessary() {
		return Isnecessary;
	}




	public String getCategory() {
		return Category;
	}




	public String getIdComp() {
		return IdComp;
	}


	public String getName() {
		return Name;
	}

	public String getIdMother() {
		return IdMother;
	}

//ajout de comp�tence, simple requte
	public static  void AddCompetency(Competencies cp)
	{
		try {
			String req = "INSERT INTO competencies(Name, Description, Isnecessary, Category,IdMother) VALUES (\""+cp.Name+"\", \""+cp.Desc+"\", \""+cp.Isnecessary+"\",\""+cp.Category+"\", \""+cp.IdMother+"\")";
			System.out.println(req);
			AccesBD.getInstance().executeUpdate(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//System.out.println("finadd");
	}
	

	//ressort toutes comp�tence 
	public static List<Competencies> GetAllCompetencies()
	{
		ArrayList<Competencies> array= new ArrayList<Competencies>();
		ResultSet rs = null ;
		try {
			String req = "SELECT idComp,Name,Description,Category,idMother FROM competencies ; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				array.add( new Competencies(String.valueOf(rs.getInt("idComp")), rs.getString("Name"), rs.getString("Description"), null, rs.getString("Category"),rs.getString("IdMother")));
				System.out.println(new Competencies(String.valueOf(rs.getInt("idComp")), rs.getString("Name"), null, null,null,rs.getString("idMother")).toString());
			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;

	}

	
	//ressort toutes comp�tence de "niveau 1" cad sans mere
	public static List<Competencies> GetCompetenciesWithoutMother()
	{
		ArrayList<Competencies> array= new ArrayList<Competencies>();
		ResultSet rs = null ;
		try {
			String req = "SELECT idComp,Name,Category FROM competencies WHERE idMother = \"none\" OR idMother = null; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				array.add( new Competencies(String.valueOf(rs.getInt("idComp")), rs.getString("Name"), null, null, String.valueOf(rs.getString("Category")), null));
				
			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array;

	}

	//ressort toutes les ocmp�tences de niv2 cad avec mere
	public static List<Competencies> GetCompetenciesWithMother() {
		ArrayList<Competencies> array= new ArrayList<Competencies>();
		ResultSet rs = null ;
		try {
			
			String req = "SELECT idComp,Name,idMother,Category FROM competencies WHERE idMother != \"none\" OR idMother != null; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				array.add( new Competencies(String.valueOf(rs.getInt("idComp")), rs.getString("Name"), null, null,String.valueOf(rs.getString("Category")),rs.getString("idMother") ));
				//System.out.println(new Competencies(String.valueOf(rs.getInt("idComp")), rs.getString("Name"), null, null,null,rs.getString("idMother")).toString());
			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return array;
	}

	
	public static void deleteCompetencies(String value) {
		
		try {
			String req = "delete from competencies where idComp= "+value+"";
			System.out.println(req);
			AccesBD.getInstance().executeUpdate(req);
			req = "delete from competencies where idMother= "+value+"";
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	@Override
	public String toString() {
		return "Competencies [IdComp=" + IdComp + ", Name=" + Name + ", Desc="
				+ Desc + ", Isnecessary=" + Isnecessary + ", IdMother="
				+ IdMother + "]";
	}




	public static int getACompetencies(String name) {
		ResultSet rs = null;
		String req = "SELECT idComp FROM competencies WHERE name=\""+name+"\" ; ";
		System.out.println(req);
		try {
			 rs = AccesBD.getInstance().executeQuery(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs.next();
			return rs.getInt("idComp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	
	}
	
	
	
	
	
	public static int getACompetenciesName(String name) {
		ResultSet rs = null;
		String req = "SELECT Name FROM competencies WHERE name=\""+name+"\" ; ";
		System.out.println(req);
		try {
			 rs = AccesBD.getInstance().executeQuery(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs.next();
			return rs.getInt("Name");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	
	}




	public static void addOrRemoveAPPCompetencies(String idcomp,
		
			String appTomanage, String checked) {
		
		String req = null;
		if (checked.equals("true"))
		{
			 req = "INSERT INTO app_competencies(IdAPP, idCompetencies) VALUES (\""+appTomanage+"\", \""+idcomp+"\")";
		}
		else 
		{
			req = "delete from app_competencies where IdAPP=\""+appTomanage+"\" AND idCompetencies = \""+idcomp+"\";";
		}
		
		System.out.println(req);
		try {
			AccesBD.getInstance().executeUpdate(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}




	public static List<String> GetCompetenciesOfAPP(String APP) {
		ArrayList<String> array= new ArrayList<String>();
		ResultSet rs = null ;
		try {
			
			String req = "SELECT idCompetencies  FROM app_competencies WHERE IdAPP = \""+APP+"\"; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				array.add( String.valueOf(rs.getInt("idCompetencies")));
				//System.out.println(new Competencies(String.valueOf(rs.getInt("idComp")), rs.getString("Name"), null, null,null,rs.getString("idMother")).toString());
			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return array;
	}




	




}
