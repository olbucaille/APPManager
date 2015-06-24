package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		

		
		public static void addOrReplaceTeamUser(String IdUser, String IdTeam)
		{
			String req = "INSERT INTO team_user(iduser,idteam) VALUES(\""+IdUser+"\", \""+IdTeam+"\")";
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

		// récupere la Idteam de l'utilisateur
				public static Team GetTeamWithId(String idTeam)
				{
					Team team = null;
					ResultSet rs = null ;
					try {
						String req = "SELECT * FROM team where IdTeam = \""+idTeam+"\"; ";
						System.out.println(req);
						rs = AccesBD.getInstance().executeQuery(req);
					
					
					if(rs!= null)
					{
						while(rs.next()){
							team= new Team(rs.getString("idTeam"),rs.getString("idAPP"), rs.getString("Name"));
							
						}
					}
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				//	System.out.println(array.get(0).getName());
					return team;

				}
		
// récupere la Idteam de l'utilisateur
		public static String GetIdTeamOfUser(String idUser)
		{
			String Idteam = null;
			ResultSet rs = null ;
			try {
				String req = "SELECT idteam,iduser FROM team_user where iduser = \""+idUser+"\"; ";
				System.out.println(req);
				rs = AccesBD.getInstance().executeQuery(req);
			
			
			if(rs!= null)
			{
				while(rs.next()){
					Idteam= rs.getString("idTeam");
					
				}
			}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//	System.out.println(array.get(0).getName());
			return Idteam;

		}
		
		// récupere la Idteam de l'utilisateur
		public static List<String> GetIdTeamsOfTutor(String idTutor)
		{
			List <String> Idteams = new ArrayList<String>();
			ResultSet rs = null ;
			try {
				String req = "SELECT idteam,iduser FROM team_user where iduser = \""+idTutor+"\"; ";
				System.out.println(req);
				rs = AccesBD.getInstance().executeQuery(req);
			
			
			if(rs!= null)
			{
				while(rs.next()){
					Idteams.add( rs.getString("idTeam"));
					
				}
			}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//	System.out.println(array.get(0).getName());
			return Idteams;

		}
		//récupert la liste des utlisateurs pour une équipe donnée
		public static List<User> GetTeamUsers(Team team)
		{
			
			ArrayList<User> array= new ArrayList<User>();
			ResultSet rs = null ;
			try {
				String req = "SELECT Nom,Prenom,IdUtilisateur FROM user WHERE IdUtilisateur IN"
						+ " (SELECT iduser FROM team_user WHERE idteam= \""+team.getIdTeam()+"\"); ";
				System.out.println(req);
				rs = AccesBD.getInstance().executeQuery(req);
			
			
			if(rs!= null)
			{
				while(rs.next()){
					String type=null;
					Map<String,Boolean> m =User.checkPrivileges(rs.getString("idUtilisateur"));
					if(m.get("IsStudent")){
						 type ="Student";
					}else if(m.get("IsTutor")){
						type ="Tutor";
					}else type="Student";
					array.add( new User(rs.getString("Nom"),rs.getString("Prenom"),rs.getString("idUtilisateur"),type));			
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
