package Model;

import BDDManager.LDAPObject;
import BDDManager.LDAPaccess;

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
	
	//ask to LDAP if user is connected if yes, it return the user, otherwise it return NULL
	public static User isGranted(String id, String pass)
	{
		LDAPObject obj= new LDAPObject();
		LDAPaccess acc = new LDAPaccess();
		try {
			obj = acc.LDAPget(id, pass);
		} catch (Exception e) {
			return null;
		}
		
		User user = new User(obj.login,obj.password,obj.nom,obj.nomFamille,obj.prenom,obj.getType(),obj.getNumber(),obj.getMail());
		System.out.println(user.toString());
		return user;
	}
	
	
}
