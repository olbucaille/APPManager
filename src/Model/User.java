package Model;

import BDDManager.LDAPObject;

public class User extends LDAPObject {

	
	private Media picture;
	
	//public constructor that fit the data provided by LDAP
	public User(String login, String password, String nom, String nomFamille, String prenom, String type, String numero, String mail)
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
	
	
	
}
