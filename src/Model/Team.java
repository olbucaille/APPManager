package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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


 


		public Team(String idTeam,String idAPP, String name) {
			super();
			IdAPP = idAPP;
			this.name = name;
			this.IdTeam = idTeam;
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
		
		public static List<Team> GetAllTeam()
		{
			ArrayList<Team> array= new ArrayList<Team>();
			ResultSet rs = null ;
			try {
				String req = "SELECT idTeam,IdAPP,Name FROM team; ";
				System.out.println(req);
				rs = AccesBD.getInstance().executeQuery(req);
			
			
			if(rs!= null)
			{
				while(rs.next()){
					array.add( new Team(rs.getString("idTeam"),rs.getString("idAPP"), rs.getString("Name")));
					
				}
			}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//	System.out.println(array.get(0).getName());
			return array;

		}





		public String getIdTeam() {
			return IdTeam;
		}





		public void setIdTeam(String idTeam) {
			IdTeam = idTeam;
		}





		public String getIdAPP() {
			return IdAPP;
		}





		public void setIdAPP(String idAPP) {
			IdAPP = idAPP;
		}





		public String getName() {
			return name;
		}





		public void setName(String name) {
			this.name = name;
		}

		
		
}	
