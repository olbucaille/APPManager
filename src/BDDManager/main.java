package BDDManager;

import Model.User;

//classe de test 
//ne pas utiliser en temps normal
public class main {

	public static void main(String[] args) {
		LDAPObject obj= new LDAPObject();
		LDAPaccess acc = new LDAPaccess();
		try {
			obj = acc.LDAPget("obucaill", "!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//User user = new User(obj.login,obj.password,obj.nom,obj.nomFamille,obj.prenom,obj.getType(),obj.getNumber(),obj.getMail());
		//System.out.println(user.toString());
	}

}

