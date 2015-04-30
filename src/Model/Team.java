package Model;

import java.sql.SQLException;

import BDDManager.AccesBD;

public class Team {

	
	//Idde la team
			private String IdTeam;
	//Idde l'APP
		private String IdAPP;
		//nom dede la team
		private String name; 
		
		
		


		public Team(String idAPP, String name) {
			super();
			IdAPP = idAPP;
			this.name = name;
		}





		//permet d'ajouter une session avec les attributs de base 
		public static void InsertATeam(String IdAPP, String name)
		{
			String req = "INSERT INTO team(IdAPP,Name) VALUES(\""+IdAPP+"\", \""+name+"\")";
			try {
				AccesBD.getInstance().executeUpdate(req);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

}
