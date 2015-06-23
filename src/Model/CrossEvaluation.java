package Model;

import java.sql.ResultSet;
import java.sql.SQLException;

import BDDManager.AccesBD;

public class CrossEvaluation {
	//identifiant de l'evalaution
			private String iD_crossEvaluation;
	//identifiant de l'evalaution
		private String iD_evaluation;
		//nom de l'évalaution (court)
		private String id_user;
		//ref de l'évalaution
		private String idTeam;
		//date de l'évalaution
		private String date;
		//commentaire
		private String comment;

		
		
		//contructeur
		public CrossEvaluation(String iD_crossEvaluation,String iD_evaluation, String id_user,String idTeam,String date, String comment) {

			this.setiD_crossEvaluation(iD_crossEvaluation);
			this.iD_evaluation=iD_evaluation;
			this.id_user=id_user;
			this.setIdTeam(idTeam);
			this.date=date;
			this.setComment(comment);
		}
		

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}
	
		public String getId_user() {
			return id_user;
		}

		public void setId_user(String id_user) {
			this.id_user = id_user;
		}

		public String getID_evaluation() {
			return iD_evaluation;
		}

		public void setID_evaluation(String iD_evaluation) {
			this.iD_evaluation = iD_evaluation;
		}
		


		//ajout d'une evalaution, simple requte
			public static  boolean crossEvaluationIsAlreadyDone(String IdEval ,String idUser )
			{
				ResultSet rs = null ;
				String IdCrossEval=null;
				try {
					String req = "SELECT * FROM `cross_evaluation` WHERE id_evaluation = \""+IdEval+"\" and Id_User =\""+idUser+"\"";
					System.out.println(req);
					rs = AccesBD.getInstance().executeQuery(req);
					if(rs!= null)
					{
						
						while(rs.next()){
							return true;						
						}
												
						
					}else
						return false;
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				return false;
			}
			

		//ajout d'une evalaution, simple requte
			public static  void AddCrossEvaluationMark(String IdCrassEval , String idEvaluator,String idEvaluated ,String mark,String IdCategory)
			{
				ResultSet rs = null ;
				String IdCrossEval=null;
				try {
					String req = "INSERT INTO cross_evaluation_mark(ID_evaluation,ID_user_evaluator, ID_user_evaluated, Mark,ID_category) VALUES (\""+IdCrassEval+"\", \""+idEvaluator+"\", \""+idEvaluated +"\", \""+mark+"\", \""+IdCategory+"\")";
					System.out.println(req);
					AccesBD.getInstance().executeUpdate(req);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			
	//ajout d'une evalaution, simple requte
		public static  String AddCrossEvaluation(CrossEvaluation cp)//id de l'évaluation dans la table evaluation
		{
			ResultSet rs = null ;
			String IdCrossEval=null;
			try {
				String req = "INSERT INTO cross_evaluation(id_evaluation,id_User, ID_team, Date,Comment) VALUES (\""+cp.getID_evaluation()+"\", \""+cp.getId_user()+"\", \""+cp.getIdTeam()+"\", \""+cp.getDate()+"\", \""+cp.getComment()+"\")";
				System.out.println(req);
				AccesBD.getInstance().executeUpdate(req);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				String req = "SELECT LAST_INSERT_ID()";
				System.out.println(req);
				rs = AccesBD.getInstance().executeQuery(req);
					
				if(rs!= null)
				{
					while(rs.next()){
						IdCrossEval = rs.getString("LAST_INSERT_ID()");								
					}
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "-1";
			}
			return IdCrossEval;
			
			
			
			//System.out.println("finadd");
		}


		public String getIdTeam() {
			return idTeam;
		}


		public void setIdTeam(String idTeam) {
			this.idTeam = idTeam;
		}


		public String getiD_crossEvaluation() {
			return iD_crossEvaluation;
		}


		public void setiD_crossEvaluation(String iD_crossEvaluation) {
			this.iD_crossEvaluation = iD_crossEvaluation;
		}


		public String getComment() {
			return comment;
		}


		public void setComment(String comment) {
			this.comment = comment;
		}
		
		
	

}
