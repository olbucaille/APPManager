package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.sun.crypto.provider.RSACipher;

import BDDManager.AccesBD;
import BDDManager.LDAPObject;
import BDDManager.LDAPaccess;
//model de user, héritage de LDAP avec un media (phto) et des methodes) 
public class User extends LDAPObject {

	
	private Media picture;
	
	//public constructor that fit the data provided by LDAP
	private User(String login, String password, String nom, String nomFamille, String prenom, String type, String numero, String mail)
	{
		super( login,  password,  nom,  nomFamille,  prenom,  type, numero, mail);
	}
	
	
	

	public void setPicture (Media p)
	{
		picture = p;
	}

	@Override
	public String toString() {
		return "User [picture=" + picture + ", nom=" + nom + ", nomFamille="
				+ nomFamille + ", prenom=" + prenom + ", login=" + login
				+ ", password=" + password + ", mail=" + mail + "]";
	}
	
	//ajoute user en fonction de son attibut eleve ou tueteur
	public static void AddUser(User user,  boolean student, boolean tutor )
	{
		try {
			
			if(student)
				AccesBD.getInstance().executeUpdate("INSERT INTO User(`IdUtilisateur`, `Nom`, `Prenom`, `Email`, `Actif`, `IsStudent`, `IsTutor`, `IsModuleManager`, `IsAdmin`) VALUES (\""+user.getNumber()+"\", \""+user.getNom()+"\", \""+user.getPrenom()+"\", \""+user.getMail()+"\", 1,1,0,0,0)");
			else if(tutor)
				AccesBD.getInstance().executeUpdate("INSERT INTO User(`IdUtilisateur`, `Nom`, `Prenom`, `Email`, `Actif`, `IsStudent`, `IsTutor`, `IsModuleManager`, `IsAdmin`) VALUES (\""+user.getNumber()+"\", \""+user.getNom()+"\", \""+user.getPrenom()+"\", \""+user.getMail()+"\", 1,0,1,0,0)");
			else
				AccesBD.getInstance().executeUpdate("INSERT INTO User(`IdUtilisateur`, `Nom`, `Prenom`, `Email`, `Actif`, `IsStudent`, `IsTutor`, `IsModuleManager`, `IsAdmin`) VALUES (\""+user.getNumber()+"\", \""+user.getNom()+"\", \""+user.getPrenom()+"\", \""+user.getMail()+"\", 1,0,0,0,0)");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//ask to LDAP if user is connected if yes, it return the user, otherwise it return NULL
	public static User isGranted(String id, String pass)
	{
		//POUR REAL // LDAPObject obj= new LDAPObject();
		//POUR REAL //LDAPaccess acc = new LDAPaccess();
		/*try {
			obj = acc.LDAPget(id, pass);
		} catch (Exception e) {
			return null;
		}*///POUR REAL
		
	//POUR REAL //User user = new User(obj.login,obj.password,obj.nom,obj.nomFamille,obj.prenom,obj.getType(),obj.getNumber(),obj.getMail());
		//POUR TEST
		User user = new User("tototest","toto","tata","titi","tutu","professeur","4245","toto.tutu@isep.fr");
		
		System.out.println(user.toString());
		return user;
	}
	
	// exeptions non testé
	public static Map<String,Boolean> checkPrivileges(String id)
	{
		ResultSet rs = null;
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		try {
			rs = AccesBD.getInstance().executeQuery("SELECT IsStudent, IsTutor, IsModuleManager,IsAdmin FROM USER WHERE IdUtilisateur = \""+id+"\"");
		//	System.out.println(("SELECT IsStudent, IsTutor, IsModuleManager,IsAdmin FROM USER WHERE IdUtilisateur = \""+id+"\""));
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			rs.next();

			map.put("IsStudent", (rs.getInt(1)==1)?true:false);
			map.put("IsTutor", (rs.getInt(2)==1)?true:false);
			map.put("IsModuleManager", (rs.getInt(3)==1)?true:false);
			map.put("IsAdmin", (rs.getInt(4)==1)?true:false);

		} catch (SQLException e) {
			map.put("IsStudent", false);
			map.put("IsTutor", false);
			map.put("IsModuleManager", false);
			map.put("IsAdmin", false);
		}
return map;

	}
}
